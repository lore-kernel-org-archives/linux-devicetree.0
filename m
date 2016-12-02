From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] ARM64: dts: meson-gx: move the MDIO node to meson-gx
Date: Sat,  3 Dec 2016 00:47:35 +0100
Message-ID: <20161202234739.22929-2-martin.blumenstingl@googlemail.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

stmmac's MDIO bus is currently only defined in meson-gxl.dtsi. Move it
up to meson-gx to allow us to keep the stmmac configuration for
meson-gxbb similar to the configuration on meson-gxl.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 47ab306..a2c3ca6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -371,6 +371,12 @@
 			interrupt-names = "macirq";
 			phy-mode = "rgmii";
 			status = "disabled";
+
+			mdio0: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+			};
 		};
 
 		apb: apb@d0000000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 9f89b99..d338f9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -57,12 +57,6 @@
 		 <&clkc CLKID_FCLK_DIV2>,
 		 <&clkc CLKID_MPLL2>;
 	clock-names = "stmmaceth", "clkin0", "clkin1";
-
-	mdio0: mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-	};
 };
 
 &aobus {
-- 
2.10.2
