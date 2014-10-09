From: Joe.C <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 7/7] dt-bindings: add bindings for mediatek sysirq
Date: Thu, 9 Oct 2014 22:29:40 +0800
Message-ID: <1412864980-20273-8-git-send-email-yingjoe.chen@mediatek.com>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add binding documentation for Mediatek SoC SYSIRQ.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,sysirq.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
new file mode 100644
index 0000000..63d8fa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
@@ -0,0 +1,19 @@
+Mediatek 65xx/81xx sysirq
+
+Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
+interrupt.
+
+Required properties:
+- compatible: Compatible property value should be "mediatek,mt6577-sysirq"
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
