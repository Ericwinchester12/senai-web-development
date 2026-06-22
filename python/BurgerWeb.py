import tkinter as tk
from tkinter import messagebox

# Funções que fazem as coisas funcionarem

# Essa função serve para somar o valor de tudo que o usuário marcou
def atualizar_preco():
    total = 0.0
    # Lista de tuplas para evitar o erro de 'unhashable type' com IntVar
    # Fiz essa lista com parzinhos (item, preço) porque o Python não aceitou usar o IntVar direto no dicionário
    tabela_precos = [
        (var_australiano, 5.00), (var_gergelim, 5.00), (var_brioche, 5.00),
        (var_hamburguer, 20.00),
        (var_cheddar, 3.00), (var_prato, 3.00), (var_provolone, 3.00),
        (var_gorgonzola, 4.00), (var_mussarela, 3.00), (var_parmesao, 4.50),
        (var_bacon, 4.00), (var_cebola, 3.50), (var_alface, 2.50),
        (var_tomate, 2.50), (var_maionese, 2.00), (var_picles, 3.00), (var_ovo, 3.00)
    ]

    # Percorre a lista e, se a caixinha tiver marcada, soma o valor no total
    for var, valor in tabela_precos:
        if var.get():
            total += valor
    
    # Essa linha pega o total e joga lá na telinha do rodapé. O replace troca ponto por vírgula no preço
    # Atualiza o texto lá no rodapé com o preço novo (muda o ponto por vírgula pra ficar bonito)
    lbl_preco.config(text=f"Preço Total: R$ {total:.2f}".replace(".", ","))

# Função do botão verde de finalizar
# O que acontece quando clica no botão "Finalizar"
def finalizar_pedido():
    # Validação de Pães: Deve ser exatamente 1
    # Aqui eu vejo se o cliente escolheu só UM pão. Não pode ser zero nem dois!
    total_paes = var_australiano.get() + var_gergelim.get() + var_brioche.get()
    
    if total_paes == 0:
        messagebox.showerror("ALERTA DE ERRO", "Você precisa escolher um tipo de pão!")
        return
    
    if total_paes > 1:
        messagebox.showerror("ALERTA DE ERRO", "Por favor, selecione apenas um tipo de pão.")
        return

    # Validação de Queijos: Máximo 3 conforme o banner
    # Regrinha do máximo de 3 queijos
    lista_queijos = [
        var_cheddar, var_prato, var_provolone, 
        var_gorgonzola, var_mussarela, var_parmesao
    ]
    total_queijos = sum(v.get() for v in lista_queijos)

    if total_queijos > 3:
        messagebox.showerror("LIMITE EXCEDIDO", "O limite máximo é de 3 tipos de queijo por lanche.")
        return

    # Se passou por todas as validações, finaliza
    # Se não deu erro em nada lá em cima, mostra a mensagem de sucesso
    messagebox.showinfo("Sucesso", "Pedido finalizado! Já estamos preparando seu lanche.")

# Configuração da janela principal
janela = tk.Tk()
janela.title("BurgerWeb - Autoatendimento")
janela.geometry("650x650") 

# Cabeçalho
# Esse Frame é tipo uma caixa pra segurar o logo e o botão de login alinhados
frame_cabecalho = tk.Frame(janela)
frame_cabecalho.pack(fill="x", padx=10, pady=10)

# Logo da empresa. Se quiser mudar a fonte ou o texto "[ LOGO BURGERWEB ]", é nessa linha!
lbl_logo = tk.Label(frame_cabecalho, text="[ LOGO BURGERWEB ]", font=("Arial", 14, "bold"))
lbl_logo.pack(side="left")

# Botão de Login. Se quiser maior, aumenta o número da fonte aqui
btn_login = tk.Button(frame_cabecalho, text="Login", font=("Arial", 10))
btn_login.pack(side="right")

# Banner de aviso
texto_banner = "Atenção: Não estamos trabalhando com X-Ratão no momento\ne não adicionamos mais do que 3 tipos de queijo."
# Pra mudar a cor de fundo do banner (bg) ou da letra (fg), mexe aqui. Tá "yellow" e "black".
lbl_banner = tk.Label(janela, text=texto_banner, font=("Arial", 11, "bold"), bg="yellow", fg="black")
lbl_banner.pack(fill="x", pady=10)

# Meio da tela (Ingredientes)
frame_centro = tk.Frame(janela)
frame_centro.pack(pady=10)

