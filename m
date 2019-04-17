From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: set TX PBL for rk3328-roc-cc gmac
Date: Thu, 18 Apr 2019 00:01:00 +0300
Message-ID: <20190417210059.26262-1-papadakospan@gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <jose.abreu@synopsys.com>, Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, "Leonidas P. Papadakos" <papadakospan@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some rockchip boards have issues with tx checksumming for packets
larger than 1498 B.

An iperf test will tell you that transmissions stop almost immediately.

A workaround to this issue is disabling TX checksumming offload,
and one of the ways to do that is snps,force_thresh_dma_mode.

But after some discussion here it seems there is another path:
https://lkml.org/lkml/2019/4/5/148

Setting txpbl is a better-performing (maybe temporary) solution
compared to disabling T offload.

In my testing with a Libre Computer Renegade, this was the best
all-around option, and increasing the MTU doesn't cause a queue timeout anymore.

Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
index 5d499c908..974f2dcdf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
@@ -141,10 +141,10 @@
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	snps,force_thresh_dma_mode;
 	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
+	snps,txpbl = <0x4>;
 	tx_delay = <0x24>;
 	rx_delay = <0x18>;
 	status = "okay";
-- 
2.21.0
