From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] firmware: meson-sm: use generic compatible
Date: Thu, 12 Oct 2017 15:47:43 +0200
Message-ID: <20171012134743.10625-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The meson secure monitor seems to be compatible with more SoCs than
initially thought. Let's use the most generic compatible he have in
DT instead of the gxbb specific one

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt | 4 ++--
 drivers/firmware/meson/meson_sm.c                             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
index c248cd44f727..13a7815ac2b9 100644
--- a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
+++ b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
@@ -4,12 +4,12 @@ In the Amlogic SoCs the Secure Monitor code is used to provide access to the
 NVMEM, enable JTAG, set USB boot, etc...
 
 Required properties for the secure monitor node:
-- compatible: Should be "amlogic,meson-gxbb-sm"
+- compatible: Should be "amlogic,meson-gx-sm"
 
 Example:
 
 	firmware {
 		sm: secure-monitor {
-			compatible = "amlogic,meson-gxbb-sm";
+			compatible = "amlogic,meson-gx-sm";
 		};
 	};
diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ff204421117b..c83f7be2b1f4 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -38,7 +38,7 @@ struct meson_sm_chip {
 	struct meson_sm_cmd cmd[];
 };
 
-struct meson_sm_chip gxbb_chip = {
+struct meson_sm_chip gx_chip = {
 	.shmem_size		= SZ_4K,
 	.cmd_shmem_in_base	= 0x82000020,
 	.cmd_shmem_out_base	= 0x82000021,
@@ -213,7 +213,7 @@ int meson_sm_call_write(void *buffer, unsigned int size, unsigned int cmd_index,
 EXPORT_SYMBOL(meson_sm_call_write);
 
 static const struct of_device_id meson_sm_ids[] = {
-	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
+	{ .compatible = "amlogic,meson-gx-sm", .data = &gx_chip },
 	{ /* sentinel */ },
 };
 
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
