require 'pg'
require 'logger'

logger = Logger.new('logfile.log') # Especifique o nome do arquivo de log desejado

begin
  conn = PG.connect(host:'haproxy', dbname: 'defaultdb', user: 'root', password: 'haproxy', port: 26257)

  while true do
    res = conn.exec('select now()')
    logger.info(res.getvalue(0, 0)) # Utilize o logger para registrar a saída
    sleep 1
  end

rescue PG::Error => e
  logger.error(e.message) # Utilize o logger para registrar erros
ensure
  conn.close if conn
end
