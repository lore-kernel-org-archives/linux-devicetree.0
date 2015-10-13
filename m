From: Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
Date: Tue, 13 Oct 2015 17:39:20 +0800
Message-ID: <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com, Bayi Cheng <bayi.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add Mediatek nor flash node

Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d18ee42..385c2e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -365,6 +365,21 @@
 			status = "disabled";
 		};
 
+		nor_flash: spi@1100d000 {
+			compatible = "mediatek,mt8173-nor";
+			reg = <0 0x1100d000 0 0xe0>;
+			clocks = <&pericfg CLK_PERI_SPI>,
+				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
+			clock-names = "spi", "sf";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+			};
+		};
+
 		i2c3: i2c3@11010000 {
 			compatible = "mediatek,mt8173-i2c";
 			reg = <0 0x11010000 0 0x70>,
-- 
1.8.1.1.dirty
