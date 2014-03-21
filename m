From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/20] mmc: mmci: Update DT documentation
Date: Fri, 21 Mar 2014 13:14:00 +0100
Message-ID: <1395404057-27835-4-git-send-email-ulf.hansson@linaro.org>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document how to configure the regulator supplies and add an example of
a typical mmci DT node.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mmc/mmci.txt |   35 ++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
index 2b584ca..d167562 100644
--- a/Documentation/devicetree/bindings/mmc/mmci.txt
+++ b/Documentation/devicetree/bindings/mmc/mmci.txt
@@ -9,7 +9,38 @@ by mmc.txt and the properties used by the mmci driver.
 Required properties:
 - compatible             : contains "arm,pl18x", "arm,primecell".
 - arm,primecell-periphid : contains the PrimeCell Peripheral ID.
+- vmmc-supply            : phandle to the regulator device tree node.
 
 Optional properties:
-- mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable
-- mmc-cap-sd-highspeed   : indicates whether SD is high speed capable
+- mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable.
+- mmc-cap-sd-highspeed   : indicates whether SD is high speed capable.
+- vqmmc-supply           : phandle to the regulator device tree node.
+
+Example:
+
+sdi0_per1@80126000 {
+	compatible = "arm,pl18x", "arm,primecell";
+	arm,primecell-periphid = <0x10480180>;
+	reg = <0x80126000 0x1000>;
+	interrupts = <0 60 IRQ_TYPE_LEVEL_HIGH>;
+
+	dmas = <&dma 29 0 0x2>, /* Logical - DevToMem */
+	       <&dma 29 0 0x0>; /* Logical - MemToDev */
+	dma-names = "rx", "tx";
+
+	clocks = <&prcc_kclk 1 5>, <&prcc_pclk 1 5>;
+	clock-names = "sdi", "apb_pclk";
+
+	max-frequency = <100000000>;
+	bus-width = <4>;
+	mmc-cap-sd-highspeed;
+	mmc-cap-mmc-highspeed;
+	cd-gpios  = <&gpio2 31 0x4>; // 95
+
+	vmmc-supply = <&ab8500_ldo_aux3_reg>;
+	vqmmc-supply = <&vmmci>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdi0_default_mode>;
+	pinctrl-1 = <&sdi0_sleep_mode>;
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
