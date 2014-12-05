From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/2] arm: dts: imx6dl: correct cpufreq volt/freq table
Date: Fri, 5 Dec 2014 16:23:49 +0800
Message-ID: <1417767829-11314-2-git-send-email-b20788@freescale.com>
References: <1417767829-11314-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417767829-11314-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently the cpufreq volt/freq table we used is
for LDO enable mode, according to latest datasheet
Rev. 3, 03/2014, the volt/freq table is as below:

LDO enabled(min value):
996MHz: VDDARM: 1.225V, VDDSOC: 1.150V;
792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
396MHz: VDDARM: 1.050V, VDDSOC: 1.150V;

LDO bypassed(min value):
996MHz: VDDARM: 1.250V, VDDSOC: 1.150V;
792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
396MHz: VDDARM: 1.050V, VDDSOC: 1.150V;

Adding 25mV to cover board IR drop, for LDO enabled
mode of 996MHz, VDDARM should be 1.250V, so this
patch updates it.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 1ac2fe7..f94bf72 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -28,7 +28,7 @@
 			next-level-cache = <&L2>;
 			operating-points = <
 				/* kHz    uV */
-				996000  1275000
+				996000  1250000
 				792000  1175000
 				396000  1075000
 			>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
