From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Subject: [RESEND PATCH 3/3] ARM: dts: artpec: add pcie support
Date: Fri, 14 Oct 2016 15:09:13 +0200
Message-ID: <1476450553-4652-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jespern-VrBV9hrLPhE@public.gmane.org, larper-VrBV9hrLPhE@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>

Add PCIe support to the ARTPEC-6 SoC. This uses the existing
pcie-artpec6 driver.
So, all that is needed is device tree entries in the DTS.

Signed-off-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
---
 arch/arm/boot/dts/artpec6-devboard.dts |  4 ++++
 arch/arm/boot/dts/artpec6.dtsi         | 29 ++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/artpec6-devboard.dts b/arch/arm/boot/dts/artpec6-devboard.dts
index f823ed3..9dfe845 100644
--- a/arch/arm/boot/dts/artpec6-devboard.dts
+++ b/arch/arm/boot/dts/artpec6-devboard.dts
@@ -46,6 +46,10 @@
 	status = "okay";
 };
 
+&pcie {
+	status = "okay";
+};
+
 &ethernet {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 3fac4c4..effaa4a 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -66,7 +66,7 @@
 		};
 	};
 
-	syscon {
+	syscon: syscon@f8000000 {
 		compatible = "axis,artpec6-syscon", "syscon";
 		reg = <0xf8000000 0x48>;
 	};
@@ -145,6 +145,33 @@
 		interrupt-parent = <&intc>;
 	};
 
+	pcie: pcie@f8050000 {
+		compatible = "axis,artpec6-pcie", "snps,dw-pcie";
+		reg = <0xf8050000 0x2000
+		       0xf8040000 0x1000
+		       0xc0000000 0x2000>;
+		reg-names = "dbi", "phy", "config";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+			  /* downstream I/O */
+		ranges = <0x81000000 0 0 0xc0002000 0 0x00010000
+			  /* non-prefetchable memory */
+			  0x82000000 0 0xc0012000 0xc0012000 0 0x1ffee000>;
+		num-lanes = <2>;
+		bus-range = <0x00 0xff>;
+		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi";
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0x7>;
+		interrupt-map = <0 0 0 1 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &intc GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &intc GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &intc GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		axis,syscon-pcie = <&syscon>;
+		status = "disabled";
+	};
+
 	amba@0 {
 		compatible = "simple-bus";
 		#address-cells = <0x1>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
