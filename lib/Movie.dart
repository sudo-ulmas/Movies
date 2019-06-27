class Movie {
  final String id;
  final String title;
  final String rating;
  final String duration;
  final String premiereDate;
  final String image;

  const Movie(
      {this.id,
      this.title,
      this.rating,
      this.duration,
      this.premiereDate,
      this.image});
}

List<Movie> movies = [
  const Movie(
    id: "1",
    title: "Venom",
    rating: "8.5",
    duration: "1h 30mins",
    premiereDate: "20 Sept",
    image: "assets/images/venom.jpg",
  ),
   const Movie(
    id: "2",
    title: "Avengers: Endgame",
    rating: "8.7",
    duration: "2h 56mins",
    premiereDate: "16 May",
    image: "assets/images/end.jpeg",
  ),
   const Movie(
    id: "3",
    title: "Sicario: Day of the Soldado",
    rating: "7.1",
    duration: "2h 3min",
    premiereDate: "11 June",
    image: "assets/images/sicario.jpg",
  ),
   const Movie(
    id: "4",
    title: "The Lion King",
    rating: "6.9",
    duration: "1h 58mins",
    premiereDate: "17 July",
    image: "assets/images/lion.jpeg",
  ),
   const Movie(
    id: "5",
    title: "Child's Play",
    rating: "6.5",
    duration: "2hours",
    premiereDate: "19 June",
    image: "assets/images/childs.jpeg",
  ),
];


List<Movie> coming_movies = [
  const Movie(
    id: "1",
    title: "Toy Story 4",
    rating: "8.5",
    duration: "1h 40mins",
    premiereDate: "21 June",
    image: "assets/images/toystory.jpeg",
  ),
   const Movie(
    id: "2",
    title: "Dark Phoenix",
    rating: "6.1",
    duration: "1h 54mins",
    premiereDate: "5 June",
    image: "assets/images/darkphoenix.jpeg",
  ),
   const Movie(
    id: "3",
    title: "Star Wars: The Rise of Skywalker",
    rating: "X",
    duration: "2h 3min",
    premiereDate: "December",
    image: "assets/images/starwars.png",
  ),
   const Movie(
    id: "4",
    title: "It Chapter Two",
    rating: "6.9",
    duration: "1h 47mins",
    premiereDate: "5 Sept",
    image: "assets/images/it2.jpeg",
  ),
   const Movie(
    id: "5",
    title: "Joker",
    rating: "7.5",
    duration: "2 hours",
    premiereDate: "3 Oct",
    image: "assets/images/joker.jpeg",
  ),
];
