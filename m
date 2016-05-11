From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] arm64: dts: NS2: Add all of the UARTs
Date: Wed, 11 May 2016 18:56:08 -0400
Message-ID: <1463007369-13071-1-git-send-email-jonmason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add all of the UARTs present on NS2 and enable them in the SVK device
tree file.  Also, do some magic to make sure that uart3 is discovered as
ttyS0 (as that is the console UART).

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 30 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index 7cd3640..b062a44 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -40,10 +40,14 @@
 
 	aliases {
 		serial0 = &uart3;
+		serial1 = &uart0;
+		serial2 = &uart1;
+		serial3 = &uart2;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon=uart8250,mmio32,0x66130000";
 	};
 
 	memory {
@@ -68,6 +72,18 @@
 	status = "ok";
 };
 
+&uart0 {
+	status = "ok";
+};
+
+&uart1 {
+	status = "ok";
+};
+
+&uart2 {
+	status = "ok";
+};
+
 &uart3 {
 	status = "ok";
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 788ed8f..c77a9e8 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -357,6 +357,36 @@
 			status = "disabled";
 		};
 
+		uart0: serial@66100000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x66100000 0x100>;
+			interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@66110000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x66110000 0x100>;
+			interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@66120000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x66120000 0x100>;
+			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
 		uart3: serial@66130000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x66130000 0x100>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
