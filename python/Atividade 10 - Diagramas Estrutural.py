class atividade:
    def __init__(self, nome, descricao, data_entrega, nota):
        self.nome = nome
        self.descricao = descricao
        self.data_entrega = data_entrega
        self.nota = nota

#função pra teste se os dados estão printando (dados ficticios.)
minha_atv=atividade("Atividade Xtranha", "Isso é trap mixtape", "33/03/2033", 10)

print(minha_atv.nome)
print(minha_atv.descricao)
print(minha_atv.data_entrega)
print(minha_atv.nota)