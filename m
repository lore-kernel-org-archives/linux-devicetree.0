From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH 1/4] dt-bindings: iio: adc: mediatek: Add document for mt6765
Date: Thu, 16 May 2019 16:10:44 +0800
Message-ID: <1557994247-16739-2-git-send-email-chun-hung.wu@mediatek.com>
References: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com, jg_poxu@mediatek.com, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add compatible node for mt6765 auxadc

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
index 0df9bef..ab7efab 100644
--- a/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
@@ -15,6 +15,7 @@ Required properties:
     - "mediatek,mt2712-auxadc": For MT2712 family of SoCs
     - "mediatek,mt7622-auxadc": For MT7622 family of SoCs
     - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
+    - "mediatek,mt6765-auxadc": For MT6765 family of SoCs
   - reg: Address range of the AUXADC unit.
   - clocks: Should contain a clock specifier for each entry in clock-names
   - clock-names: Should contain "main".
-- 
1.9.1
