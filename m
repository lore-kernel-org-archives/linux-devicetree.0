From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 11/20] mmc: mmci: Mark the DT bindings for highspeed mode as deprecated
Date: Fri, 21 Mar 2014 13:14:08 +0100
Message-ID: <1395404057-27835-12-git-send-email-ulf.hansson@linaro.org>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The common mmc DT parser supports bindings for highspeed mode, thus
there are no need for mmci to provide it's own versions for these. Mark
them as deprecated in the documentation.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mmc/mmci.txt |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
index eb9ad86..f9fbcb4 100644
--- a/Documentation/devicetree/bindings/mmc/mmci.txt
+++ b/Documentation/devicetree/bindings/mmc/mmci.txt
@@ -12,11 +12,13 @@ Required properties:
 - vmmc-supply            : phandle to the regulator device tree node.
 
 Optional properties:
-- mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable.
-- mmc-cap-sd-highspeed   : indicates whether SD is high speed capable.
 - vqmmc-supply           : phandle to the regulator device tree node.
 - signal-direction       : a bit pattern, indicating bus signals directions.
 
+Deprecated properties:
+- mmc-cap-mmc-highspeed  : indicates whether MMC is high speed capable.
+- mmc-cap-sd-highspeed   : indicates whether SD is high speed capable.
+
 Example:
 
 sdi0_per1@80126000 {
@@ -34,8 +36,8 @@ sdi0_per1@80126000 {
 
 	max-frequency = <100000000>;
 	bus-width = <4>;
-	mmc-cap-sd-highspeed;
-	mmc-cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
 	cd-gpios  = <&gpio2 31 0x4>; // 95
 
 	signal-direction = <(MCI_ST_DATA2DIREN | MCI_ST_CMDDIREN |
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
