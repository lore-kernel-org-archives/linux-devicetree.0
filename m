From: <sean.wang@mediatek.com>
Subject: [PATCH v2 1/2] Documentation: devicetree: Add document bindings for
 mtk-cir
Date: Tue, 10 Jan 2017 17:13:50 +0800
Message-ID: <1484039631-25120-2-git-send-email-sean.wang@mediatek.com>
References: <1484039631-25120-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484039631-25120-1-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mchehab@osg.samsung.com, hdegoede@redhat.com, hkallweit1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, keyhaede@gmail.com, sean@mess.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, hverkuil@xs4all.nl, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

This patch adds documentation for devicetree bindings for
Mediatek consumer IR controller.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../devicetree/bindings/media/mtk-cir.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt

diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
new file mode 100644
index 0000000..3850cbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mtk-cir.txt
@@ -0,0 +1,24 @@
+Device-Tree bindings for Mediatek consumer IR controller found in
+Mediatek SoC family
+
+Required properties:
+- compatible	    : "mediatek,mt7623-cir"
+- clocks	    : list of clock specifiers, corresponding to
+		      entries in clock-names property;
+- clock-names	    : should contain "clk" entries;
+- interrupts	    : should contain IR IRQ number;
+- reg		    : should contain IO map address for IR.
+
+Optional properties:
+- linux,rc-map-name : Remote control map name.
+
+Example:
+
+cir: cir@10013000 {
+	compatible = "mediatek,mt7623-cir";
+	reg = <0 0x10013000 0 0x1000>;
+	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+	clocks = <&infracfg CLK_INFRA_IRRX>;
+	clock-names = "clk";
+	linux,rc-map-name = "rc-rc6-mce";
+};
-- 
2.7.4
