SELECT 
persons.Locatie,
count(CASE WHEN Votes.valid = 1 and persons.Status = 'Active' THEN 1 END ) as Votes
FROM persons
LEFT JOIN Votes
ON persons.ID = Votes.chosen_person
GROUP BY
persons.Locatie
;
