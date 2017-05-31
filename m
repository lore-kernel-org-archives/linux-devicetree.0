From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 7/7] arm64: dts: marvell: use new binding for the system
 controller on ap806
Date: Wed, 31 May 2017 16:07:28 +0200
Message-ID: <e12e9b027462646e16cb51783d6e14660a019ba6.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The new binding for the system controller on ap806 moved the clock into a
subnode. This preliminary step will allow to add gpio and pinctrl
subnodes

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 0c25ec62a2a3..205037e3e7dc 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -193,7 +193,7 @@
 				#size-cells = <0>;
 				cell-index = <0>;
 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ap_syscon 3>;
+				clocks = <&ap_clk 3>;
 				status = "disabled";
 			};
 
@@ -204,7 +204,7 @@
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 				timeout-ms = <1000>;
-				clocks = <&ap_syscon 3>;
+				clocks = <&ap_clk 3>;
 				status = "disabled";
 			};
 
@@ -214,7 +214,7 @@
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
-				clocks = <&ap_syscon 3>;
+				clocks = <&ap_clk 3>;
 				status = "disabled";
 			};
 
@@ -224,7 +224,7 @@
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
-				clocks = <&ap_syscon 3>;
+				clocks = <&ap_clk 3>;
 				status = "disabled";
 
 			};
@@ -234,17 +234,20 @@
 				reg = <0x6e0000 0x300>;
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 				clock-names = "core";
-				clocks = <&ap_syscon 4>;
+				clocks = <&ap_clk 4>;
 				dma-coherent;
 				marvell,xenon-phy-slow-mode;
 				status = "disabled";
 			};
 
 			ap_syscon: system-controller@6f4000 {
-				compatible = "marvell,ap806-system-controller",
-					     "syscon";
-				#clock-cells = <1>;
+				compatible = "syscon", "simple-mfd";
 				reg = <0x6f4000 0x1000>;
+
+				ap_clk: clock {
+					compatible = "marvell,ap806-clock";
+					#clock-cells = <1>;
+				};
 			};
 		};
 	};
-- 
git-series 0.9.1
