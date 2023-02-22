###
# IT-P Azure Architektur mit Terraform
###

 
Hier wird in Terraform die Bereitstellung einer Umgebung definiert, die eine Web-App und eine DB enthält - plus zugehörige Ressourcen wie Netz-Infrastruktur etc.


Features:

	- Es kann jetzt eine komplette Umgebung erstellt werden. 
	- Es gibt eine Möglichkeit, Scripte zu hinterlegen, um flexibel "Dinge" ausführen zu können (Powershell, SQL). 
	- Eine individuell programmierte App kann direkt hinterlegt (funktioniert) und installiert werden (in Arbeit)
	- Automatisierte Anlage der Datenbank zur App ist bereits vorgesehen
	- ggf können auch Daten via Script / Tabelle eingelesen werden (in Arbeit)
	
Ziel ist die Möglichkeit zur kurzfristigen Bereitstellung einer Test- / Demo-Umgebung zur Präsentation von durch IT-P entwickelte Software.
Alternativ auch gern als Grundlage für eine erste Kundenumgebung zu nutzen ( eine eigene kleine "Landing Zone" :-) )



# Status des Projekts

Ausgangsmaterial war ein Script aus einem Terraform Kurs bei Udemy. Dieses wurde deutlich erweitert und ergänzt. 
 
05.01.23

	ein unübersichtliches Script wurde in Teil-Scripts aufgesplitted.

09.01.23

	eine lose Folge von einzelnen Scripts wurde zu möglichst strukturierten Modulen umgewandelt, die sich deutlich besser / sinniger 
	verwalten lassen.
	
	vom lokalen Rechner nach GITHub überführt
	- Es sind noch Fehler / Ungereimtheiten vorhanden: Variablenzuordnung, Konsistenz der Benennung
	- Kommentare fehlen oder sind unvollständig
	- Die derzeitig genutzte MSSQL-DB muss getauscht werden zu einer Mongo-DB Dafür fehlt mir noch Info zu SKU, Anbindung etc

06.02.23

	Zur Sicherheit der Zugangsdaten wurde ein Verweis auf den Einsatz von Umgebungsvariablen zugefügt in "providers.tf"
	Eine implemente Mongo-DB wurde endlich zugefügt!
	
14.02.23 

	Einige Anpassungen vorgenommen, um Mongo zu unterstützen.
	
22.02.23
	
	diverse Vereinfachungen und Zusammenfassungen vorgenommen: Aufbau des Codes war zu komplex, um gut gelesen werden zu können.
	

