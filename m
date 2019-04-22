From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: adc: mt8183: add binding document
Date: Mon, 22 Apr 2019 19:54:16 +0800
Message-ID: <20190422115417.16751-2-zhiyong.tao@mediatek.com>
References: <20190422115417.16751-1-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190422115417.16751-1-zhiyong.tao@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com, srv_heupstream@mediatek.com, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, erin.lo@mediatek.com, hui.liu@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The commit adds mt8183 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
index 0df9befdaecc..05bc79d8483c 100644
--- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
@@ -15,6 +15,7 @@ Required properties:
     - "mediatek,mt2712-auxadc": For MT2712 family of SoCs
     - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
     - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
+    - "mediatek,mt8183-auxadc": For MT8183 family of SoCs
   - reg: Address range of the AUXADC unit.
   - clocks: Should contain a clock specifier for each entry in clock-names
   - clock-names: Should contain "main".
-- 
2.12.5
