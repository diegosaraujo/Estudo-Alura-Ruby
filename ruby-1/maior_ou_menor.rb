def da_boas_vindas
    puts "Olá bem vindo ao jogo de adivinhação"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n"
    puts "Começaremos um novo jogo para você, #{nome}"
    puts "\n\n"
end

def pede_dificuldade
   puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
   dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end

    puts "Escolhendo um número entre 1 e #{maximo}"
    puts "Número secreto escolhido...Que tal adivinhar nosso número secreto?"
    sorteado = rand (maximo) + 1
    return sorteado
end

def pede_um_numero(chutes, tentativas, limite_tentativas)
    puts "Tentativa #{tentativas} de #{limite_tentativas}"
    puts "Tentativas já realizadas: #{chutes}"
    puts "Entre com um número"
    chute = gets.strip
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
     puts "Acertou!"
     return true
    end
     maior = numero_secreto > chute
     if maior
      puts "O número secreto é maior"
     else
      puts "O número secreto é menor"
     end
    return false
end

def joga (nome, dificuldade)
  numero_secreto = sorteia_numero_secreto(dificuldade)

  pontos_ate_agora = 1000
  limite_tentativas = 5
  chutes = []
  #total_de_chutes = 0

  for tentativas in 1..limite_tentativas
      chute = pede_um_numero chutes, tentativas, limite_tentativas
      chutes << chute

      pontos_a_perder = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora -= pontos_a_perder

      if verifica_se_acertou numero_secreto, chute
         break
      end

      puts "Você ganhou #{pontos_ate_agora} pontos"
  end
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  nao_quero_jogar = gets.strip
  nao_quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade
loop do
  joga nome, dificuldade
  if nao_quer_jogar?
    break
  end
end

