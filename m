From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v6 01/13] dt-bindings: mfd: mediatek: mt6397: change to
 relative paths
Date: Sun, 18 Aug 2019 15:55:59 +0200
Message-ID: <20190818135611.7776-2-frank-w@public-files.de>
References: <20190818135611.7776-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190818135611.7776-1-frank-w@public-files.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-mediatek@lists.infradead.org
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sean Wang <sean.wang@mediatek.com>, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo@towertech.it>, linux-pm@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Josef Friedl <josef.friedl@speed.at>, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

paths in dt-bindings should be relative as suggested by Lee Johnes

Suggested-By: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes since v5: splitted from dt-bindings: add powercontroller
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 0ebd08af777d..ab3163a60929 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -12,7 +12,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
 It is interfaced to host controller using SPI interface by a proprietary hardware
 called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
 See the following for pwarp node definitions:
-Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+../soc/mediatek/pwrap.txt
 
 This document describes the binding for MFD device and its sub module.
 
@@ -27,9 +27,9 @@ Optional subnodes:
 - regulators
 	Required properties:
 		- compatible: "mediatek,mt6397-regulator"
-	see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+	see ../regulator/mt6397-regulator.txt
 		- compatible: "mediatek,mt6323-regulator"
-	see Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
+	see ../regulator/mt6323-regulator.txt
 - codec
 	Required properties:
 		- compatible: "mediatek,mt6397-codec"
@@ -39,12 +39,12 @@ Optional subnodes:
 - led
 	Required properties:
 		- compatible: "mediatek,mt6323-led"
-	see Documentation/devicetree/bindings/leds/leds-mt6323.txt
+	see ../leds/leds-mt6323.txt
 
 - keys
 	Required properties:
 		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
-	see Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+	see ../input/mtk-pmic-keys.txt
 
 Example:
 	pwrap: pwrap@1000f000 {
-- 
2.17.1
