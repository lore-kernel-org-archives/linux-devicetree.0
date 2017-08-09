From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/4] dt-bindings: phy-mt65xx-usb: supports PCIe, SATA and rename file
Date: Wed, 9 Aug 2017 13:29:49 +0800
Message-ID: <b2d4141dd3c0dc33d60a727561014d91c5f70176.1502256365.git.chunfeng.yun@mediatek.com>
References: <d58705436a2563b87a67609a472db3c3d84b36f5.1502256365.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d58705436a2563b87a67609a472db3c3d84b36f5.1502256365.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

add support for PCIe and SATA, also add some new compatibles.

due to phy-mt65xx-usb.txt holds the bindings for all mediatek SoCs
with T-PHY controller, change the name to phy-mtk-tphy.txt to
reflect that.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../phy/{phy-mt65xx-usb.txt => phy-mtk-tphy.txt}        | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/phy/{phy-mt65xx-usb.txt => phy-mtk-tphy.txt} (88%)

diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
similarity index 88%
rename from Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
rename to Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index 0acc5a9..faf1808 100644
--- a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -1,13 +1,18 @@
-mt65xx USB3.0 PHY binding
+MediaTek T-PHY binding
 --------------------------
 
-This binding describes a usb3.0 phy for mt65xx platforms of Medaitek SoC.
+T-phy controller supports physical layer functionality for a number of
+controllers on MediaTek SoCs, such as, USB2.0, USB3.0, PCIe, and SATA.
 
 Required properties (controller (parent) node):
  - compatible	: should be one of
-		  "mediatek,mt2701-u3phy"
-		  "mediatek,mt2712-u3phy"
-		  "mediatek,mt8173-u3phy"
+		  "mediatek,generic-tphy-v1"
+		  "mediatek,generic-tphy-v2"
+		  "mediatek,mt2701-u3phy" (deprecated)
+		  "mediatek,mt2712-u3phy" (deprecated)
+		  "mediatek,mt8173-u3phy";
+		  make use of "mediatek,generic-tphy-v1" on mt2701 instead and
+		  "mediatek,generic-tphy-v2" on mt2712 instead.
  - clocks	: (deprecated, use port's clocks instead) a list of phandle +
 		  clock-specifier pairs, one for each entry in clock-names
  - clock-names	: (deprecated, use port's one instead) must contain
@@ -35,6 +40,8 @@ Required properties (port (child) node):
 		  cell after port phandle is phy type from:
 			- PHY_TYPE_USB2
 			- PHY_TYPE_USB3
+			- PHY_TYPE_PCIE
+			- PHY_TYPE_SATA
 
 Example:
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
