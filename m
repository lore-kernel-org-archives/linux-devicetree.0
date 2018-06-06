From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 2/2] MIPS: jz4780: DTS: Probe the spi-gpio driver from devicetree
Date: Wed,  6 Jun 2018 21:37:30 +0200
Message-ID: <20180606193730.15087-2-malat@debian.org>
References: <20180606193730.15087-1-malat@debian.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606193730.15087-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The spi-gpio driver supports jz4780.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 809f01a62955..308079ee8dd3 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -167,6 +167,25 @@
 		};
 	};
 
+	spi_gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-chipselects = <2>;
+
+		gpio-miso = <&gpe 14 0>;
+		gpio-sck = <&gpe 15 0>;
+		gpio-mosi = <&gpe 17 0>;
+		cs-gpios = <&gpe 16 0
+			    &gpe 18 0>;
+
+		spidev@0 {
+			compatible = "spidev";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
+		};
+	};
+
 	uart0: serial@10030000 {
 		compatible = "ingenic,jz4780-uart";
 		reg = <0x10030000 0x100>;
-- 
2.11.0
