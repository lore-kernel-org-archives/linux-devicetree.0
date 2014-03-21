From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 05/20] mmc: mmci: Add DT bindings for signal direction
Date: Fri, 21 Mar 2014 13:14:02 +0100
Message-ID: <1395404057-27835-6-git-send-email-ulf.hansson@linaro.org>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some variants have support for indicating the bus signal directions,
which currently are configured through platform data.

Add corresponding DT bindings to enable us to move away from using the
platform data.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mmc/mmci.txt |    4 ++++
 drivers/mmc/host/mmci.c                        |    7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
index d167562..eb9ad86 100644
--- a/Documentation/devicetree/bindings/mmc/mmci.txt
+++ b/Documentation/devicetree/bindings/mmc/mmci.txt
@@ -15,6 +15,7 @@ Optional properties:
 - mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable.
 - mmc-cap-sd-highspeed   : indicates whether SD is high speed capable.
 - vqmmc-supply           : phandle to the regulator device tree node.
+- signal-direction       : a bit pattern, indicating bus signals directions.
 
 Example:
 
@@ -37,6 +38,9 @@ sdi0_per1@80126000 {
 	mmc-cap-mmc-highspeed;
 	cd-gpios  = <&gpio2 31 0x4>; // 95
 
+	signal-direction = <(MCI_ST_DATA2DIREN | MCI_ST_CMDDIREN |
+			MCI_ST_DATA0DIREN | MCI_ST_FBCLKEN)>;
+
 	vmmc-supply = <&ab8500_ldo_aux3_reg>;
 	vqmmc-supply = <&vmmci>;
 
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index d6f20ba..76e41ba 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1390,8 +1390,15 @@ static struct mmc_host_ops mmci_ops = {
 static void mmci_dt_populate_generic_pdata(struct device_node *np,
 					struct mmci_platform_data *pdata)
 {
+	u32 sigdir = 0;
 	int bus_width = 0;
 
+	if (!of_property_read_u32(np, "signal-direction", &sigdir)) {
+		sigdir &= MCI_ST_DATA2DIREN|MCI_ST_CMDDIREN|MCI_ST_DATA0DIREN|
+			MCI_ST_DATA31DIREN|MCI_ST_FBCLKEN|MCI_ST_DATA74DIREN;
+		pdata->sigdir = sigdir;
+	}
+
 	pdata->gpio_wp = of_get_named_gpio(np, "wp-gpios", 0);
 	pdata->gpio_cd = of_get_named_gpio(np, "cd-gpios", 0);
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
