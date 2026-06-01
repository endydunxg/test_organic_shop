const localImages = import.meta.glob("../images/*", {
  eager: true,
  import: "default",
}) as Record<string, string>;

const normalizeKey = (value: string) =>
  value
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, " ")
    .trim();

const resolveLocalAsset = (imageUrl: string) => {
  if (imageUrl.startsWith("http://") || imageUrl.startsWith("https://")) {
    return imageUrl;
  }

  if (imageUrl.startsWith("/images/")) {
    const fileName = imageUrl.split("/").pop();
    const match = Object.entries(localImages).find(([path]) => path.endsWith(`/${fileName}`));
    if (match) {
      return match[1];
    }
  }

  if (imageUrl.startsWith("/uploads/")) {
    const apiBase = import.meta.env.VITE_API_URL ?? "http://localhost:8080";
    return `${apiBase}${imageUrl}`;
  }

  return imageUrl;
};

export function resolveProductImage(imageUrl?: string, name?: string) {
  if (imageUrl) {
    return resolveLocalAsset(imageUrl);
  }

  const normalizedName = normalizeKey(name ?? "");
  if (normalizedName.includes("ca loc dong")) {
    return "/images/ca_loc_dong.jpg";
  }

  return "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1200&q=80";
}

export function resolvePostImage(thumbnail?: string, title?: string, index?: number) {
  if (thumbnail) {
    return resolveLocalAsset(thumbnail);
  }

  const normalizedTitle = normalizeKey(title ?? "");
  if (normalizedTitle.includes("ca noc")) {
    return "/images/bai_viet_1.jpg";
  }
  if (normalizedTitle.includes("bao quan rau cu")) {
    return "/images/bai_viet_2.jpg";
  }
  if (normalizedTitle.includes("bua toi nhanh")) {
    return "/images/bai_viet_3.jpg";
  }

  if (typeof index === "number") {
    return `/images/bai_viet_${Math.min(index + 1, 3)}.jpg`;
  }

  return "/images/bai_viet_1.jpg";
}
