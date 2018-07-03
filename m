From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH 4/4] dts: aspeed-g5: Add bmc-misc-ctrl nodes to devicetree
Date: Tue,  3 Jul 2018 17:04:13 +1000
Message-ID: <20180703070413.28756-5-andrew@aj.id.au>
References: <20180703070413.28756-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703070413.28756-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, gregkh@linuxfoundation.org, Eugene.Cho@dell.com, a.amelkin@yadro.com, stewart@linux.ibm.com, benh@kernel.crashing.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 192 +++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 17f2714d18a7..57d477e17c0c 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -187,6 +187,77 @@
 					aspeed,external-nodes = <&gfx &lhc>;
 
 				};
+
+				field@2c.16 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x2c>;
+					mask = <0x00030000>;
+					label = "dac-mux";
+				};
+
+				field@50.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x50>;
+					mask = <0xffffffff>;
+					label = "vga0";
+					read-only;
+				};
+
+				field@54.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x54>;
+					mask = <0xffffffff>;
+					label = "vga1";
+					read-only;
+				};
+
+				field@58.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x58>;
+					mask = <0xffffffff>;
+					label = "vga2";
+					read-only;
+				};
+
+				field@5c.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x5c>;
+					mask = <0xffffffff>;
+					label = "vga3";
+					read-only;
+				};
+
+				field@60.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x60>;
+					mask = <0xffffffff>;
+					label = "vga4";
+					read-only;
+				};
+
+				field@64.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x64>;
+					mask = <0xffffffff>;
+					label = "vga5";
+					read-only;
+				};
+
+				field@68.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x68>;
+					mask = <0xffffffff>;
+					label = "vga6";
+					read-only;
+				};
+
+				field@6c.0 {
+					compatible = "bmc-misc-ctrl";
+					offset = <0x6c>;
+					mask = <0xffffffff>;
+					label = "vga7";
+					read-only;
+				};
 			};
 
 			rng: hwrng@1e6e2078 {
@@ -343,6 +414,127 @@
 						#reset-cells = <1>;
 					};
 
+					field@f0.24 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf0 24 8>;
+						mask = <0xff000000>;
+						label = "sio-2b";
+					};
+
+					field@f0.16 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf0>;
+						mask = <0x00ff0000>;
+						label = "sio-2a";
+					};
+
+					field@f0.8 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf0>;
+						mask = <0x0000ff00>;
+						bit-shift = <8>;
+						label = "sio-29";
+					};
+
+					field@f0.0 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf0>;
+						mask = <0x000000ff>;
+						label = "sio-28";
+					};
+
+					field@f4.24 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf4>;
+						mask = <0xff000000>;
+						label = "sio-2f";
+					};
+
+					field@f4.16 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf4>;
+						mask = <0x00ff0000>;
+						label = "sio-2e";
+					};
+
+					field@f4.8 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf4>;
+						mask = <0x0000ff00>;
+						label = "sio-2d";
+					};
+
+					field@f4.0 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf4>;
+						mask = <0x000000ff>;
+						label = "sio-2c";
+					};
+
+					field@f8.24 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf8>;
+						mask = <0xff000000>;
+						read-only;
+						label = "sio-23";
+					};
+
+					field@f8.16 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf8>;
+						mask = <0x00ff0000>;
+						read-only;
+						label = "sio-22";
+					};
+
+					field@f8.8 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf8>;
+						mask = <0x0000ff00>;
+						read-only;
+						label = "sio-21";
+					};
+
+					field@f8.0 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xf8>;
+						mask = <0x000000ff>;
+						read-only;
+						label = "sio-20";
+					};
+
+					field@fc.24 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xfc>;
+						mask = <0xff000000>;
+						read-only;
+						label = "sio-27";
+					};
+
+					field@fc.16 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xfc>;
+						mask = <0x00ff0000>;
+						read-only;
+						label = "sio-26";
+					};
+
+					field@fc.8 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xfc>;
+						mask = <0x0000ff00>;
+						read-only;
+						label = "sio-25";
+					};
+
+					field@fc.0 {
+						compatible = "bmc-misc-ctrl";
+						offset = <0xfc>;
+						mask = <0x000000ff>;
+						read-only;
+						label = "sio-24";
+					};
+
 					ibt: ibt@c0 {
 						compatible = "aspeed,ast2500-ibt-bmc";
 						reg = <0xc0 0x18>;
-- 
2.17.1
