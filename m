Return-Path: <SRS0=YKRD=MJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: usb-xhci: Document r8a7744 support
Date: Thu, 27 Sep 2018 14:42:38 +0100
Message-Id: <1538055758-3416-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document r8a7744 xhci support. The driver will use the fallback
compatible string "renesas,rcar-gen2-xhci", therefore no driver
change is needed.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
This patch is tested against linux-next next-20180927 and usb-next
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index fb564e7..fea8b15 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -8,6 +8,7 @@ Required properties:
     - "marvell,armada-375-xhci" for Armada 375 SoCs
     - "marvell,armada-380-xhci" for Armada 38x SoCs
     - "renesas,xhci-r8a7743" for r8a7743 SoC
+    - "renesas,xhci-r8a7744" for r8a7744 SoC
     - "renesas,xhci-r8a774a1" for r8a774a1 SoC
     - "renesas,xhci-r8a7790" for r8a7790 SoC
     - "renesas,xhci-r8a7791" for r8a7791 SoC
-- 
2.7.4
