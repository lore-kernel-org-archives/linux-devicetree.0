From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/7] ARM64: zynqmp: Add DWC3 usb support
Date: Mon, 27 Jul 2015 11:48:12 +0200
Message-ID: <b3f7de61ce27b9ae18048ce19b62822bab72ebb5.1437990464.git.michal.simek@xilinx.com>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <48a75b64b05dc094e34fe27e5d03552dbfe77fe2.1437990464.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add usb nodes to DTSI and enable both of them on ep108.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 12 ++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 20 ++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 3aebc3f5d02a..d6cc4b583587 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -58,3 +58,15 @@
 &uart0 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 7617722cc969..9cf364dc4890 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -343,6 +343,26 @@
 			clocks = <&misc_clk>, <&misc_clk>;
 		};
 
+		usb0: usb@fe200000 {
+			compatible = "snps,dwc3";
+			status = "disabled";
+			interrupt-parent = <&gic>;
+			interrupts = <0 65 4>;
+			reg = <0x0 0xfe200000 0x40000>;
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <&misc_clk>, <&misc_clk>;
+		};
+
+		usb1: usb@fe300000 {
+			compatible = "snps,dwc3";
+			status = "disabled";
+			interrupt-parent = <&gic>;
+			interrupts = <0 70 4>;
+			reg = <0x0 0xfe300000 0x40000>;
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <&misc_clk>, <&misc_clk>;
+		};
+
 		watchdog0: watchdog@fd4d0000 {
 			compatible = "cdns,wdt-r1p2";
 			status = "disabled";
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
