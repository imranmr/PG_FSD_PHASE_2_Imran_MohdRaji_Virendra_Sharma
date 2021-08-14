package com.java.programs;

import java.sql.Date;

public class Flight {
	private String airline_name;
	public String getAirline_name() {
		return airline_name;
	}
	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public String getSource_city() {
		return source_city;
	}
	public void setSource_city(String source_city) {
		this.source_city = source_city;
	}
	public String getDestination_city() {
		return destination_city;
	}
	public void setDestination_city(String destination_city) {
		this.destination_city = destination_city;
	}
	public long getDeparturetime_fromsource() {
		return departuretime_fromsource;
	}
	public void setDeparturetime_fromsource(long departuretime_fromsource) {
		this.departuretime_fromsource = departuretime_fromsource;
	}
	public long getArrivaltime_fromdestination() {
		return arrivaltime_fromdestination;
	}
	public void setArrivaltime_fromdestination(long arrivaltime_fromdestination) {
		this.arrivaltime_fromdestination = arrivaltime_fromdestination;
	}
	public int getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(int total_seats) {
		this.total_seats = total_seats;
	}
	public int getBooked_seats() {
		return booked_seats;
	}
	public void setBooked_seats(int booked_seats) {
		this.booked_seats = booked_seats;
	}

	public Date getDateoftravel() {
		return dateoftravel;
	}
	public void setDateoftravel(Date dateoftravel) {
		this.dateoftravel = dateoftravel;
	}
	public String getFlight_class() {
		return flight_class;
	}
	public void setFlight_class(String flight_class) {
		this.flight_class = flight_class;
	}
	private double price;
	private int flight_number;
	private String source_city;
	private String destination_city;
	private long departuretime_fromsource;
	private long arrivaltime_fromdestination;
	private int total_seats;
	private int booked_seats;
	private Date dateoftravel;
	private String flight_class;
	
}
