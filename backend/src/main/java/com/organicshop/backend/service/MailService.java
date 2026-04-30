package com.organicshop.backend.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MailService {

    @Value("${brevo.api.key}")
    private String apiKey;

    public void sendOrderConfirmation(String toEmail, String customerName, Long orderId, String totalAmount) {
        new Thread(() -> {
            try {
                RestTemplate restTemplate = new RestTemplate();
                String url = "https://api.brevo.com/v3/smtp/email";

                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_JSON);
                headers.set("api-key", apiKey);
                headers.setAccept(List.of(MediaType.APPLICATION_JSON));

                Map<String, Object> body = new HashMap<>();
                body.put("sender", Map.of("name", "Organic Shop", "email", "enesdyzero@gmail.com"));
                body.put("to", List.of(Map.of("email", toEmail, "name", customerName)));
                body.put("subject", "Organic Shop - Xác nhận thanh toán đơn hàng #" + orderId);

                String htmlContent = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; border: 1px solid #ddd; border-radius: 10px; overflow: hidden;'>"
                        + "<div style='background-color: #4CAF50; color: white; padding: 20px; text-align: center;'>"
                        + "<h2>Cảm ơn bạn đã mua sắm tại Organic Shop!</h2>"
                        + "</div>"
                        + "<div style='padding: 20px;'>"
                        + "<p>Chào <b>" + customerName + "</b>,</p>"
                        + "<p>Đơn hàng <b>#" + orderId + "</b> của bạn đã được thanh toán thành công qua VNPAY.</p>"
                        + "<p>Tổng tiền: <b style='color: #E53935;'>" + totalAmount + " VNĐ</b></p>"
                        + "<p>Trạng thái: <b>ĐANG CHỜ XỬ LÝ (PENDING)</b></p>"
                        + "<p>Chúng tôi đang chuẩn bị hàng và sẽ giao đến bạn trong thời gian sớm nhất.</p>"
                        + "<hr style='border: 0; border-top: 1px solid #eee; margin: 20px 0;'>"
                        + "<p style='font-size: 12px; color: #888;'>Trân trọng,<br>Đội ngũ Organic Shop</p>"
                        + "</div></div>";

                body.put("htmlContent", htmlContent);

                HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
                restTemplate.postForEntity(url, request, String.class);
                System.out.println("Gửi mail Brevo thành công cho: " + toEmail);

            } catch (Exception e) {
                System.out.println("Lỗi gửi mail Brevo: " + e.getMessage());
            }
        }).start();
    }
}