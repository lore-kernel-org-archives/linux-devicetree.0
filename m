From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 13/13] media: am437x-vpfe: Remove print_fourcc helper
Date: Fri, 20 Sep 2019 12:05:54 -0500
Message-ID: <20190920170554.29666-14-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

print_fourcc helper function was used for debug log to convert a pixel
format code into its readable form for display purposes. But since it
used a single static buffer to perform the conversion this might lead to
display format issue when more than one instance was invoked
simultaneously.

Instead we make use of the new standard macros to log the fourcc value
in a human readable format.

This patch is dependent on the following series:

Link: https://patchwork.kernel.org/project/linux-media/list/?series=174497

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 40 ++++++++-------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 447610b67db4..fea30d701af5 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -151,20 +151,6 @@ static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
 	return bpp;
 }
 
-/*  Print Four-character-code (FOURCC) */
-static char *print_fourcc(u32 fmt)
-{
-	static char code[5];
-
-	code[0] = (unsigned char)(fmt & 0xff);
-	code[1] = (unsigned char)((fmt >> 8) & 0xff);
-	code[2] = (unsigned char)((fmt >> 16) & 0xff);
-	code[3] = (unsigned char)((fmt >> 24) & 0xff);
-	code[4] = '\0';
-
-	return code;
-}
-
 static inline u32 vpfe_reg_read(struct vpfe_ccdc *ccdc, u32 offset)
 {
 	return ioread32(ccdc->ccdc_cfg.base_addr + offset);
@@ -612,8 +598,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
-		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:" v4l2_fourcc_conv "\n",
+		 __func__, ccdc->ccdc_cfg.if_type, v4l2_fourcc_args(pixfmt));
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -900,8 +886,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	u32 bpp;
 	int ret = 0;
 
-	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
-		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
+	vpfe_dbg(1, vpfe, "pixelformat: " v4l2_fourcc_conv "\n",
+		 v4l2_fourcc_args(vpfe->fmt.fmt.pix.pixelformat));
 
 	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
 			vpfe->fmt.fmt.pix.pixelformat) < 0) {
@@ -1342,8 +1328,9 @@ static int vpfe_calc_format_size(struct vpfe_device *vpfe,
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
 			       f->fmt.pix.height;
 
-	vpfe_dbg(3, vpfe, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
-		 __func__, print_fourcc(f->fmt.pix.pixelformat),
+	vpfe_dbg(3, vpfe,
+		 "%s: fourcc: " v4l2_fourcc_conv " size: %dx%d bpl:%d img_size:%d\n",
+		 __func__,  v4l2_fourcc_args(f->fmt.pix.pixelformat),
 		 f->fmt.pix.width, f->fmt.pix.height,
 		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 
@@ -1378,8 +1365,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
-		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: " v4l2_fourcc_conv "\n",
+		 __func__, f->index, fmt->code, v4l2_fourcc_args(fmt->fourcc));
 
 	return 0;
 }
@@ -1528,8 +1515,8 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	fsize->discrete.width = fse.max_width;
 	fsize->discrete.height = fse.max_height;
 
-	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %s size: %dx%d\n",
-		 __func__, fsize->index, print_fourcc(fsize->pixel_format),
+	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: " v4l2_fourcc_conv " size: %dx%d\n",
+		 __func__, fsize->index, v4l2_fourcc_args(fsize->pixel_format),
 		 fsize->discrete.width, fsize->discrete.height);
 
 	return 0;
@@ -2202,8 +2189,9 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 				continue;
 			vpfe->active_fmt[i] = fmt;
 			vpfe_dbg(3, vpfe,
-				 "matched fourcc: %s code: %04x idx: %d\n",
-				 print_fourcc(fmt->fourcc), mbus_code.code, i);
+				 "matched fourcc: " v4l2_fourcc_conv " code: %04x idx: %d\n",
+				 v4l2_fourcc_args(fmt->fourcc),
+				 mbus_code.code, i);
 			vpfe->num_active_fmt = ++i;
 		}
 	}
-- 
2.17.1
