Return-Path: <SRS0=f0E1=RE=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add USB-HOST support to cat874
Date: Fri,  1 Mar 2019 11:05:44 +0000
Message-Id: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

While trying to add USB-HOST support to the cat874 board,
it came up that of_usb_get_dr_mode_by_phy was selecting
the wrong DT node to use for dr_mode.
Also, drivers/phy/renesas/phy-rcar-gen3-usb2.c was registering
IRQs, no matter the dr_mode.

This series adds all that is required to add USB-HOST support
to the cat874 board, and also removes the hsusb from Draak's DT
as not necessary anymore.

Thanks,
Fab

Fabrizio Castro (4):
  usb: common: Consider only available nodes for dr_mode
  phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG
  arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST support
  arm64: dts: renesas: r8a77995: draak: Remove hsusb node

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts  |  5 -----
 drivers/phy/renesas/phy-rcar-gen3-usb2.c        | 26 ++++++++++++-------------
 drivers/usb/common/common.c                     |  2 ++
 4 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.7.4
