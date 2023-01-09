# CoE-Architektur:  IT-P Azure-Umgebung
Ausgangsmaterial war ein Script aus einem Terraform Kurs bei Udemy. Dieses wurde deutlich erweitert und ergänzt. Kann jetzt eine komplette Umgebung erstellen und teils sogar interaktiv Scripte etc nachladen, um flexibel zu sein.


Speziell: 
Hier wird in Terraform die Bereitstellung einer einfachen Umgebung definiert, die eine Web-App und eine DB enthält - plus zugehörige Ressourcen wie Netz-Infrastruktur etc.

Ziel ist die Möglichkeit zur kurzfristigen Bereitstellung einer Test- / Demo-Umgebung zur Präsentation von durch uns entwickelte Software.
Alternativ auch gern als Grundlage für eine erste kleine Kundenumgebung zu nutzen (Landing Zone)


Status des Projekts
1. ein unübersichtliches Script wurde in Teil-Scripts aufgesplitted.
2. eine lose Folge von einzelnen Scripts wurde zu möglichst strukturierten Modulen umgewandelt, die sich deutlich besser / sinniger verwalten lassen.
3. vom lokalen Rechner nach GITHub überführt
	- Es sind noch Fehler / Ungereimtheiten vorhanden
	- Kommentare fehlen oder sind unvollständig
	- Die derzeitig genutzte MSSQL-DB muss getauscht werden zu einer Mongo-DB Dafür fehlt mir noch Info zu SKU, Anbindung etc