# Essas variáveis guardam 1 se a caixinha tiver marcada, e 0 se tiver desmarcada. 
# Variáveis que dizem se o item tá marcado (1) ou não (0)
var_australiano = tk.IntVar()
var_gergelim = tk.IntVar()
var_brioche = tk.IntVar()
var_hamburguer = tk.IntVar()
var_cheddar = tk.IntVar()
var_prato = tk.IntVar()
var_provolone = tk.IntVar()
var_gorgonzola = tk.IntVar()
var_mussarela = tk.IntVar()
var_parmesao = tk.IntVar()
var_bacon = tk.IntVar()
var_cebola = tk.IntVar()
var_alface = tk.IntVar()
var_tomate = tk.IntVar()
var_maionese = tk.IntVar()
var_picles = tk.IntVar()
var_ovo = tk.IntVar()

# Pães
tk.Label(frame_centro, text="1. Escolha seu Pão (Obrigatório):", font=("Arial", 11, "bold")).pack(anchor="w", pady=(10, 0))
# Se quiser mudar o texto que aparece na tela pro cliente, é no "text=". 
# O "command=atualizar_preco" faz a mágica de mudar o preço automático toda vez que clica na caixinha.
# Coloquei o command em todos pros preços mudarem na hora
tk.Checkbutton(frame_centro, text="Australiano (+ R$ 5,00)", variable=var_australiano, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Gergelim (+ R$ 5,00)", variable=var_gergelim, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Brioche (+ R$ 5,00)", variable=var_brioche, command=atualizar_preco).pack(anchor="w")

# Carne
tk.Label(frame_centro, text="2. Carne:", font=("Arial", 11, "bold")).pack(anchor="w", pady=(10, 0))
chk_hamb = tk.Checkbutton(frame_centro, text="Hambúrguer de 160g (+ R$ 20,00) - Padrão", variable=var_hamburguer, command=atualizar_preco)
chk_hamb.pack(anchor="w")
chk_hamb.select()
chk_hamb.config(state="disabled")

# Queijos
tk.Label(frame_centro, text="3. Queijos (Máximo 3):", font=("Arial", 11, "bold")).pack(anchor="w", pady=(10, 0))
tk.Checkbutton(frame_centro, text="Cheddar (+ R$ 3,00)", variable=var_cheddar, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Prato (+ R$ 3,00)", variable=var_prato, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Provolone (+ R$ 3,00)", variable=var_provolone, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Gorgonzola (+ R$ 4,00)", variable=var_gorgonzola, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Mussarela (+ R$ 3,00)", variable=var_mussarela, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Parmesão (+ R$ 4,50)", variable=var_parmesao, command=atualizar_preco).pack(anchor="w")

# Adicionais
tk.Label(frame_centro, text="4. Adicionais e Saladas:", font=("Arial", 11, "bold")).pack(anchor="w", pady=(10, 0))
tk.Checkbutton(frame_centro, text="Bacon (+ R$ 4,00)", variable=var_bacon, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Cebola Caramelizada (+ R$ 3,50)", variable=var_cebola, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Alface (+ R$ 2,50)", variable=var_alface, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Tomate (+ R$ 2,50)", variable=var_tomate, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Maionese Verde (+ R$ 2,00)", variable=var_maionese, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Picles (+ R$ 3,00)", variable=var_picles, command=atualizar_preco).pack(anchor="w")
tk.Checkbutton(frame_centro, text="Ovo (+ R$ 3,00)", variable=var_ovo, command=atualizar_preco).pack(anchor="w")

# Rodapé (Final da página)
frame_rodape = tk.Frame(janela)
frame_rodape.pack(side="bottom", fill="x", padx=20, pady=20)

# Aqui é o texto que mostra o total. Ele começa zerado no código, mas a gente atualiza ele rapidinho logo abaixo
lbl_preco = tk.Label(frame_rodape, text="Preço Total: R$ 0,00", font=("Arial", 16, "bold"))
lbl_preco.pack(side="left")

# Botão de finalizar verde! Se quiser mudar a cor, troca o "bg='green'"
btn_finalizar = tk.Button(frame_rodape, text="Finalizar Pedido", bg="green", fg="white", font=("Arial", 14, "bold"), command=finalizar_pedido)
btn_finalizar.pack(side="right")

# Essa linha chama a função de preço uma vez logo que abre, assim ele já cobra os R$ 20 do hambúrguer que tá marcado por padrão
# Chama uma vez aqui pra já começar com o preço da carne (que já tá marcada)
atualizar_preco()

# Esse comando faz a janela ficar aberta na tela rodando em loop (sem ele o programa abre e fecha na mesma hora)
# Mantém a janela rodando
janela.mainloop()