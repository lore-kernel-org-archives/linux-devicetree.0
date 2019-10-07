From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] arm64: dts: rockchip: Update nanopi4 phy reset properties
Date: Mon,  7 Oct 2019 12:33:26 +0100
Message-ID: <4d16c24ae3651a2119cf5bb1213f46a9fce4b39a.1570444773.git.robin.murphy@arm.com>
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
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use the now-preferred generic phy reset properties instead of the
dwmac-specific ones.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index dd16c80d923e..170f7ed6d773 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -152,9 +152,6 @@
 	phy-handle = <&rtl8211e>;
 	phy-mode = "rgmii";
 	phy-supply = <&vcc3v3_s3>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 30000>;
-	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
 	tx_delay = <0x28>;
 	rx_delay = <0x11>;
 	status = "okay";
@@ -168,6 +165,9 @@
 			reg = <1>;
 			interrupt-parent = <&gpio3>;
 			interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <30000>;
+			reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.21.0.dirty
