package com.organicshop.backend.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Lệnh này bảo Spring Boot: Hễ ai truy cập link /uploads/... thì hãy vào thư mục ./uploads/ trong ổ cứng để lấy file trả về
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:./uploads/");
    }
}