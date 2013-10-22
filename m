From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH RESEND v5 3/5] ARM: rockchip: add sram dt nodes and documentation
Date: Tue, 22 Oct 2013 17:27:11 +0200
Message-ID: <201310221727.12357.heiko@sntech.de>
References: <201310221724.21550.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310221724.21550.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Rockchip SoCs need a special part of their sram for bringup
of additional cores. Therefore also limit the public area when adding the
mmio-sram node to keep the sram driver from using this space.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/arm/rockchip/smp-sram.txt  |   24 ++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi                     |    6 +++++
 arch/arm/boot/dts/rk3188.dtsi                      |    6 +++++
 3 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt b/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
new file mode 100644
index 0000000..0c88d06
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
@@ -0,0 +1,24 @@
+Rockchip SRAM for smp bringup:
+------------------------------
+
+Rockchip's smp-capable SoCs use the first part of the sram for the bringup
+of the cores. Once the core gets powered up it executes the code that is
+residing at the very beginning of the sram.
+
+Therefore the available space has to be limited to exclude this area using
+the available property of the sram node.
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
+		available = <0x50 0xffb0>;
+	};
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 2218c64..e91048b 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -64,6 +64,12 @@
 			clock-names = "timer", "pclk";
 		};
 
+		sram: sram@10080000 {
+			compatible = "rockchip,rk3066-sram", "mmio-sram";
+			reg = <0x10080000 0x10000>;
+			available = <0x50 0xffb0>;
+		};
+
 		pinctrl@20008000 {
 			compatible = "rockchip,rk3066a-pinctrl";
 			reg = <0x20008000 0x150>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 1a26b03..a9885df 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -60,6 +60,12 @@
 			interrupts = <GIC_PPI 13 0xf04>;
 		};
 
+		sram: sram@10080000 {
+			compatible = "rockchip,rk3066-sram", "mmio-sram";
+			reg = <0x10080000 0x8000>;
+			available = <0x50 0x7fb0>;
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
