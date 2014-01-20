From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v7 5/7] ARM: rockchip: add sram dt nodes and documentation
Date: Mon, 20 Jan 2014 16:44:56 +0100
Message-ID: <1871002.oN7a1Shr3l@phil>
References: <4970034.fqvMoHdOyd@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4970034.fqvMoHdOyd@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dt-nodes for the sram on rk3066 and rk3188 including the reserved section
needed for smp bringup.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/arm/rockchip/smp-sram.txt  |   23 ++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi                     |    6 +++++
 arch/arm/boot/dts/rk3188.dtsi                      |    6 +++++
 3 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt b/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
new file mode 100644
index 0000000..80c878e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
@@ -0,0 +1,23 @@
+Rockchip SRAM for smp bringup:
+------------------------------
+
+Rockchip's smp-capable SoCs use the first part of the sram for the bringup
+of the cores. Once the core gets powered up it executes the code that is
+residing at the very beginning of the sram.
+
+Therefore a reserved section has to be added to the mmio-sram declaration.
+
+Required node properties:
+- compatible : should contain both "rockchip,rk3066-sram", "mmio-sram"
+  so that the smp code can select the correct sram node.
+
+The rest of the properties should follow the generic mmio-sram discription
+found in ../../misc/sram.txt
+
+Example:
+
+	sram: sram@10080000 {
+		compatible = "rockchip,rk3066-sram", "mmio-sram";
+		reg = <0x10080000 0x10000>;
+		mmio-sram-reserved = <0x0 0x50>;
+	};
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index be5d2b0..0dfb680 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -64,6 +64,12 @@
 			clock-names = "timer", "pclk";
 		};
 
+		sram: sram@10080000 {
+			compatible = "rockchip,rk3066-sram", "mmio-sram";
+			reg = <0x10080000 0x10000>;
+			mmio-sram-reserved = <0x0 0x50>;
+		};
+
 		pinctrl@20008000 {
 			compatible = "rockchip,rk3066a-pinctrl";
 			reg = <0x20008000 0x150>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 1a26b03..1fc7eda 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -60,6 +60,12 @@
 			interrupts = <GIC_PPI 13 0xf04>;
 		};
 
+		sram: sram@10080000 {
+			compatible = "rockchip,rk3066-sram", "mmio-sram";
+			reg = <0x10080000 0x8000>;
+			mmio-sram-reserved = <0x0 0x50>;
+		};
+
 		pinctrl@20008000 {
 			compatible = "rockchip,rk3188-pinctrl";
 			reg = <0x20008000 0xa0>,
-- 
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
