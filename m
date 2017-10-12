From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] nvmem: meson: use generic compatible
Date: Thu, 12 Oct 2017 17:24:50 +0200
Message-ID: <20171012152450.12454-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The meson efuse driver seems to be compatible with more SoCs than
initially thought. Let's use the most generic compatible he have in
DT instead of the gxbb specific one

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 4 ++--
 drivers/nvmem/meson-efuse.c                               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
index fafd85bd67a6..0260524292fe 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
@@ -1,7 +1,7 @@
 = Amlogic eFuse device tree bindings =
 
 Required properties:
-- compatible: should be "amlogic,meson-gxbb-efuse"
+- compatible: should be "amlogic,meson-gx-efuse"
 
 = Data cells =
 Are child nodes of eFuse, bindings of which as described in
@@ -10,7 +10,7 @@ bindings/nvmem/nvmem.txt
 Example:
 
 	efuse: efuse {
-		compatible = "amlogic,meson-gxbb-efuse";
+		compatible = "amlogic,meson-gx-efuse";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 70bfc9839bb2..e90c6d68a263 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -44,7 +44,7 @@ static struct nvmem_config econfig = {
 };
 
 static const struct of_device_id meson_efuse_match[] = {
-	{ .compatible = "amlogic,meson-gxbb-efuse", },
+	{ .compatible = "amlogic,meson-gx-efuse", },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_efuse_match);
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
