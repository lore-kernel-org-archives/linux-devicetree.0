From: <sean.wang@mediatek.com>
Subject: [PATCH v2 12/30] arm: dts: mt7623: add mmc nodes to the mt7623.dtsi
 file
Date: Wed, 26 Apr 2017 17:25:56 +0800
Message-ID: <1493198774-4478-13-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Add e/MMC nodes to the mt7623.dtsi file.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index f15d65a..1ea9b18 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -355,6 +355,28 @@
 		status = "disabled";
 	};
 
+	mmc0: mmc@11230000 {
+		compatible = "mediatek,mt7623-mmc",
+			     "mediatek,mt8135-mmc";
+		reg = <0 0x11230000 0 0x1000>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_0>,
+			 <&topckgen CLK_TOP_MSDC30_0_SEL>;
+		clock-names = "source", "hclk";
+		status = "disabled";
+	};
+
+	mmc1: mmc@11240000 {
+		compatible = "mediatek,mt7623-mmc",
+			     "mediatek,mt8135-mmc";
+		reg = <0 0x11240000 0 0x1000>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_1>,
+			 <&topckgen CLK_TOP_MSDC30_1_SEL>;
+		clock-names = "source", "hclk";
+		status = "disabled";
+	};
+
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
 			     "mediatek,mt2701-hifsys",
-- 
1.9.1
