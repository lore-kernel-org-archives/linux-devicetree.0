From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] media: dt-bindings: rcar-csi2: Add r8a774c0
Date: Thu, 13 Dec 2018 20:21:49 +0000
Message-ID: <1544732509-6911-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Add the compatible string for RZ/G2E (a.k.a. R8A774C0) to the
list of supported SoCs.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
index 2824489..11cf38d 100644
--- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
+++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
@@ -2,12 +2,13 @@ Renesas R-Car MIPI CSI-2
 ------------------------
 
 The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
-Renesas R-Car family of devices. It is used in conjunction with the
+Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
 R-Car VIN module, which provides the video capture capabilities.
 
 Mandatory properties
 --------------------
  - compatible: Must be one or more of the following
+   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
    - "renesas,r8a7795-csi2" for the R8A7795 device.
    - "renesas,r8a7796-csi2" for the R8A7796 device.
    - "renesas,r8a77965-csi2" for the R8A77965 device.
-- 
2.7.4
