
i need to keep in mind some points so lets think about a policies etc. 

## General thoughts
- certain things are active, or need to be kept at hand for a transition period or for reference, some for legal or tax reasons. 
- some items and information is 'nice to know i have it' but may be just indexed/scanned some note made and the file tucked away somewhere. 
- other things are duplicates, some files are versions of the same doc at various stages of it's editing. (The interesting point here is that especially in the case of contract and translations, a lot can be learned from the progression of edits if we have a the broader context of what is happening in negotiation, thinking, discussion and nuances of the language. Adapting and learning from these requires a lot of time and thought - not sure we can make it too sophisticated but perhaps in daily reflection i can capture or highlight key points.)
- files are in lots of formats. most show only be kept in original format in folders. so they are available for reference, copying and pasting etc. 
- for some files we could create notes summarizing contents, purpose etc. linked to the file (perhaps but difficult to track). 
## Guidelines
- key point is for:
	- index every file (MacOS does this well but linux this is where qmd comes in)
	- identify useful files or versions of files and vectorise them RAG with sqlite or qdrant - this was the point of creating the qdrant and redis setups in docker - to facilitate enhanced memory for agents. 
	- tag key people, ideas, companies, data. (including creating or updating notes within Obsidian and linking notes)
	- fast access from everywhere - ie my phone or MacBook or desktop or from asking Alfred to retreive a file for me .

- as a general rule i want to **keep everything**, and keep a record of where i put everything, or where i can find it. 

## Security and other issues.
I have a big concern with OneDrive. I get multiple access requests per day but have no way to know from where etc what i know is they are not from me. however, this same mechanism (the authenticator app) is used when i have valid need to access my own files. bad luck or bad timing could result in granting access to someone and game over. 

## Status and Plans
One Drive gives me up to 1 Tb of storage - but it is notorious for delete files with no way of recovery. I want to back up my 250 Gb (approx) of One Drive Files via the Linux desktop PC to an SSD drive. then sort through key 'active or relevant' files to be indexed, RAGed etc... a combination of business and personal - including from multiple companies i have worked with over the past 15 to 17 years.

I have multiple google drive accounts:
- one (diginoon) has additional storage (100 Gb i think - possible 200 Gb) - a mixture of personal and business. 
- davidgnoon has only 15 gb max available and is over half way. mostly personal stuff, some business / work. 
- davidnoon.aujml is over halfway. and is the most recent in terms of documents i need to keep
- david@adlcap has mostly adl and ICM related files - some other docs which can be great templates and references. occasionally still active but nothing much on a daily basis.

## Action Plan
### One Drive
First priority is to download and backup everything from ond drive to an external disk. 
1. Zip and download folders a few Gb at a time. backup zip directly to an external drive.
2. extract / download key and active or recent files to folders on this computer HD. 
3. Copy files to a long term cloud storage option like Amazon S3. 
4. Fire up the RAG processing and index everything with QMD. 
5. Extract key facts and add to Obsidian. 
6. Delete (over time ) files and folders from OneDrive which contain any personal or confidential information, or are not necessary to be kept there.

One Drive may remain relevant but only for work in progress and easy sync between devices. As i use Word and Excel a lot this is likely to continue being necessary. 
### Google Drive
Priority is to backup all the davidnoon.aujml files. sort and index them. 
1. download all davidnoon.aujml files to this computer. arrange into logical folders.
2. do RAG and index.
3. Extract key facts, contents of files into Obsidian. 
4. Backup files to long term storage (S3).
5. Delete duplicates along the way.

Other Google Drive accounts:
over time i will need to do the same with diginoon, david@adlcap and others.

## Open Questions:

Will I need to / should i convert certain word files to markdown? what about google docs to markdown? can these tasks be handled automatically? is it best to do that before RAG ingestion? 

How do I automate the collection and curation of contacts, contact 'related' content, facts, secrets, passwords, confidential information? 

HOW do we handle pictures? which model is cheap and BEST for image recognition / OCR and related tasks? 

How do we protect data, and backup the RAG and Vector data - daily, weekly monthly backups for data, configs and files etc? Must have a plan!

This is a very big task so we need to break down the work into achievable chunks. 
