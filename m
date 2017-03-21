From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: setup DMA-channels for mmc0 and emmc for
 rk3188
Date: Tue, 21 Mar 2017 18:13:47 +0300
Message-ID: <1490109227-4006-1-git-send-email-al.kochet@gmail.com>
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
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexander Kochetkov <al.kochet@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit enable DMA-based transfers for SD/eMMC card adapters
and reduce number of interrupts produced by SD-card/eMMC-card
adapters.

Sometimes interrupts from SD-card/eMMC-card adapters running in
PIO mode blocks execution of hrtimers and I2S DMA callbacks for
a long periods (100 ms or more).

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 arch/arm/boot/dts/rk3188.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 44da3d42..de786f8 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -638,3 +638,13 @@
 &wdt {
 	compatible = "rockchip,rk3188-wdt", "snps,dw-wdt";
 };
+
+&mmc0 {
+	dmas = <&dmac2 1>;
+	dma-names = "rx-tx";
+};
+
+&emmc {
+	dmas = <&dmac2 4>;
+	dma-names = "rx-tx";
+};
-- 
1.7.9.5
