From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: mt2712: add binding document
Date: Mon, 31 Jul 2017 16:22:11 +0800
Message-ID: <1501489333-23145-2-git-send-email-zhiyong.tao@mediatek.com>
References: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, hongkun.cao@mediatek.com, srv_heupstream@mediatek.com, linux-gpio@vger.kernel.org, biao.huang@mediatek.com, Zhiyong Tao <zhiyong.tao@mediatek.com>, erin.lo@mediatek.com, liguo.zhang@mediatek.com, linux-kernel@vger.kernel.org, hongzhou.yang@mediatek.com, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The commit adds mt2712 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 17631d0..37d7447 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -5,6 +5,7 @@ The Mediatek's Pin controller is used to control SoC pins.
 Required properties:
 - compatible: value should be one of the following.
 	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
+	"mediatek,mt2712-pinctrl", compatible with mt2712 pinctrl.
 	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
 	"mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
 	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
-- 
1.7.9.5
