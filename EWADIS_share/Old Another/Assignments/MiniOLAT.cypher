MATCH (n) DETACH DELETE n

MATCH (g:Group) -[:HAS_MEMBER]-> (p)
  RETURN g.name, count(p)
  ORDER BY g.name

MATCH (f:Forum) -[:HAS_TOPIC]-> (t) -[:HAS_REPLY*0..]-> () -[:HAS_AUTHOR]-> (p)
  RETURN t, collect(p)

CREATE
    (ewadis:Course {name:'Engineering Web and Data-intensive Systems', description:'Access to course material, examples, and discussion forum.'})

CREATE
    (forum:Forum {title:'EWADIS Discussions and Announcements', description:'Place to discuss questions'})

CREATE 
    (g1:Group {name:'ist-alpha'}),
    (g2:Group {name:'ist-bravo'}),
    (g3:Group {name:'ist-charlie'}),
    (g4:Group {name:'ist-delta'}),
    (g5:Group {name:'ist-echo'})

CREATE 
    (f0:Folder {name:'ewadis-2019', lastModified:date()}),
    (f0_1:Folder {name:'assignments', lastModified:date()}),
    (f0_2:Folder {name:'examples', lastModified:date()}),
    (f0_3:Folder {name:'lecture', lastModified:date()}),
    (f1:Folder {name:'ist-alpha', lastModified:date()}),
    (f2:Folder {name:'ist-bravo', lastModified:date()}),
    (f3:Folder {name:'ist-charlie', lastModified:date()}),
    (f4:Folder {name:'ist-delta', lastModified:date()}),
    (f5:Folder {name:'ist-echo', lastModified:date()})

CREATE 
    (a1:File {name:'assignment-01.pdf', location:'https://mini-olat.de/ewadis/files/2krEcx-AcEjW9-yz36NY.pdf', size: 73728, lastModified:date()}),
    (a2:File {name:'assignment-02.pdf', location:'https://mini-olat.de/ewadis/files/Zqrof4-nPnSnb-mtvIAc.pdf', size: 84992, lastModified:date()}),
    (a3:File {name:'assignment-03.pdf', location:'https://mini-olat.de/ewadis/files/PlFyHj-iX0oj7-xtabrq.pdf', size: 91136, lastModified:date()}),
    (a4:File {name:'assignment-04.pdf', location:'https://mini-olat.de/ewadis/files/2g8stm-voblhl-fawgjf.pdf', size: 118784, lastModified:date()})

CREATE 
    (p1:Person {firstName:'Volker', lastName:'Riediger', email:'vr@acme.edu'}),
    (p2:Person {firstName:'Mahmood', lastName:'Al-Doori', email:'md@acme.edu'}),
    (p3:Person {firstName:'Alice', lastName:'Cooper', email:'ac@acme.edu'}),
    (p4:Person {firstName:'Bob', lastName:'Dylan', email:'bd@acme.edu'}),
    (p5:Person {firstName:'Charlie', lastName:'Brown', email:'cb@acme.edu'}),
    (p6:Person {firstName:'Debbie', lastName:'Harry', email:'dh@acme.edu'})
  
CREATE
    (t1:DiscussionTopic {title: 'Lecture slides published', content:'', lastModified:date({ year:2019, month:10, day:15 }) }),
    (t2:DiscussionTopic {title: 'Group registration is open until November 17th', content:'', lastModified:date({ year:2019, month:11, day:06 })}),
    (t3:DiscussionTopic {title: 'Lecture on November 07th canceled', content:'', lastModified:date({ year:2019, month:11, day:07 })}),
    (t6:DiscussionTopic {title: 'test1', lastModified:date({ year:2019, month:11, day:19 })}),
    (t6_1:DiscussionTopic {title: 'test1', lastModified:date({ year:2019, month:11, day:19 })}),
    (t6_1_1:DiscussionTopic {title: 'test1', lastModified:date({ year:2019, month:11, day:19 })}),
    (t7:DiscussionTopic {title: '(UML) Modeling Tool', content:'', lastModified:date({ year:2019, month:11, day:25 })})

CREATE
    (forum) -[:HAS_TOPIC]-> (t1),
    (forum) -[:HAS_TOPIC]-> (t2),
    (forum) -[:HAS_TOPIC]-> (t3),
    (forum) -[:HAS_TOPIC]-> (t6),
    (forum) -[:HAS_TOPIC]-> (t7),

    (t6) -[:HAS_REPLY]-> (t6_1),
    (t6_1) -[:HAS_REPLY]-> (t6_1_1),

    (ewadis) -[:HAS_FORUM]-> (forum),
	
    (t1) -[:HAS_AUTHOR]-> (p1),
    (t2) -[:HAS_AUTHOR]-> (p1),
    (t3) -[:HAS_AUTHOR]-> (p1),
    (t6) -[:HAS_AUTHOR]-> (p3),
    (t6_1) -[:HAS_AUTHOR]-> (p5),
    (t6_1_1) -[:HAS_AUTHOR]-> (p6),
    (t7) -[:HAS_AUTHOR]-> (p1),

    (ewadis) -[:HAS_GROUP]-> (g1),
    (ewadis) -[:HAS_GROUP]-> (g2),
    (ewadis) -[:HAS_GROUP]-> (g3),
    (ewadis) -[:HAS_GROUP]-> (g4),
    (ewadis) -[:HAS_GROUP]-> (g5),

    (ewadis) -[:HAS_COURSE_FOLDER]-> (f0),
    (f0) -[:CONTAINS_ENTRY]-> (f0_1),
    (f0) -[:CONTAINS_ENTRY]-> (f0_2),
    (f0) -[:CONTAINS_ENTRY]-> (f0_3),
    (f0_1) -[:CONTAINS_ENTRY]-> (a1),
    (f0_1) -[:CONTAINS_ENTRY]-> (a2),
    (f0_1) -[:CONTAINS_ENTRY]-> (a3),
    (f0_1) -[:CONTAINS_ENTRY]-> (a4),

    (g1) -[:HAS_GROUP_FOLDER]-> (f1),
    (g2) -[:HAS_GROUP_FOLDER]-> (f2),
    (g3) -[:HAS_GROUP_FOLDER]-> (f3),
    (g4) -[:HAS_GROUP_FOLDER]-> (f4),
    (g5) -[:HAS_GROUP_FOLDER]-> (f5),

    (g2) -[:HAS_MEMBER]-> (p3),
    (g2) -[:HAS_MEMBER]-> (p4),
    (g2) -[:HAS_MEMBER]-> (p5),
    (g1) -[:HAS_MEMBER]-> (p6)
    
    
