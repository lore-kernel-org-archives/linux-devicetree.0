From: Yong Liang <yong.liang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mt8183: Add watchdog dt-binding
Date: Mon, 22 Apr 2019 14:08:03 +0800
Message-ID: <1555913284-5591-1-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, "yong.liang" <yong.liang@mediatek.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "yong.liang" <yong.liang@mediatek.com>

This patch add watchdog binding documentation for
watchdog on MTK Socs.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 8682d6a..f0824aa 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -9,6 +9,7 @@ Required properties:
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
 	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
+	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
1.7.9.5
