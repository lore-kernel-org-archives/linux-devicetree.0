From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 01/11] MIPS: mscc: ocelot: make HSIO registers address range a syscon
Date: Thu,  4 Oct 2018 14:21:58 +0200
Message-ID: <20181004122208.32272-2-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

HSIO contains registers for PLL5 configuration, SerDes/switch port
muxing and a thermal sensor, hence we can't keep it in the switch DT
node.

Acked-by: Paul Burton <paul.burton@mips.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index f7eb612b46ba..149b1a7e7091 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -107,7 +107,6 @@
 			reg = <0x1010000 0x10000>,
 			      <0x1030000 0x10000>,
 			      <0x1080000 0x100>,
-			      <0x10d0000 0x10000>,
 			      <0x11e0000 0x100>,
 			      <0x11f0000 0x100>,
 			      <0x1200000 0x100>,
@@ -121,10 +120,10 @@
 			      <0x1280000 0x100>,
 			      <0x1800000 0x80000>,
 			      <0x1880000 0x10000>;
-			reg-names = "sys", "rew", "qs", "hsio", "port0",
-				    "port1", "port2", "port3", "port4", "port5",
-				    "port6", "port7", "port8", "port9", "port10",
-				    "qsys", "ana";
+			reg-names = "sys", "rew", "qs", "port0", "port1",
+				    "port2", "port3", "port4", "port5", "port6",
+				    "port7", "port8", "port9", "port10", "qsys",
+				    "ana";
 			interrupts = <21 22>;
 			interrupt-names = "xtr", "inj";
 
@@ -231,5 +230,10 @@
 			pinctrl-0 = <&miim1>;
 			status = "disabled";
 		};
+
+		hsio: syscon@10d0000 {
+			compatible = "mscc,ocelot-hsio", "syscon", "simple-mfd";
+			reg = <0x10d0000 0x10000>;
+		};
 	};
 };
-- 
2.17.1
