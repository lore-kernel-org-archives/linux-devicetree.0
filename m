From: Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH v2 1/3] doc: dt: add documentation for Mediatek spi-nor controller
Date: Fri, 18 Sep 2015 14:58:51 +0800
Message-ID: <1442559533-17552-2-git-send-email-bayi.cheng@mediatek.com>
References: <1442559533-17552-1-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442559533-17552-1-git-send-email-bayi.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com, jteki@openedev.com, ezequiel@vanduardiasur.com.ar, Bayi Cheng <bayi.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for serial flash with
Mediatek serial flash controller

Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
---
 .../devicetree/bindings/mtd/mtk_quadspi.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk_quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
new file mode 100644
index 0000000..380b907
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtk_quadspi.txt
@@ -0,0 +1,27 @@
+* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
+
+Required properties:
+- compatible: 	  should be "mediatek,mt8173-nor";
+- reg: 		  physical base address and length of the controller's register
+- clocks: 	  the phandle of the clock needed by the QuadSPI controller
+- clock-names: 	  the name of the clocks
+		  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- #address-cells: should be <1>
+- #size-cells:	  should be <0>
+
+Example:
+
+nor_flash: spi@1100d000 {
+	compatible = "mediatek,mt8173-nor";
+	reg = <0 0x1100d000 0 0xe0>;
+	clocks = <&pericfg CLK_PERI_SPI>,
+		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
+	clock-names = "spi", "sf";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	flash@0 {
+		....
+	};
+};
+
-- 
1.8.1.1.dirty
