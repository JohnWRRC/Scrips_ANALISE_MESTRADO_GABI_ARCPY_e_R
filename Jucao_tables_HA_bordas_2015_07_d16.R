setwd("E:\\data_2015\\___john\\Gabi_mapeamento_2015_05_d28\\GRASS_EXTRACT_METRICAS\\__Resultados\\TXTs_EDGE")
rm(list = ls())
file=list.files()
file
Tabfinal<-NULL

for (i in file)
  {
  if (grepl("Bin",i))
    {
    Nomeaux1<-substr(i,1,9)
    NomeEsc<-substr(i,15,20)
    nome_final<-paste(Nomeaux1,NomeEsc,sep="_")
    x<-read.table(i,sep=',',header=T)
    x$Pai<-nome_final
    Tabfinal<-rbind(Tabfinal,x)
    
    }else
      {
        Nomeaux1<-substr(i,1,14)
        NomeEsc<-substr(i,40,45)
        nome_final<-paste(Nomeaux1,NomeEsc,sep="_")
        x<-read.table(i,sep=',',header=T)
        x$Pai<-nome_final
        Tabfinal<-rbind(Tabfinal,x)
        
      }
  
  
   }


wide <- reshape(Tabfinal, v.names = "HA", idvar = "COD",
                timevar = "Pai", direction = "wide")

write.table(wide,file= "Tabela_reshape.csv", sep = ",", row.names=F, append=F, quote=F, col.names=T) 



