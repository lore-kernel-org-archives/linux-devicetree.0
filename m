From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/6] Document r8a774a1 USB bindings
Date: Fri, 24 Aug 2018 08:56:09 +0100
Message-ID: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear All,

this series aims at documenting USB related dt-bindings for the
r8a774a1.

Applies on next-20180823.

Thanks,
Fab

Biju Das (1):
  dt-bindings: dmaengine: usb-dmac: Add binding for r8a774a1

Fabrizio Castro (5):
  dt-bindings: rcar-gen3-phy-usb2: Add r8a774a1 support
  dt-bindings: rcar-gen3-phy-usb3: Add r8a774a1 support
  dt-bindings: usb-xhci: Add r8a774a1 support
  dt-bindings: usb: renesas_usbhs: Add r8a774a1 support
  usb: gadget: udc: renesas_usb3: Add r8a774a1 support

 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt   |  1 +
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  9 ++++++---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 10 ++++++----
 Documentation/devicetree/bindings/usb/renesas_usb3.txt       |  5 +++--
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt      |  3 ++-
 Documentation/devicetree/bindings/usb/usb-xhci.txt           |  4 +++-
 6 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.7.4
