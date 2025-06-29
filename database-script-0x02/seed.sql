USE Airbnbclone;

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('1', 'Sara', 'Sattar', 'sara@example.com', 'hashed_pw_123', '0612345678', 'guest'),
  ('2', 'Omar', 'Elhaj', 'omar@example.com', 'hashed_pw_456', '0623456789', 'host'),
  ('3', 'Amina', 'Benali', 'amina@example.com', 'hashed_pw_789', '0634567890', 'guest');


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('1', '22222222-2222-2222-2222-222222222222', 'Cozy Riad in Marrakech', 'A beautiful traditional riad with terrace and fountain.', 'Marrakech', 350.00),
  ('2', '22222222-2222-2222-2222-222222222222', 'Beach House Agadir', 'Sea view, modern house near the coast.', 'Agadir', 500.00);


INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('1', 'b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1050.00, 'credit_card'),
  ('2', 'b2222222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1000.00, 'paypal');


INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Beautiful riad and very welcoming host.'),
  ('2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaab', '33333333-3333-3333-3333-333333333333', 4, 'Great view, clean house. A bit noisy at night.');


INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Omar, is the Riad available in early July?'),
  ('2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Sara, yes it is available. Let me know if you want to book.');
