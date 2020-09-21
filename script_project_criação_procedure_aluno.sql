DELIMITER //
	create procedure sp_insert_aluno(
		in nome varchar(100),
        in email varchar(100),
        in numero int
    )
	begin
		DECLARE idNow int unsigned default 0;
		if nome != '' and email != '' and (numero != '' or numero != 0) then    
			if not exists(select *from tbl_aluno where nomeAluno = nome) then
				start transaction;
					insert into tbl_aluno(nomeAluno,emailAluno,numeroAluno)
					Values (nome,email,numero);                
                    
                                        
					insert into tbl_notas(idAlunoNotas,nota1,nota2,nota3,media)
					Values (LAST_INSERT_ID(),default,default,default,default);
                    
					commit;													
			else
				select CONCAT('Aluno Já existe!') as 'ERROR OF INSERT';
				rollback;
			end if;
		else
			select CONCAT('Os dados não foram inseridos, verifique!') as 'ERROR OF INSERT';
			rollback;
		end if;
	end//
DELIMITER ;


SHOW TABLES;
SELECT DATABASE();