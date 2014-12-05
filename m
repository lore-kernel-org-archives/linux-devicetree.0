From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] arm: dts: imx6q: update cpufreq volt/freq table
Date: Fri, 5 Dec 2014 16:23:48 +0800
Message-ID: <1417767829-11314-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to latest i.MX6Q datasheet Rev. 3, 02/2014,
the latest cpufreq volt/freq table is as below:

LDO enabled/bypassed(min value):
996MHz: VDDARM: 1.225V, VDDSOC: 1.150V;
792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
396MHz: VDDARM: 0.925V, VDDSOC: 1.150V;

the 792MHz setpoint's VDDARM min voltage is updated
from 1.125V to 1.150V, adding 25mV to cover board IR
drop, 1.175V is the right voltage we should use.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 85f72e6..37ee4e5 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -31,7 +31,7 @@
 				1200000 1275000
 				996000  1250000
 				852000  1250000
-				792000  1150000
+				792000  1175000
 				396000  975000
 			>;
 			fsl,soc-operating-points = <
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
