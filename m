From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v3 02/14] ARM: dts: sunxi: h3/h5: Fix i2c2 register address
Date: Tue, 26 Sep 2017 09:22:22 +0200
Message-ID: <20170926072234.27481-3-clabbe.montjoie@gmail.com>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The unit address and register address does not match.
This patch fix the register address with the good one.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index b37ed3461229..289f2cd06dfe 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -632,7 +632,7 @@
 
 		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun6i-a31-i2c";
-			reg = <0x01c2b000 0x400>;
+			reg = <0x01c2b400 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C2>;
 			resets = <&ccu RST_BUS_I2C2>;
-- 
2.13.5
