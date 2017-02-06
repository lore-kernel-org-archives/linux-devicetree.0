From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v2 01/10] Document: DT: mediatek: multiple base address support for sysirq
Date: Mon, 6 Feb 2017 20:15:27 +0800
Message-ID: <1486383336-16892-2-git-send-email-mars.cheng@mediatek.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

This describes how to specify multiple base addresses for sysirq
in mediatek platforms.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 .../interrupt-controller/mediatek,sysirq.txt       |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 9d1d72c..1718454 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -18,16 +18,21 @@ Required properties:
 	"mediatek,mt2701-sysirq"
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
+- #intpol-bases: Indicate how many base addresses to be used, default is 1.
 - interrupt-parent: phandle of irq parent for sysirq. The parent must
   use the same interrupt-cells format as GIC.
 - reg: Physical base address of the intpol registers and length of memory
-  mapped region.
+  mapped region. Could be multiple bases here. Ex: mt6797 needs 2 reg, others
+  need 1. If not set, the default is 1.
 
 Example:
-	sysirq: interrupt-controller@10200100 {
-		compatible = "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq";
+	sysirq: intpol-controller@10200620 {
+		compatible = "mediatek,mt6797-sysirq",
+			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
 		#interrupt-cells = <3>;
+		#intpol-bases = <2>;
 		interrupt-parent = <&gic>;
-		reg = <0 0x10200100 0 0x1c>;
+		reg = <0 0x10220620 0 0x20>,
+		      <0 0x10220690 0 0x10>;
 	};
-- 
1.7.9.5
