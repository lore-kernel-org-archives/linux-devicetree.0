From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v3 01/12] dt-bindings: mediatek: multiple bases support for sysirq
Date: Sun, 19 Mar 2017 23:26:22 +0800
Message-ID: <1489937193-2953-2-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-clk@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

This describes how to specify multiple base addresses for sysirq
in mediatek platforms.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 .../interrupt-controller/mediatek,sysirq.txt       |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 9d1d72c..40bf9b9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -21,13 +21,16 @@ Required properties:
 - interrupt-parent: phandle of irq parent for sysirq. The parent must
   use the same interrupt-cells format as GIC.
 - reg: Physical base address of the intpol registers and length of memory
-  mapped region.
+  mapped region. Could be multiple bases here. Ex: mt6797 needs 2 reg, others
+  need 1.
 
 Example:
-	sysirq: interrupt-controller@10200100 {
-		compatible = "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq";
+	sysirq: intpol-controller@10200620 {
+		compatible = "mediatek,mt6797-sysirq",
+			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
 		#interrupt-cells = <3>;
 		interrupt-parent = <&gic>;
-		reg = <0 0x10200100 0 0x1c>;
+		reg = <0 0x10220620 0 0x20>,
+		      <0 0x10220690 0 0x10>;
 	};
-- 
1.7.9.5

