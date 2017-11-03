From: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
Subject: [PACTH v2] arm64: dts: ls1088a: Added dcfg node in ls1088a dtsi
Date: Fri, 3 Nov 2017 10:17:41 +0530
Message-ID: <1509684461-7432-1-git-send-email-Ashish.Kumar@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>, Amrita Kumari <amrita.kumari-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add debug configuration node(DCFG) in dtsi, helps guts driver to
print the following information in kernel boot log

[    0.526649] Machine: LS1088A RDB Board
[    0.530430] SoC family: QorIQ LS1088A
[    0.534115] SoC ID: svr:0x87030010, Revision: 1.0

Signed-off-by: Amrita Kumari <amrita.kumari-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index c144d06..b5f2372 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -156,6 +156,12 @@
 			clocks = <&sysclk>;
 		};
 
+		dcfg: dcfg@1e00000 {
+			compatible = "fsl,ls1088a-dcfg", "syscon";
+			reg = <0x0 0x1e00000 0x0 0x10000>;
+			little-endian;
+		};
+
 		tmu: tmu@1f80000 {
 			compatible = "fsl,qoriq-tmu";
 			reg = <0x0 0x1f80000 0x0 0x10000>;
-- 
1.7.6.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
