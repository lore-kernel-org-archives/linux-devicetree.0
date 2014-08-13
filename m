From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [RESEND PATCH v2 4/4] dt-bindings: add bindings for mediatek intpol
Date: Wed, 13 Aug 2014 10:11:24 +0800
Message-ID: <1407895884-18131-5-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Olof Johansson <olof@lixom.net>, Jonas Jensen <jonas.jensen@gmail.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add binding documentation for Mediatek SoC GIC interrupt polarity extension.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 .../bindings/interrupt-controller/mediatek,intpol.txt    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
new file mode 100644
index 0000000..16ea372
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
@@ -0,0 +1,16 @@
+Mediatek 65xx/81xx GIC interrupt polarity extension
+
+Mediatek SOCs contain controllable inverter for each GIC SPI interrupt,
+these can be used as GIC interrupt polarity extension.
+
+Required properties:
+- compatible: Compatible property value should be "mediatek,mt6577-intpol"
+
+- reg: Physical base address of the int pol registers and length of memory
+  mapped region.
+
+Example:
+       intpol: intpol@10200100 {
+               compatible = "mediatek,mt6577-intpol";
+               reg = <0x10200100 0x1c>;
+       };
-- 
1.8.1.1.dirty
