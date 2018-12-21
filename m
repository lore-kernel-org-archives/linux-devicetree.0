From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 3/4] ARM: dts: clps711x: Add syscon phandle to device nodes
Date: Fri, 21 Dec 2018 13:30:18 +0300
Message-ID: <20181221103019.15374-3-shc_work@mail.ru>
References: <20181221103019.15374-1-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181221103019.15374-1-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

This patch adds syscon based phandle to Cirrus Logic CLPS711X device
nodes that can use it. These phandles will be used to replace usage
of syscon_regmap_lookup_by_compatible() and
syscon_regmap_lookup_by_pdevname() by syscon_regmap_lookup_by_phandle().

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/boot/dts/ep7209.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
index 48a1660a9cf2..1630b3d3873e 100644
--- a/arch/arm/boot/dts/ep7209.dtsi
+++ b/arch/arm/boot/dts/ep7209.dtsi
@@ -119,6 +119,7 @@
 			compatible = "cirrus,ep7209-fb";
 			reg = <0x800002c0 0xd44>, <0x60000000 0xc000>;
 			clocks = <&clks CLPS711X_CLK_BUS>;
+			syscon = <&syscon1>;
 			status = "disabled";
 		};
 
@@ -158,6 +159,7 @@
 			reg = <0x80000500 0x4>;
 			interrupts = <15>;
 			clocks = <&clks CLPS711X_CLK_SPI>;
+			syscon = <&syscon3>;
 			status = "disabled";
 		};
 
@@ -181,6 +183,7 @@
 			clocks = <&clks CLPS711X_CLK_PLL>;
 			clock-names = "pll";
 			interrupts = <32>;
+			syscon = <&syscon3>;
 			status = "disabled";
 		};
 
@@ -192,6 +195,7 @@
 
 	mctrl: mctrl {
 		compatible = "cirrus,ep7209-mctrl-gpio";
+		gpio,syscon-dev = <&syscon1 0 0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
-- 
2.13.0
