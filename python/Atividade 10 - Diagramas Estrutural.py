class atividade:
    def __init__(self, nome, descricao, data_entrega, nota):
        self.nome = nome
        self._descricao = descricao
        self._data_entrega = data_entrega
        self.__nota = nota

#função pra teste se os dados estão printando (dados ficticios.)
exibir_dados = atividade("Atividade Xtranha", "Isso é trap mixtape", "33/03/2033", 777666)

print(minha_atv.nome)
print(minha_atv._descricao)
print(minha_atv._data_entrega)
print(minha_atv.__nota)
