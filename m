From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 08/11] MIPS: mscc: ocelot: add SerDes mux DT node
Date: Thu,  4 Oct 2018 14:22:05 +0200
Message-ID: <20181004122208.32272-9-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Microsemi Ocelot has a set of register for SerDes/switch port muxing
as well as PCIe muxing for a specific SerDes, so let's add the device
and all SerDes in the Device Tree.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index 149b1a7e7091..8ce317c5b9ed 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -234,6 +234,11 @@
 		hsio: syscon@10d0000 {
 			compatible = "mscc,ocelot-hsio", "syscon", "simple-mfd";
 			reg = <0x10d0000 0x10000>;
+
+			serdes: serdes {
+				compatible = "mscc,vsc7514-serdes";
+				#phy-cells = <2>;
+			};
 		};
 	};
 };
-- 
2.17.1
