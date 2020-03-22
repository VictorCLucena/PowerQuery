//https://www.geradorcpf.com/algoritmo_do_cpf.htm

let validaCPF = (CPF as text) =>
    if 
                Text.Length(CPF) = 11
                and
                ( List.Contains(
                    {
                    "00000000000",
                    "11111111111",
                    "22222222222",
                    "33333333333",
                    "44444444444",
                    "55555555555",
                    "66666666666",
                    "77777777777",
                    "88888888888",
                    "99999999999"
                    }, CPF) = false)
            then
                let

                validador1 =

                Number.Mod(
                    ((Number.From(Text.ToList(CPF){0}) * 10 +
                    Number.From(Text.ToList(CPF){1}) * 9 +
                    Number.From(Text.ToList(CPF){2}) * 8 +
                    Number.From(Text.ToList(CPF){3}) * 7 +
                    Number.From(Text.ToList(CPF){4}) * 6 +
                    Number.From(Text.ToList(CPF){5}) * 5 +
                    Number.From(Text.ToList(CPF){6}) * 4 +
                    Number.From(Text.ToList(CPF){7}) * 3 +
                    Number.From(Text.ToList(CPF){8}) * 2
                ) *10), 11),

                validador2 =

                Number.Mod(
                    ((Number.From(Text.ToList(CPF){0}) * 11 +
                    Number.From(Text.ToList(CPF){1}) * 10 +
                    Number.From(Text.ToList(CPF){2}) * 9 +
                    Number.From(Text.ToList(CPF){3}) * 8 +
                    Number.From(Text.ToList(CPF){4}) * 7 +
                    Number.From(Text.ToList(CPF){5}) * 6 +
                    Number.From(Text.ToList(CPF){6}) * 5 +
                    Number.From(Text.ToList(CPF){7}) * 4 +
                    Number.From(Text.ToList(CPF){8}) * 3 +
                    Number.From(Text.ToList(CPF){9}) * 2
                ) *10), 11),

                validador1n = if validador1 = 10 or validador2 = 11 then 0 else validador1,

                validador2n = if validador2 = 10 or validador2 = 11 then 0 else validador2,

                CPFvalido = if 
                                (validador1n = Number.From(Text.ToList(CPF){9}) and validador2n = Number.From(Text.ToList(CPF){10}) )
                                then "CPF Válido"
                                else "DOC Inválido"

                in

                CPFvalido



            else "DOC Inválido"


in
validaCPF