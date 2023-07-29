class Booking {
  Booking({
    required this.id,
    required this.idIndekos,
    required this.cover,
    required this.name,
    required this.location,
    required this.date,
    required this.guest,
    required this.breakfast,
    required this.checkInTime,
    required this.month,
    required this.serviceFee,
    required this.activities,
    // required this.facilities,
    required this.totalPayment,
    required this.status,
    required this.isDone,
  });

  String id;
  String idIndekos;
  String cover;
  String name;
  String location;
  String date;
  int guest;
  String breakfast;
  String checkInTime;
  int month;
  int serviceFee;
  int activities;
  // int facilities;
  int totalPayment;
  String status;
  bool isDone;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        idIndekos: json["id_indekos"],
        cover: json["cover"],
        name: json["name"],
        location: json["location"],
        date: json["date"],
        guest: json["guest"],
        breakfast: json["breakfast"],
        checkInTime: json["check_in_time"],
        month: json["month"],
        serviceFee: json["service_fee"],
        activities: json["activities"],
        // facilities: json["facilities"],
        totalPayment: json["total_payment"],
        status: json["status"],
        isDone: json["is_done"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_indekos": idIndekos,
        "cover": cover,
        "name": name,
        "location": location,
        "date": date,
        "guest": guest,
        "breakfast": breakfast,
        "check_in_time": checkInTime,
        "month": month,
        "service_fee": serviceFee,
        "activities": activities,
        // "facilities": facilities,
        "total_payment": totalPayment,
        "status": status,
        "is_done": isDone,
      };
}

Booking get initBooking => Booking(
      id: '',
      idIndekos: '',
      cover: '',
      name: '',
      location: '',
      date: '',
      guest: 0,
      breakfast: '',
      checkInTime: '',
      month: 0,
      serviceFee: 0,
      activities: 0,
      // facilities: 0,
      totalPayment: 0,
      status: '',
      isDone: false,
    );
