# SQL-EPICODE-PROGETTO-BUILD-WEEK
NELLA SETTIMANA FINALE DEL MODULO DI SQL SIAMO STATI DIVISI IN GRUPPI ED ABBIAMO LAVORATO SU UN PROGETTO. ERO TEAM LEADER DEL TEAM ARAGORN, SIAMO RIUSCITI A LAVORARE TUTTI INSIEME COLLABORANDO DALL'INIZIO ALLA FINE DEL PROGETTO E NEGLI ALLEGATI SI PUO' TROVARE IL RISULTATO DI QUANTO SIAMO RIUSCITI A FARE. DI SEGUITO LA TRACCIA DELLO STESSO.

LET’S GET DOWN TO BUSINESS!
Siete stati assunti! Avete un senior di riferimento che vi guida! Ma si è ammalato. Avete una settimana, senza di lui, per creare un DB che permetta alla VendiCose SpA, famosissima società che gestisce supermercati, di gestire il flusso degli ordini per i magazzini e i punti vendita ad essi associati.
Cosa sapete?
Ogni categoria di prodotto (ad esempio, “alimentari”, o “cosmetica”) ha un livello di restock associato ad ogni magazzino. Questo significa che, quando le unità di un prodotto appartenente ad una determinata categoria scendono sotto una determinata soglia, in un determinato magazzino, bisogna effettuare un nuovo ordine.
Per tenere traccia in modo dinamico della quantità di prodotto presente in ogni magazzino, ogni qualvolta viene effettuata una vendita in un determinato negozio vengono aggiornati i dati.
Sapete anche che ogni magazzino può servire più di un negozio.
Cosa dovete fare?
❏Progettazione e successivo schema ER della base dati. Ricordatevi di indicare le chiavi e le relazioni;
❏Creazione della base dati tramite DDL (Suggerimento: potete chiedere ad una GenAI di generare per voi i dati da inserire);
❏Scrittura delle query necessarie al funzionamento del sistema, in particolare:
○ Ogni qual volta un prodotto viene venduto in un negozio, qual è la query da eseguire per aggiornare le tabelle di riferimento?
○ Quali sono le query da eseguire per verificare quante unità di un prodotto ci sono in un dato magazzino e per monitorare le soglie di restock?
Tips:
❏ Il flusso base delle informazioni parte dalle singole transazioni, che avvengono in un negozio il quale è associato ad un determinato magazzino;
❏Costruite la base dati seguendo il principio della normalizzazione (e della minimizzazione della ridondanza dei dati): avrete bisogno di più tabelle oltre alle tre che vengono suggerite dal flusso qui sopra.
