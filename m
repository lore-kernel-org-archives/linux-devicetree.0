From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 06/17] ARM: dts: mvebu: armada-39x: update the SDHCI node
 on Armada 39x
Date: Thu,  4 Aug 2016 12:14:09 +0200
Message-ID: <1470305660-6601-7-git-send-email-jaz@semihalf.com>
References: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, jaz@semihalf.com, linux@armlinux.org.uk, nadavh@marvell.com, alior@marvell.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, mw@semihalf.com, thomas.petazzoni@free-electrons.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

Commit 1140011ee9d9 ("mmc: sdhci-pxav3: Modify clock settings
for the SDR50 and DDR50 modes") has extended the Device Tree
binding used to describe PXAv3 SDHCI controllers in order to be
able to use the SDR50 and DDR50 modes.

This commit updates the Device Tree description of the Armada
39x SDHCI controller in other to take advantage of this
functionality.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-39x.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index dc6efd3..cb66f20 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -380,7 +380,10 @@
 
 			sdhci@d8000 {
 				compatible = "marvell,armada-380-sdhci";
-				reg = <0xd8000 0x1000>, <0xdc000 0x100>;
+				reg-names = "sdhci", "mbus", "conf-sdio3";
+				reg = <0xd8000 0x1000>,
+					<0xdc000 0x100>,
+					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
 				mrvl,clk-delay-cycles = <0x1F>;
-- 
1.8.3.1
