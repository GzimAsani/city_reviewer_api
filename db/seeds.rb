# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
cities = City.create([
  {
    name: "Prishtina, KS",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Flag_of_Pristina.png"
  },

  {
    name: "Belgrade, RS",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/f/f0/Belgrad_%28Zemun%29_-_Kula_Sibinjanin_Janka.jpg"
  },

  {
    name: "Sofia, BG",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/c/cc/Sofia_333.jpg"
  },

  {
    name: "Athens, GR",
    image_url: "https://en.wikipedia.org/wiki/Acropolis_of_Athens#/media/File:The_Acropolis_of_Athens_viewed_from_the_Hill_of_the_Muses_(14220794964).jpg"
  },
    
  {
    name: "Tirana, AL",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0d/Skanderbeg_square_tirana_2016.jpg",
  },
  
  {
    name: "Podgorica, MN",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/4/4b/PodgoricaOverview.jpg",
  },
])

reviews = Review.create([
  {  
    title: "Great city!",
    description: "I had so much fun. Very friendly!",
    score: 5,
    city: cities.first
  },

  {
    title: "It's fine",
    description: "Very polluted",
    score: 1,
    city: cities.first
  }
])

