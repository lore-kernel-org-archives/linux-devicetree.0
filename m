From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/3] arm64: dts: rockchip: add dwc2 otg controller on px30
Date: Thu,  2 Aug 2018 15:01:32 +0200
Message-ID: <20180802130133.4898-3-heiko@sntech.de>
References: <20180802130133.4898-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802130133.4898-1-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, balbi@kernel.org, gregkh@linuxfoundation.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, cl@rock-chips.com, hminas@synopsys.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the node for the dwc2-based otg controller on the px30 soc.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index dc3b22ca9a0e..fed782194a94 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -702,6 +702,22 @@
 			<100000000>, <200000000>;
 	};
 
+	usb20_otg: usb@ff300000 {
+		compatible = "rockchip,px30-usb", "rockchip,rk3066-usb",
+			     "snps,dwc2";
+		reg = <0x0 0xff300000 0x0 0x40000>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_OTG>;
+		clock-names = "otg";
+		dr_mode = "otg";
+		g-np-tx-fifo-size = <16>;
+		g-rx-fifo-size = <280>;
+		g-tx-fifo-size = <256 128 128 64 32 16>;
+		g-use-dma;
+		power-domains = <&power PX30_PD_USB>;
+		status = "disabled";
+	};
+
 	usb_host0_ehci: usb@ff340000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xff340000 0x0 0x10000>;
-- 
2.17.0
