From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V2 1/2] ARM: dts: imx6q: add 852MHz setpoint for CPU freq
Date: Wed, 12 Feb 2014 17:57:02 +0800
Message-ID: <1392199023-29880-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to datasheet, i.MX6Q has setpoint of 852MHz
which is exclusive with 996MHz, the fuse map of speed_grading
defines the max speed of ARM, here we add this 852MHz
setpoint opp info, kernel will check the speed_grading
fuse and remove all illegal setpoints.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 422d169..fadf498 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -30,6 +30,7 @@
 				/* kHz    uV */
 				1200000 1275000
 				996000  1250000
+				852000  1250000
 				792000  1150000
 				396000  975000
 			>;
@@ -37,6 +38,7 @@
 				/* ARM kHz  SOC-PU uV */
 				1200000 1275000
 				996000	1250000
+				852000	1250000
 				792000	1175000
 				396000	1175000
 			>;
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
