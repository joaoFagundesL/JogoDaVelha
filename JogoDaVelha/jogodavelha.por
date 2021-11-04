programa
{

	inclua biblioteca Util 
	caracter jogo[3][3]
	inteiro l, c,linha,coluna
	cadeia nome_jogadores[2]
	// linha=l coluna=c
	funcao inicio_jogo()
	{
		para(l=0;l<3;l++)
		{
			para(c=0;c<3;c++)
			{
				jogo[l][c]= ' ' 
			}
		}
	}
	funcao mostrar_tabuleiro()
	{
		//tabuleiro:
		escreva("\n\n 0   1    2\n\n") 
		para(l=0;l<3;l++)
		{
			para(c=0;c<3;c++)
			{
				escreva(" ",jogo[l][c])
				se(c<2) 
				{
					escreva(" | ")
				}
				se(c==2)
				{
					escreva("  ",l) 
				}
			}
			se(l<2) 
			{
				escreva("\n------------")
			}
			escreva("\n")
		}
	}
	funcao leitura_coordenadas(inteiro jogador)
	{
		faca{
				faca
				{
					se(jogador==1)
					{
						escreva("\nJogador ",nome_jogadores[0]," digite linha e coluna da posição desejada:\n")
						escreva("linha: ")
						leia(linha)
						escreva("coluna: ")
						leia(coluna)
					}
					se(jogador==2)
					{
						escreva("\nJogador ",nome_jogadores[1]," digite linha e coluna da posição desejada:\n")
						escreva("linha: ")
						leia(linha)
						escreva("coluna: ")
						leia(coluna)
					}
				}enquanto(linha<0 ou linha>2 ou coluna<0 ou coluna>2) 
			}enquanto(jogo[linha][coluna] != ' ')
	}
	funcao inteiro salvar_jogada (inteiro jogador)
	{
		se(jogador==1)
		{
			jogo[linha][coluna]='0'
		}
		senao 
		{
			jogo[linha][coluna]='X'	
		}
		retorne (1) 
	}
	funcao inteiro mudar_jogador (inteiro jogador)
	{
		se(jogador==1)
		{
			jogador=2 
		}
		senao 
		{
			jogador=1
		}
		retorne (jogador)
	}
	funcao inteiro ganhou_linha (caracter y)
	{
		para(l=0;l<3;l++)
		{
			se(jogo[l][0]==y e jogo[l][1]==y e jogo[l][2]==y)
			{
				retorne (1)
			}
		}
		retorne (0)
	}
	funcao inteiro quem_ganhou_linha()
	{
		se(ganhou_linha('0')==1)
		{
			retorne (1)
		}
		se(ganhou_linha('X')==1) 
		{
			retorne (2)
		}
		retorne(0)
	}
	funcao inteiro ganhou_coluna (caracter y)
	{
		para(c=0;c<3;c++)
		{
			se(jogo[0][c]==y e jogo[1][c]==y e jogo[2][c]==y)
			{
				retorne (1)
			}
		}
		retorne (0)
	}
	funcao inteiro quem_ganhou_coluna()
	{
		se(ganhou_coluna('0')==1)
		{
			retorne(1)
		}
		se(ganhou_coluna('X')==1)
		{
			retorne(2)
		}
		retorne(0)
	}
	funcao inteiro ganhou_diagonal_principal(caracter y)
	{
		se(jogo[0][0]==y e jogo[1][1]==y e jogo[2][2]==y) 
		{
			retorne(1)
		}
		retorne(0)
	}
	funcao inteiro quem_ganhou_diagonal_principal()
	{
		se(ganhou_diagonal_principal('0')==1)
		{
			retorne(1)
		}
		se(ganhou_diagonal_principal('X')==1)
		{
			retorne(2)
		}
		retorne(0)
	}
	funcao inteiro ganhou_diagonal_secundaria(caracter y)
	{
		se(jogo[0][2]==y e jogo[1][1]==y e jogo[2][0]==y)
		{
			retorne(1)
		}
		retorne(0)
	}
	funcao inteiro quem_ganhou_diagonal_secundaria()
	{
		se(ganhou_diagonal_secundaria('0')==1)
		{
			retorne(1)
		}
		se(ganhou_diagonal_secundaria('X')==1)
		{
			retorne(2)
		}
		retorne(0)
	}
	funcao inteiro repeticao_jogo(inteiro jogador, inteiro ganhou, inteiro jogadas)
	{
		faca 
		{
			limpa()
			mostrar_tabuleiro()
			
			leitura_coordenadas(jogador)
			
			//salvar coordenadas
			jogadas+=salvar_jogada(jogador)
			jogador = mudar_jogador(jogador)
			
			ganhou+=quem_ganhou_linha()
			ganhou+=quem_ganhou_coluna()
			ganhou+=quem_ganhou_diagonal_principal()
			ganhou+=quem_ganhou_diagonal_secundaria()
		}enquanto(ganhou==0 e jogadas<9)
		retorne (ganhou)
	}
	funcao vencedor (inteiro ganhou)
	{
		se(ganhou==1)//contador de vitorias do jogador 1 para o placar e mensagem de quem ganhou a partida
		{
			escreva("\nParabéns ",nome_jogadores[0],". Você ganhou!!!\n\n")
		}
		se(ganhou==2)//contador de vitoris do jogador 2 para o placar  e mensagem de quem ganhou a partida
		{
			escreva("\nParabéns ",nome_jogadores[1],". Você ganhou!!!\n\n")
		}
		se(ganhou==0)//mensagem de velha
		{
			escreva("\nNiguém ganhou deu velha!!!\n\n")
		}
	}
	funcao contador_placar (inteiro &v_jogador1, inteiro&v_jogador2, inteiro ganhou)
	{
		se(ganhou==1)
		{
			v_jogador1++
		}
		se(ganhou==2)
		{
			v_jogador2++
		}
		
	}
	funcao placar (inteiro v_jogador1, inteiro v_jogador2)
	{
		limpa()
		escreva("placar:\n")//placar
		escreva(nome_jogadores[0],": ",v_jogador1)
		escreva("\n vs \n")
		escreva(nome_jogadores[1],": ",v_jogador2)
	}
	funcao inteiro ganhador_comeca(inteiro ganhou,inteiro jogador)
	{
		se(ganhou==1)
		{
			jogador=1
		}
		se(ganhou==2)
		{
			jogador=2
		}
		retorne (jogador)
	}
	funcao jogo_2pessoas()
	{
		inteiro ganhou=0,jogadas=0,v_jogador1=0,v_jogador2=0,opcao,jogador=1
		
		
		faca
		{
			ganhou=0
			jogadas=0
			
			inicio_jogo()
			ganhou=repeticao_jogo(jogador,ganhou,jogadas)
			limpa()
			
			mostrar_tabuleiro()//tabuleiro
			
			vencedor(ganhou)//mensagem para o vencedor
			contador_placar(v_jogador1,v_jogador2,ganhou)
			jogador=ganhador_comeca(ganhou,jogador)
			escreva("Digite 1 para jogar novamente ou qualuqer outro número para sair: ")
			leia(opcao)
		}enquanto(opcao==1)
		placar(v_jogador1,v_jogador2)		
	}
	funcao leitura_coordenadas_computador(inteiro jogador)
	{
		faca{
				faca
				{
					se(jogador==1)
					{
						escreva("\nJogador ",nome_jogadores[0]," digite linha e coluna da posição desejada:\n")
						escreva("linha: ")
						leia(linha)
						escreva("coluna: ")
						leia(coluna)
					}
					senao//escolha pc (o pc vai ser o jogador 2)
					{
						linha=Util.sorteia(0, 2)
						coluna=Util.sorteia(0, 2)
					}
				}enquanto(linha<0 ou linha>2 ou coluna<0 ou coluna>2) 
			}enquanto(jogo[linha][coluna] != ' ')
	}
	funcao inteiro repeticao_jogo_computador(inteiro jogador, inteiro ganhou, inteiro jogadas)
	{
		faca 
		{
			limpa()
			mostrar_tabuleiro()
			
			leitura_coordenadas_computador(jogador)
			
			//salvar coordenadas
			jogadas+=salvar_jogada(jogador)
			jogador = mudar_jogador(jogador)
			
			ganhou+=quem_ganhou_linha()
			ganhou+=quem_ganhou_coluna()
			ganhou+=quem_ganhou_diagonal_principal()
			ganhou+=quem_ganhou_diagonal_secundaria() 
		}enquanto(ganhou==0 e jogadas<9)
		retorne (ganhou)
	}
	funcao vencedor_computador (inteiro ganhou)
	{
		se(ganhou==1)
		{
			escreva("\nParabéns ",nome_jogadores[0],". Você ganhou!!!\n\n")
		}
		se(ganhou==2)
		{
			escreva("\nO computador ganhou!!!\n\n")
		}
		se(ganhou==0)//mensagem de velha
		{
			escreva("\nNiguém ganhou deu velha!!!\n\n")
		}
	}
	funcao placar_computador (inteiro v_jogador1, inteiro v_jogador2)
	{
		limpa()
		escreva("placar:\n")//placar
		escreva(nome_jogadores[0],": ",v_jogador1)
		escreva("\n vs \n")
		escreva(nome_jogadores[1],": ",v_jogador2)
	}
	funcao jogo_computador()
	{
		inteiro ganhou=0,jogadas=0,v_jogador1=0,v_jogador2=0,opcao,jogador=1
		
		
		faca
		{
			ganhou=0
			jogadas=0
			
			inicio_jogo()
			ganhou=repeticao_jogo_computador(jogador,ganhou,jogadas)
			limpa()
			
			mostrar_tabuleiro()
			
			vencedor_computador(ganhou)
			contador_placar(v_jogador1,v_jogador2,ganhou)
			jogador=ganhador_comeca(ganhou,jogador)
			escreva("Digite 1 para jogar novamente ou qualquer outro número para sair: ")
			leia(opcao)
		}enquanto(opcao==1)
		placar_computador(v_jogador1,v_jogador2)		
	}
	
	funcao inicio()
	{
		inteiro x,jogar_outro_modo
		
		faca
		{
			escreva("        JOGO DA VELHA\n\n")
			escreva("       modo  de jogo       |   codigo\n")
			escreva("dois jogadores tradicional |      1\n")
			escreva("um jogador tradicional     |      2\n\n")
			escreva("agora selecione um modo de jogo usando o codigo: ") 
			leia(x)
			escolha(x)
			{
				caso 1:
					escreva("\nQual é o nome do jogador 1? (o jogador 1 será o 0)\n")
					leia(nome_jogadores[0])
					escreva("\nQual é o nome do jogador 2? (o jogador 2 será o X)\n")
					leia(nome_jogadores[1])
					jogo_2pessoas() //jogador 1 --> 0 e o jogador 2 --> X
					
				pare
				caso 2:
					escreva("\nQual é o nome do jogador 1? (o jogador 1 será o 0)\n")
					leia(nome_jogadores[0])
					nome_jogadores[1]="computador"
					escreva("\nO ",nome_jogadores[1]," será o X\n")
					jogo_computador() //jogador 1 --> 0 e o computador --> X
				pare
			}
			escreva("\n\nDigite 1 para jogar outro modo ou qualquer outro número para sair: ")
			leia(jogar_outro_modo)
		}enquanto(jogar_outro_modo==1)
	}
}
