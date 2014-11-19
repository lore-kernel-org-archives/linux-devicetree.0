From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v7 4/4] dt-bindings: add bindings for mediatek sysirq
Date: Wed, 19 Nov 2014 22:14:11 +0800
Message-ID: <1416406451-4578-5-git-send-email-yingjoe.chen@mediatek.com>
References: <1416406451-4578-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416406451-4578-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, hc.yen@mediatek.com, srv_heupstream@mediatek.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Yijing Wang <wangyijing@huawei.com>, Rob Herring <robh+dt@kernel.org>, nathan.chung@mediatek.com, yingjoe.chen@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, Bjorn Helgaas <bhelgaas@google.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for Mediatek SoC SYSIRQ.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,sysirq.txt      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
new file mode 100644
index 0000000..8669536
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
@@ -0,0 +1,26 @@
+Mediatek 65xx/81xx sysirq
+
+Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
+interrupt.
+
+Required properties:
+- compatible: should be one of:
+	"mediatek,mt8135-sysirq"
+	"mediatek,mt8127-sysirq"
+	"mediatek,mt6589-sysirq"
+	"mediatek,mt6582-sysirq"
+	"mediatek,mt6577-sysirq"
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Must use the same cells/format as parent controller.
+- interrupt-parent: phandle of irq domain parent for sysirq.
+- reg: Physical base address of the intpol registers and length of memory
+  mapped region.
+
+Example:
+	sysirq: interrupt-controller@10200100 {
+		compatible = "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0 0x10200100 0 0x1c>;
+	};
-- 
1.8.1.1.dirty
