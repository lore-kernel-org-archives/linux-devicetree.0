From: <sean.wang@mediatek.com>
Subject: [PATCH v5 1/7] dt-bindings: arm: mediatek: add MT7622 string to the
 PMIC wrapper doc
Date: Mon, 16 Oct 2017 15:07:38 +0800
Message-ID: <dc5653280b762c7c6d08240d8e9c8843bfb597e0.1508135937.git.sean.wang@mediatek.com>
References: <cover.1508135937.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1508135937.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chenglin.xu@mediatek.com, Sean Wang <sean.wang@mediatek.com>, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 107700d..bf80e3f 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -19,6 +19,7 @@ IP Pairing
 Required properties in pwrap device node.
 - compatible:
 	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
+	"mediatek,mt7622-pwrap" for MT7622 SoCs
 	"mediatek,mt8135-pwrap" for MT8135 SoCs
 	"mediatek,mt8173-pwrap" for MT8173 SoCs
 - interrupts: IRQ for pwrap in SOC
@@ -36,9 +37,12 @@ Required properties in pwrap device node.
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
-- pmic: Mediatek PMIC MFD is the child device of pwrap
+- pmic: Using either MediaTek PMIC MFD as the child device of pwrap
   See the following for child node definitions:
   Documentation/devicetree/bindings/mfd/mt6397.txt
+  or the regulator-only device as the child device of pwrap, such as MT6380.
+  See the following definitions for such kinds of devices.
+  Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
 
 Example:
 	pwrap: pwrap@1000f000 {
-- 
2.7.4
