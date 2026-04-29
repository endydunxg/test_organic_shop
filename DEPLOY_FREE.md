# Deploy Hosting + Domain Rieng (Uu tien mien phi)

Ngay cap nhat: 2026-04-28

## 1) Kien truc de xuat cho du an nay

- Frontend (Vite React): Cloudflare Pages (free)
- Backend (Spring Boot): Render Web Service (free tier)
- Database MySQL: Railway (free trial + free monthly credit)
- DNS/Domain: mua domain rieng tai nha dang ky bat ky, quan ly DNS tren Cloudflare

Ly do chon:
- Phu hop stack hien tai (Spring Boot + MySQL), khong can doi sang Postgres.
- Frontend static duoc host free on dinh.
- Co the gan domain rieng cho ca frontend va backend.

## 2) Chuan bi truoc khi deploy

1. Day code len GitHub (repo private/public deu duoc).
2. Tao domain (neu chua co): vi du `organicshop.vn` hoac `organicshop.store`.
3. Tao 3 tai khoan:
- Cloudflare
- Render
- Railway

## 3) Deploy Database (Railway)

1. Tao project moi tren Railway.
2. Add service MySQL.
3. Lay thong tin ket noi:
- `MYSQLHOST`
- `MYSQLPORT`
- `MYSQLDATABASE`
- `MYSQLUSER`
- `MYSQLPASSWORD`
4. Tao bien `DB_URL` cho backend:

```bash
jdbc:mysql://<MYSQLHOST>:<MYSQLPORT>/<MYSQLDATABASE>?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
```

## 4) Deploy Backend (Render)

1. New + Web Service -> connect repo GitHub.
2. Chon:
- Root Directory: `backend`
- Runtime: Java
- Build Command: `mvn -DskipTests package`
- Start Command: `java -jar target/backend-0.0.1-SNAPSHOT.jar`
3. Them Environment Variables:
- `PORT` = `10000` (Render tu cap, co the bo qua)
- `DB_URL` = gia tri o buoc Railway
- `DB_USERNAME`
- `DB_PASSWORD`
- `APP_FRONTEND_URL` = `https://shop.your-domain.com`
- `APP_CORS_ALLOWED_ORIGINS` = `https://shop.your-domain.com`
- `CLIENT_ID` (Google OAuth, neu dung)
- `CLIENT_SECRET` (Google OAuth, neu dung)
- `GOOGLE_REDIRECT_URI` = `https://shop.your-domain.com/authenticate`
- `MAIL_USERNAME` (neu gui mail that)
- `MAIL_PASSWORD` (App Password Gmail, neu gui mail that)
- `VNPAY_TMN_CODE` (neu dung)
- `VNPAY_HASH_SECRET` (neu dung)
- `VNPAY_RETURN_URL` = `https://api.your-domain.com/api/payments/vnpay-return`
4. Deploy va kiem tra:
- `https://<service>.onrender.com/swagger-ui.html`

## 5) Deploy Frontend (Cloudflare Pages)

1. Workers & Pages -> Create project -> Connect GitHub repo.
2. Chon:
- Project root: `frontend`
- Build command: `npm run build`
- Build output directory: `dist`
3. Them bien moi truong:
- `VITE_API_URL` = `https://api.your-domain.com`
- `VITE_GOOGLE_CLIENT_ID` = `your-google-web-client-id.apps.googleusercontent.com`
4. Deploy va test URL `*.pages.dev`.

## 6) Gan domain rieng

Muc tieu:
- Frontend: `shop.your-domain.com`
- Backend: `api.your-domain.com`

### 6.1 Gan subdomain frontend vao Cloudflare Pages

1. Trong Pages project -> Custom domains -> add `shop.your-domain.com`.
2. Cloudflare se huong dan record CNAME tu DNS provider.

### 6.2 Gan subdomain backend vao Render

1. Trong Render service -> Settings -> Custom Domains -> add `api.your-domain.com`.
2. Tao CNAME theo gia tri Render cung cap.
3. Verify domain tren Render.

## 7) Kiem tra production checklist

- Login/Register hoat dong.
- CORS khong bi chan tren trinh duyet.
- Swagger mo duoc tren domain API.
- Upload file image hoat dong (neu can, can xem them luu tru object storage ve sau).
- Thanh toan VNPay callback dung domain API that.

## 8) Luu y quan trong

- Domain "rieng" dung nghia (vd `.com`, `.vn`) thuong KHONG mien phi, phai mua theo nam.
- Render free co han che va khong duoc khuyen nghi cho production tai cao.
- Railway free la theo credit, co the het credit neu vuot muc.

## 9) Deploy nhanh backend bang render.yaml

Repo da co file `render.yaml` o thu muc goc.

1. Vao Render -> New -> Blueprint.
2. Chon repo GitHub cua ban.
3. Render se doc `render.yaml` va tao service `organic-shop-backend`.
4. Dien cac env co `sync: false` (DB, OAuth, CORS, VNPay, ...), sau do deploy.
