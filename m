From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 2/6] media: cedrus: Add a quirk for not setting
 DMA offset
Date: Mon, 28 Jan 2019 21:55:00 +0100
Message-ID: <20190128205504.11225-3-jernej.skrabec@siol.net>
References: <20190128205504.11225-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBOOYXXRAKGQEY2IGG4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190128205504.11225-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

H6 VPU doesn't work if DMA offset is set.

Add a quirk for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h    | 3 +++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 4aedd24a9848..c57c04b41d2e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -28,6 +28,8 @@
 
 #define CEDRUS_CAPABILITY_UNTILED	BIT(0)
 
+#define CEDRUS_QUIRK_NO_DMA_OFFSET	BIT(0)
+
 enum cedrus_codec {
 	CEDRUS_CODEC_MPEG2,
 
@@ -91,6 +93,7 @@ struct cedrus_dec_ops {
 
 struct cedrus_variant {
 	unsigned int	capabilities;
+	unsigned int	quirks;
 };
 
 struct cedrus_dev {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 0acf219a8c91..fbfff7c1c771 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -177,7 +177,8 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	 */
 
 #ifdef PHYS_PFN_OFFSET
-	dev->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
+	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET))
+		dev->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
 #endif
 
 	ret = of_reserved_mem_device_init(dev->dev);
-- 
2.20.1
