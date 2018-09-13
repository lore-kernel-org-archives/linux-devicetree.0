From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: sun9i: Fix I2C bus warnings
Date: Thu, 13 Sep 2018 13:12:38 -0500
Message-ID: <20180913181245.25484-14-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

dtc has new checks for I2C buses. The sun9i-a80 dts file has a node named
'i2c' which causes a false positive warning. As the node is a RSB bus,
correct the node name to be 'rsb' to fix the warnings.

arch/arm/boot/dts/sun9i-a80-cubieboard4.dtb: Warning (i2c_bus_reg): /soc/i2c@8003400/codec@e89:reg: I2C address must be less than 10-bits, got "0xe89"
arch/arm/boot/dts/sun9i-a80-cubieboard4.dtb: Warning (i2c_bus_reg): /soc/i2c@8003400/pmic@745:reg: I2C address must be less than 10-bits, got "0x745"
arch/arm/boot/dts/sun9i-a80-optimus.dtb: Warning (i2c_bus_reg): /soc/i2c@8003400/codec@e89:reg: I2C address must be less than 10-bits, got "0xe89"
arch/arm/boot/dts/sun9i-a80-optimus.dtb: Warning (i2c_bus_reg): /soc/i2c@8003400/pmic@745:reg: I2C address must be less than 10-bits, got "0x745"

Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm/boot/dts/sun9i-a80.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 25591d6883ef..d9532fb1ef65 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -1196,7 +1196,7 @@
 			};
 		};
 
-		r_rsb: i2c@8003400 {
+		r_rsb: rsb@8003400 {
 			compatible = "allwinner,sun8i-a23-rsb";
 			reg = <0x08003400 0x400>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1
