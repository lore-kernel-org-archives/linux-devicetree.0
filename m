Return-Path: <SRS0=Q0RW=RE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH RESEND V2 0/4] Add VIN support to RZ/G2M
Date: Fri,  1 Mar 2019 15:45:32 +0000
Message-Id: <1551455136-45574-1-git-send-email-biju.das@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add VIN support for RZ/G2M SoC.
RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.

This patchset is based on media_tree git

V1-->V2
  *Rebased and resent. Not sending patch5 in this patch series since it is
   present in media tree commit 0c85e78fb1d3742c 
   ("arm64: dts: renesas: r8a774a1: Add VIN and CSI-2 nodes") 
 
V1:
   https://www.spinics.net/lists/devicetree/msg247956.html

Biju Das (4):
  media: dt-bindings: media: rcar-csi2: Add r8a774a1 support
  media: rcar-csi2: Enable support for r8a774a1
  media: dt-bindings: media: rcar_vin: Add r8a774a1 support
  media: rcar-vin: Enable support for r8a774a1

 Documentation/devicetree/bindings/media/rcar_vin.txt          | 1 +
 Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 1 +
 drivers/media/platform/rcar-vin/rcar-core.c                   | 4 ++++
 drivers/media/platform/rcar-vin/rcar-csi2.c                   | 4 ++++
 4 files changed, 10 insertions(+)

-- 
2.7.4
