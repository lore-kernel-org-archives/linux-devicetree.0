From: <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: ls1088a: Add USB support
Date: Thu, 17 Aug 2017 10:52:38 +0800
Message-ID: <1502938358-23522-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yinbo.zhu-3arQi8VN3Tc@public.gmane.org, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Raghav Dogra <raghav.dogra-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>

Fix the issue that usb is not detected on ls1088ardb

Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index e9276a5..949cd67 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -145,6 +145,14 @@
 	status = "okay";
 };
 
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
 &esdhc {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 3a3be87..0dbff29 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -458,6 +458,24 @@
 			status = "disabled";
 		};
 
+		usb0: usb3@3100000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3100000 0x0 0x10000>;
+			interrupts = <0 80 0x4>; /* Level high type */
+			dr_mode = "host";
+			configure-gfladj;
+			snps,dis_rxdet_inp3_quirk;
+		};
+
+		usb1: usb3@3110000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3110000 0x0 0x10000>;
+			interrupts = <0 81 0x4>; /* Level high type */
+			dr_mode = "host";
+			configure-gfladj;
+			snps,dis_rxdet_inp3_quirk;
+		};
+
 		sata: sata@3200000 {
 			compatible = "fsl,ls1088a-ahci";
 			reg = <0x0 0x3200000 0x0 0x10000>,
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
