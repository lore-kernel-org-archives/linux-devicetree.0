From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for mediatek device tree bindings
Date: Fri, 22 Jun 2018 12:08:16 +0200
Message-ID: <20180622100816.29320-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v3:
  - Update for next-20180622,

v2:
  - Add Reviewed-by.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/soc/mediatek/":

-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:4/4=100%)
+Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Matthias Brugger <matthias.bgg@gmail.com> (commit_signer:4/4=100%)
-Sean Wang <sean.wang@mediatek.com> (commit_signer:3/4=75%,authored:3/4=75%)
-Ulf Hansson <ulf.hansson@linaro.org> (commit_signer:2/4=50%)
-Chen Zhong <chen.zhong@mediatek.com> (commit_signer:1/4=25%)
-"weiyi.lu@mediatek.com" <weiyi.lu@mediatek.com> (authored:1/4=25%)
+linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
+linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bb8ce891719ed21..baa4dc046daf9cdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1634,6 +1634,7 @@ M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/mediatek/
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
-- 
2.17.1
