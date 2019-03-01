Return-Path: <SRS0=Q0RW=RE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH RESEND v2 2/2] media: dt-bindings: media: rcar_vin: Add r8a774a1 support
Date: Fri,  1 Mar 2019 14:24:13 +0000
Message-Id: <1551450253-63390-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551450253-63390-1-git-send-email-biju.das@bp.renesas.com>
References: <1551450253-63390-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
 Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 224a461..aa217b0 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -13,6 +13,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
    - "renesas,vin-r8a7743" for the R8A7743 device
    - "renesas,vin-r8a7744" for the R8A7744 device
    - "renesas,vin-r8a7745" for the R8A7745 device
+   - "renesas,vin-r8a774a1" for the R8A774A1 device
    - "renesas,vin-r8a774c0" for the R8A774C0 device
    - "renesas,vin-r8a7778" for the R8A7778 device
    - "renesas,vin-r8a7779" for the R8A7779 device
-- 
2.7.4
