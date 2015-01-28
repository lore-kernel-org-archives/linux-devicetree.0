From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 1/2] dt: bindings: Add Mediatek RTC driver binding document
Date: Wed, 28 Jan 2015 17:27:55 +0800
Message-ID: <1422437276-41334-2-git-send-email-eddie.huang@mediatek.com>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, rtc-linux@googlegroups.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, yingjoe.chen@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add MT63xx RTC driver binding document.

Signed-off-by: Tianping Fang <tianping.fang@mediatek.com>
Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 .../devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt b/Documentation/devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt
new file mode 100644
index 0000000..6347d4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt63xx-rtc.txt
@@ -0,0 +1,18 @@
+Mediatek MT63xx real-time clock
+
+MT63xx is Mediatek PMIC chip series. RTC is one submodule of PMIC chip.
+The RTC maintains seconds counter, also provide alarm function.
+
+Required properties:
+- compatible: Should be "mediatek,mt6397-rtc".
+- reg: base physical address and size of the registers.
+- interrupt-parent: phandle for the interrupt controller
+- interrupts: RTC alarm interrupt.
+
+Examples:
+rtc: rtc@e000 {
+	compatible = "mediatek,mt6397-rtc";
+	reg = <0xe000 0x3e>;
+	interrupt-parent = <&pmic>;
+	interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
1.8.1.1.dirty
