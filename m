Return-Path: <SRS0=Q0RW=RE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH RESEND V2 1/4] media: dt-bindings: media: rcar-csi2: Add r8a774a1 support
Date: Fri,  1 Mar 2019 15:45:33 +0000
Message-Id: <1551455136-45574-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551455136-45574-1-git-send-email-biju.das@bp.renesas.com>
References: <1551455136-45574-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document RZ/G2M (R8A774A1) SoC bindings.

The RZ/G2M SoC is similar to R-Car M3-W (R8A7796).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V1-->V2
  * No change
---
 Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
index d63275e..9932458 100644
--- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
+++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
@@ -8,6 +8,7 @@ R-Car VIN module, which provides the video capture capabilities.
 Mandatory properties
 --------------------
  - compatible: Must be one or more of the following
+   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
    - "renesas,r8a774c0-csi2" for the R8A774C0 device.
    - "renesas,r8a7795-csi2" for the R8A7795 device.
    - "renesas,r8a7796-csi2" for the R8A7796 device.
-- 
2.7.4
