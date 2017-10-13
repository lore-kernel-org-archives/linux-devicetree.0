From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] rcar-du: add R8A774[35] DU driver(s) support
Date: Fri, 13 Oct 2017 16:22:18 +0100
Message-ID: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

In order to be able to define du nodes in r8a7743 and r8a7745 device
trees, we need to define data structures, compatible strings, missing
clock, and update the dt-bindings.
I'll send out the patches to add the du nodes in r8a774[35] device trees
once the patches in this series get accepted.

Best regards,

Fabrizio Castro (4):
  dt-bindings: display: rcar-du: Document R8A774[35] DU
  drm: rcar-du: Add R8A7743 support
  clk: renesas: cpg-mssr: Add du1 clock to R8A7745
  drm: rcar-du: Add R8A7745 support

 .../devicetree/bindings/display/renesas,du.txt     | 30 ++++++++-------
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 44 ++++++++++++++++++++++
 3 files changed, 62 insertions(+), 13 deletions(-)

-- 
2.7.4

