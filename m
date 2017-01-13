From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH v2 3/6] arm: dts: mt2701: Add nand device node
Date: Fri, 13 Jan 2017 16:42:55 +0800
Message-ID: <1484296978-18572-4-git-send-email-erin.lo@mediatek.com>
References: <1484296978-18572-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484296978-18572-1-git-send-email-erin.lo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Erin Lo <erin.lo@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Xiaolei Li <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Xiaolei Li <xiaolei.li@mediatek.com>

Add mt2701 nand device node, include nfi and bch ecc.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 87be52c..1182c43 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -261,6 +261,28 @@
 		status = "disabled";
 	};
 
+	nandc: nfi@1100d000 {
+		compatible = "mediatek,mt2701-nfc";
+		reg = <0 0x1100d000 0 0x1000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI>,
+			 <&pericfg CLK_PERI_NFI_PAD>;
+		clock-names = "nfi_clk", "pad_clk";
+		status = "disabled";
+		ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	bch: ecc@1100e000 {
+		compatible = "mediatek,mt2701-ecc";
+		reg = <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI_ECC>;
+		clock-names = "nfiecc_clk";
+		status = "disabled";
+	};
+
 	spi1: spi@11016000 {
 		compatible = "mediatek,mt2701-spi";
 		#address-cells = <1>;
-- 
1.9.1
