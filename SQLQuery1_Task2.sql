SELECT 
persons.First_Name,
persons.Last_Name,
persons.Locatie,
count(CASE WHEN Votes.valid = 1 and persons.Status = 'Active' THEN 1 END ) as Votes,
STRING_AGG(CASE WHEN Votes.valid = 1 AND persons.Status = 'Active' THEN Votes.quality END, ', ') AS Quality

FROM persons
LEFT JOIN Votes
ON persons.ID = Votes.chosen_person
GROUP BY
persons.ID, persons.First_Name, persons.Last_Name, persons.Locatie
;