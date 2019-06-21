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
    title: "Avengers: Endgam",
    rating: "8.7",
    duration: "2h 56mins",
    premiereDate: "16 May",
    image: "assets/images/end.jpg",
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
    title: "Avengement",
    rating: "6.9",
    duration: "1h 47mins",
    premiereDate: "10 May",
    image: "assets/images/avenge.jpg",
  ),
   const Movie(
    id: "5",
    title: "Pain & Gain",
    rating: "7.5",
    duration: "2h 8mins",
    premiereDate: "12 Oct",
    image: "assets/images/painandgain.jpg",
  ),
];
