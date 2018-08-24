From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/6] dt-bindings: usb-xhci: Add r8a774a1 support
Date: Fri, 24 Aug 2018 08:56:12 +0100
Message-ID: <1535097375-5561-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document RZ/G2M (R8A774A1) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index ac4cd0d..fb564e7 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -8,6 +8,7 @@ Required properties:
     - "marvell,armada-375-xhci" for Armada 375 SoCs
     - "marvell,armada-380-xhci" for Armada 38x SoCs
     - "renesas,xhci-r8a7743" for r8a7743 SoC
+    - "renesas,xhci-r8a774a1" for r8a774a1 SoC
     - "renesas,xhci-r8a7790" for r8a7790 SoC
     - "renesas,xhci-r8a7791" for r8a7791 SoC
     - "renesas,xhci-r8a7793" for r8a7793 SoC
@@ -17,7 +18,8 @@ Required properties:
     - "renesas,xhci-r8a77990" for r8a77990 SoC
     - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
       device
-    - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
+    - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
+      device
     - "xhci-platform" (deprecated)
 
     When compatible with the generic version, nodes must list the
-- 
2.7.4
