From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/5] Add Du support to RZ/G1C and RZ/G1N
Date: Fri, 21 Sep 2018 19:08:26 +0100
Message-ID: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear All,

this series documents and adds driver support for the DUs found
inside RZ/G1C (a.k.a. R8A77470) and RZ/G1N (a.k.a. R8A7744).
Also, this series enables the SII902X driver as the SiI9022ACNU
HDMI transmitter is found on the iwg23s.

Thanks,
Fab

Biju Das (2):
  dt-bindings: display: renesas: du: Document the r8a7744 bindings
  drm: rcar-du: Add R8A7744 support

Fabrizio Castro (3):
  dt-bindings: display: renesas: du: Document the r8a77470 bindings
  drm: rcar-du: Add r8a77470 support
  ARM: shmobile: defconfig: Enable SII902X

 .../devicetree/bindings/display/renesas,du.txt     |  4 ++++
 arch/arm/configs/shmobile_defconfig                |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 27 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.7.4
