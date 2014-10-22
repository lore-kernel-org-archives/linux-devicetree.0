From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v1 2/2] ARM: dts: hip04: add GPIO pieces
Date: Wed, 22 Oct 2014 19:56:00 +0800
Message-ID: <1413978960-10717-3-git-send-email-wangzhou.bry@gmail.com>
References: <1413978960-10717-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413978960-10717-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>
List-Id: devicetree@vger.kernel.org

Hisilicon Soc hip04 has four GPIO controllers, each one has 32
GPIOs and can be configured to be an interrupt controller.The GPIO
controllers are compatible with the snps,dw-apb-gpio driver.
This patch add the corresponding device tree nodes.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 arch/arm/boot/dts/hip04.dtsi |   75 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
index 93b6c90..c0f76b8 100644
--- a/arch/arm/boot/dts/hip04.dtsi
+++ b/arch/arm/boot/dts/hip04.dtsi
@@ -263,5 +263,80 @@
 			interrupts = <0 372 4>;
 		};
 
+		gpio@4003000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4003000 0x1000>;
+
+			gpio3: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 392 4>;
+			};
+		};
+
+		gpio@4002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4002000 0x1000>;
+
+			gpio2: gpio-controller@0 {
+			compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 391 4>;
+			};
+		};
+
+		gpio@4001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4001000 0x1000>;
+
+			gpio1: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 390 4>;
+			};
+		};
+
+		gpio@4000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4000000 0x1000>;
+
+			gpio0: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 389 4>;
+			};
+		};
 	};
 };
-- 
1.7.9.5
