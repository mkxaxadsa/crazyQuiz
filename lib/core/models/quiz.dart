class Quiz {
  final String question;
  List<Answer> answers;
  Quiz({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String answer;
  final bool correct;
  bool green;
  bool red;
  Answer({
    required this.answer,
    required this.correct,
    this.green = false,
    this.red = false,
  });
}

List<Quiz> quizList = [
  Quiz(
    question: 'What does STEM stand for?',
    answers: [
      Answer(
        answer: 'Science, Technology, Economics, Mathematics',
        correct: false,
      ),
      Answer(
        answer: 'Science, Technology, Engineering, Mathematics',
        correct: true,
      ),
      Answer(
        answer: 'Sociology, Technology, Engineering, Mathematics',
        correct: false,
      ),
      Answer(
        answer: 'Science, Teaching, Engineering, Medicine',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question: 'Which of these is a famous theory of cognitive development?',
    answers: [
      Answer(
        answer: 'Pavlov\'s Theory',
        correct: false,
      ),
      Answer(
        answer: 'Vygotsky\'s Theory',
        correct: true,
      ),
      Answer(
        answer: 'Skinner\'s Theory',
        correct: false,
      ),
      Answer(
        answer: 'Maslow\'s Hierarchy Theory',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which amendment to the United States Constitution guarantees the right to a free public education?',
    answers: [
      Answer(
        answer: 'First Amendment',
        correct: false,
      ),
      Answer(
        answer: 'Fourth Amendment',
        correct: false,
      ),
      Answer(
        answer: 'Eighth Amendment',
        correct: false,
      ),
      Answer(
        answer: 'Fourteenth Amendment',
        correct: true,
      ),
    ],
  ),
  Quiz(
    question: 'Who developed the theory of multiple intelligences?  ',
    answers: [
      Answer(
        answer: 'Jean Piaget',
        correct: false,
      ),
      Answer(
        answer: 'Howard Gardner',
        correct: true,
      ),
      Answer(
        answer: 'Lev Vygotsky',
        correct: false,
      ),
      Answer(
        answer: 'Erik Erikson',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which educational philosophy emphasizes learning through practical experience and problem-solving?',
    answers: [
      Answer(
        answer: 'Behaviorism',
        correct: false,
      ),
      Answer(
        answer: 'Essentialism',
        correct: false,
      ),
      Answer(
        answer: 'Constructivism',
        correct: false,
      ),
      Answer(
        answer: 'Pragmatism',
        correct: true,
      ),
    ],
  ),
  Quiz(
    question: 'The Montessori method of education emphasizes:',
    answers: [
      Answer(
        answer: 'Discipline and obedience',
        correct: false,
      ),
      Answer(
        answer: 'Play-based learning',
        correct: false,
      ),
      Answer(
        answer: 'Socialization skills',
        correct: false,
      ),
      Answer(
        answer: 'Individualized learning and independence',
        correct: true,
      ),
    ],
  ),
  Quiz(
    question:
        'Which landmark Supreme Court case ruled that segregation in public schools was unconstitutional?',
    answers: [
      Answer(
        answer: 'Brown v. Board of Education',
        correct: true,
      ),
      Answer(
        answer: 'Plessy v. Ferguson',
        correct: false,
      ),
      Answer(
        answer: 'Roe v. Wade',
        correct: false,
      ),
      Answer(
        answer: 'Miranda v. Arizona',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Who proposed the idea of the Zone of Proximal Development (ZPD)?',
    answers: [
      Answer(
        answer: 'Lev Vygotsky',
        correct: true,
      ),
      Answer(
        answer: 'Jean Piaget',
        correct: false,
      ),
      Answer(
        answer: 'Erik Erikson',
        correct: false,
      ),
      Answer(
        answer: 'B.F. Skinner',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which of these is a principle of Universal Design for Learning (UDL)?',
    answers: [
      Answer(
        answer: 'One-size-fits-all instruction',
        correct: false,
      ),
      Answer(
        answer: 'Using only auditory learning methods',
        correct: false,
      ),
      Answer(
        answer:
            'Providing multiple means of representation, action, and expression',
        correct: true,
      ),
      Answer(
        answer: 'Focusing exclusively on rote memorization',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which psychologist is known for the theory of social development, including the stages of moral development?',
    answers: [
      Answer(
        answer: 'Erik Erikson',
        correct: false,
      ),
      Answer(
        answer: 'Jean Piaget',
        correct: false,
      ),
      Answer(
        answer: 'Lawrence Kohlberg',
        correct: true,
      ),
      Answer(
        answer: 'Lev Vygotsky',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question: 'In the context of education, what does IEP stand for?',
    answers: [
      Answer(
        answer: 'Individualized Education Plan',
        correct: true,
      ),
      Answer(
        answer: 'International Educational Protocol',
        correct: false,
      ),
      Answer(
        answer: 'Integrated Educational Program',
        correct: false,
      ),
      Answer(
        answer: 'Instructional Enhancement Plan ',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Who is known for the theory of classical conditioning in learning?',
    answers: [
      Answer(
        answer: 'John Dewey',
        correct: false,
      ),
      Answer(
        answer: 'B.F. Skinner',
        correct: false,
      ),
      Answer(
        answer: 'Ivan Pavlov',
        correct: true,
      ),
      Answer(
        answer: 'Albert Bandura',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which educational approach focuses on a curriculum centered around students\' interests and experiences?',
    answers: [
      Answer(
        answer: 'Essentialism',
        correct: false,
      ),
      Answer(
        answer: 'Progressivism',
        correct: true,
      ),
      Answer(
        answer: 'Perennialism',
        correct: false,
      ),
      Answer(
        answer: 'Reconstructionism',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question: 'What does the acronym ESL stand for in education?',
    answers: [
      Answer(
        answer: 'English as a Second Language',
        correct: true,
      ),
      Answer(
        answer: 'Extended Student Learning',
        correct: false,
      ),
      Answer(
        answer: 'Education for Special Learners',
        correct: false,
      ),
      Answer(
        answer: 'Enriched Student Literacy',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question: 'Who founded the first kindergarten?',
    answers: [
      Answer(
        answer: 'Maria Montessori',
        correct: false,
      ),
      Answer(
        answer: 'Friedrich Froebel',
        correct: true,
      ),
      Answer(
        answer: 'John Dewey',
        correct: false,
      ),
      Answer(
        answer: 'Jean Piaget',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which term describes a method of instruction where teachers provide models of desired behavior and students imitate those behaviors?',
    answers: [
      Answer(
        answer: 'Constructivism',
        correct: false,
      ),
      Answer(
        answer: 'Behaviorism',
        correct: true,
      ),
      Answer(
        answer: 'Cognitivism',
        correct: false,
      ),
      Answer(
        answer: 'Humanism',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question: 'Which of these is NOT a type of educational assessment?',
    answers: [
      Answer(
        answer: 'Formative assessment',
        correct: false,
      ),
      Answer(
        answer: 'Summative assessment',
        correct: false,
      ),
      Answer(
        answer: 'Normative assessment',
        correct: true,
      ),
      Answer(
        answer: 'Diagnostic assessment',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'What does the acronym NCLB stand for in the context of U.S. education policy?',
    answers: [
      Answer(
        answer: 'New Children\'s Learning Bill',
        correct: false,
      ),
      Answer(
        answer: 'No Child Left Behind',
        correct: true,
      ),
      Answer(
        answer: 'National Curriculum and Learning Board',
        correct: false,
      ),
      Answer(
        answer: 'Next Century Learning Boost',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Which term describes an educational setting where students of different ages learn together in the same environment?',
    answers: [
      Answer(
        answer: 'Single-grade classroom',
        correct: false,
      ),
      Answer(
        answer: 'Mixed-grade classroom',
        correct: false,
      ),
      Answer(
        answer: 'Multi-age classroom',
        correct: true,
      ),
      Answer(
        answer: 'Blended classroom',
        correct: false,
      ),
    ],
  ),
  Quiz(
    question:
        'Who is known for the theory of moral development, which includes the stages of moral reasoning?',
    answers: [
      Answer(
        answer: 'Jean Piaget',
        correct: false,
      ),
      Answer(
        answer: 'Lawrence Kohlberg',
        correct: true,
      ),
      Answer(
        answer: 'Erik Erikson',
        correct: false,
      ),
      Answer(
        answer: 'Lev Vygotsky',
        correct: false,
      ),
    ],
  ),
];
