format ELF64 executable

AF_INET equ 2
SOCK_STREAM equ 1
BACKLOG equ 5
PROTOCOL equ 0
STDOUT equ 1
STDERR equ 2
SUCCESS equ 0
ERRNO equ 1

;;db - 1 byte
;;dw - 2 byte
;;dd - 4 byte

macro write fd,buff,len
{
	mov rax, 1
	mov rdi, fd 
	mov rsi, buff
	mov rdx, len
	syscall
}

macro socket domain,type,protocol
{
	mov rax, 41
	mov rdi, domain
	mov rsi, type
	mov rdx, protocol
	syscall
}

macro bind sockfd,addr,addrlen
{
	mov rax, 49
	mov rdi, sockfd
	mov rsi, addr
	mov rdx, addrlen
	syscall
}

macro listen sockfd,backlog
{
	mov rax, 50
	mov rdi, sockfd
	mov rsi, backlog
	syscall
}

macro accept sockfd,addr,addrlen
{
	mov rax, 43
	mov rdi, sockfd
	mov rsi, addr
	mov rdx, addrlen
	syscall
}

macro exit code
{
	mov rax, 60
	mov rdi, code
	syscall
}

macro close fd
{
	mov rax, 3
	mov rdi, fd
	syscall
}

segment readable executable
entry main 
main:
	write STDOUT ,msg, msg_len
	socket AF_INET, SOCK_STREAM, PROTOCOL
	; socket 100,100,0
	cmp rax, 0
	mov qword [sockfd], rax
	jl error_s

	mov word [servaddr.sin_family], AF_INET
	mov word [servaddr.sin_port],14619 ;141619 is reverse hex of 6969  
	mov dword [servaddr.sin_addr], 0
	
	write STDOUT, bind_msg, bind_msg_len
	bind [sockfd], servaddr.sin_family , serv_add_len
	cmp rax, 0
	jl error_b
redo:
	write STDOUT, listen_msg, listen_msg_len
	listen [sockfd], BACKLOG
	cmp rax, 0	
	jl error_l
	
	write STDOUT, accept_msg, accept_msg_len
	accept [sockfd], clientaddr.sin_family , clientaddr_len
	cmp rax, 0
	jl error_a
	; write STDOUT, conf_msg, conf_msg_len
	
	mov qword [connfd], rax
	
	write [connfd], response , response_len

	jmp redo
	
	write STDOUT, ok_msg, ok_msg_len
	close [sockfd]
	close [connfd]
	exit SUCCESS
error_s:
	write STDERR , err_msg, err_msg_len
	close [sockfd]
	close [connfd]
	exit ERRNO
error_b:
	write STDERR , err_bind_msg, err_bind_msg_len
	close [sockfd]
	close [connfd]
	exit ERRNO
error_l:
	write STDERR , err_l_msg, err_l_msg_len
	close [sockfd]
	close [connfd]
	exit ERRNO
error_a:
	write STDERR , err_a_msg, err_a_msg_len
	close [sockfd]
	close [connfd]
	exit ERRNO

segment readable writeable

sockfd dq -1
connfd dq -1

struc sockaddr_in
{
	.sin_family dw 0
	.sin_port dw 0
	.sin_addr dd 0
	.sin_zero dq 0
}

servaddr sockaddr_in
serv_add_len = $-servaddr.sin_family
clientaddr sockaddr_in
clientaddr_len dd serv_add_len

response db "HTTP/1.1 200 OK", 13,10
         db "Content-Type: text/html ; charset = utf-8", 13,10
		 db "Connection: Closed", 13,10
		 db 13,10
		 db "<html><body><h1>HELLO WORLD</h1></body></html>", 10
response_len = $-response

msg db "INFO : CONNECTING SOCKET", 10
msg_len = $-msg
err_msg db "ERROR OCCOURED IN CREATING SOCKET , TRY AGAIN", 10
err_msg_len = $-err_msg

bind_msg db "INFO : BINDING SOCKET", 10
bind_msg_len = $-bind_msg

err_bind_msg db "ERROR OCCOURED IN BINDING SOCKET , TRY AGAIN", 10
err_bind_msg_len = $-err_bind_msg

listen_msg db "INFO : LISTENING SOCKET", 10
listen_msg_len = $-listen_msg

err_l_msg db "CANT ABLE TO LISTEN SOCKET , TRY AGAIN", 10
err_l_msg_len = $-err_l_msg

accept_msg db "INFO : ACCEPTING YOUR REQUEST..... HOLD ON!", 10
accept_msg_len = $-accept_msg

err_a_msg db "CANT ABLE TO ACCEPT REQUEST", 10
err_a_msg_len = $-err_a_msg

conf_msg db "INFO : REQUEST_ACCEPTED...", 10
conf_msg_len = $-conf_msg

ok_msg db "INFO : CLOSING SOCKET", 10
ok_msg_len = $-ok_msg
