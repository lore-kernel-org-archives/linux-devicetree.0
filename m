From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 3/4] drm/tinydrm: Add tinydrm_xrgb8888_to_gray8() helper
Date: Fri,  2 Jun 2017 13:49:14 +0200
Message-ID: <1496404155-8344-4-git-send-email-noralf@tronnes.org>
References: <1496404155-8344-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496404155-8344-1-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Drm has no monochrome or greyscale support so add a conversion
from the common format XR24.

Also reorder includes into the common order.

Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---
 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c | 74 +++++++++++++++++++++++++-
 include/drm/tinydrm/tinydrm-helpers.h          |  1 +
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c b/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
index d4cda33..75808bb 100644
--- a/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
+++ b/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
@@ -7,13 +7,15 @@
  * (at your option) any later version.
  */
 
-#include <drm/tinydrm/tinydrm.h>
-#include <drm/tinydrm/tinydrm-helpers.h>
 #include <linux/backlight.h>
+#include <linux/dma-buf.h>
 #include <linux/pm.h>
 #include <linux/spi/spi.h>
 #include <linux/swab.h>
 
+#include <drm/tinydrm/tinydrm.h>
+#include <drm/tinydrm/tinydrm-helpers.h>
+
 static unsigned int spi_max;
 module_param(spi_max, uint, 0400);
 MODULE_PARM_DESC(spi_max, "Set a lower SPI max transfer size");
@@ -181,6 +183,74 @@ void tinydrm_xrgb8888_to_rgb565(u16 *dst, void *vaddr,
 EXPORT_SYMBOL(tinydrm_xrgb8888_to_rgb565);
 
 /**
+ * tinydrm_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
+ * @dst: 8-bit grayscale destination buffer
+ * @fb: DRM framebuffer
+ *
+ * Drm doesn't have native monochrome or grayscale support.
+ * Such drivers can announce the commonly supported XR24 format to userspace
+ * and use this function to convert to the native format.
+ *
+ * Monochrome drivers will use the most significant bit,
+ * where 1 means foreground color and 0 background color.
+ *
+ * ITU BT.601 is used for the RGB -> luma (brightness) conversion.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int tinydrm_xrgb8888_to_gray8(u8 *dst, struct drm_framebuffer *fb)
+{
+	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct dma_buf_attachment *import_attach = cma_obj->base.import_attach;
+	unsigned int x, y, pitch = fb->pitches[0];
+	int ret = 0;
+	void *buf;
+	u32 *src;
+
+	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
+		return -EINVAL;
+	/*
+	 * The cma memory is write-combined so reads are uncached.
+	 * Speed up by fetching one line at a time.
+	 */
+	buf = kmalloc(pitch, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	if (import_attach) {
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
+					       DMA_FROM_DEVICE);
+		if (ret)
+			goto err_free;
+	}
+
+	for (y = 0; y < fb->height; y++) {
+		src = cma_obj->vaddr + (y * pitch);
+		memcpy(buf, src, pitch);
+		src = buf;
+		for (x = 0; x < fb->width; x++) {
+			u8 r = (*src & 0x00ff0000) >> 16;
+			u8 g = (*src & 0x0000ff00) >> 8;
+			u8 b =  *src & 0x000000ff;
+
+			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
+			*dst++ = (3 * r + 6 * g + b) / 10;
+			src++;
+		}
+	}
+
+	if (import_attach)
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
+					     DMA_FROM_DEVICE);
+err_free:
+	kfree(buf);
+
+	return ret;
+}
+EXPORT_SYMBOL(tinydrm_xrgb8888_to_gray8);
+
+/**
  * tinydrm_of_find_backlight - Find backlight device in device-tree
  * @dev: Device
  *
diff --git a/include/drm/tinydrm/tinydrm-helpers.h b/include/drm/tinydrm/tinydrm-helpers.h
index 9b9b6cf..a6c387f 100644
--- a/include/drm/tinydrm/tinydrm-helpers.h
+++ b/include/drm/tinydrm/tinydrm-helpers.h
@@ -43,6 +43,7 @@ void tinydrm_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
 void tinydrm_xrgb8888_to_rgb565(u16 *dst, void *vaddr,
 				struct drm_framebuffer *fb,
 				struct drm_clip_rect *clip, bool swap);
+int tinydrm_xrgb8888_to_gray8(u8 *dst, struct drm_framebuffer *fb);
 
 struct backlight_device *tinydrm_of_find_backlight(struct device *dev);
 int tinydrm_enable_backlight(struct backlight_device *backlight);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
