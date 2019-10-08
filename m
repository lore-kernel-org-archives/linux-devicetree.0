From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 00/10] Add USB2/USB3/INTC-EX support to RZ/G2N
Date: Tue,  8 Oct 2019 11:38:42 +0100
Message-ID: <1570531132-21856-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Dear All,

this series adds USB 2.0, USB 3.0, and INTC-EX support to the RZ/G2N
SoC specfic dtsi.

This series depends on the following patches:
* https://patchwork.kernel.org/cover/11166155/
* https://patchwork.kernel.org/cover/11157129/
* https://patchwork.kernel.org/cover/11158259/
* https://patchwork.kernel.org/cover/11171325/
* https://patchwork.kernel.org/cover/11173787/
* https://patchwork.kernel.org/patch/11174777/

Thanks,
Fab

Fabrizio Castro (10):
  dt-bindings: rcar-gen3-phy-usb2: Add r8a774b1 support
  dt-bindings: dmaengine: usb-dmac: Add binding for r8a774b1
  dt-bindings: usb: renesas_usbhs: Add r8a774b1 support
  dt-bindings: rcar-gen3-phy-usb3: Add r8a774b1 support
  dt-bindings: usb-xhci: Add r8a774b1 support
  dt-bindings: usb: renesas_usb3: Document r8a774b1 support
  arm64: dts: renesas: r8a774b1: Add USB2.0 phy and host (EHCI/OHCI)
    device nodes
  arm64: dts: renesas: r8a774b1: Add USB-DMAC and HSUSB device nodes
  arm64: dts: renesas: r8a774b1: Add USB3.0 device nodes
  arm64: dts: renesas: r8a774b1: Add INTC-EX device node

 .../devicetree/bindings/dma/renesas,usb-dmac.txt   |   1 +
 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   2 +
 .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |   2 +
 .../devicetree/bindings/usb/renesas,usb3-peri.txt  |   1 +
 .../devicetree/bindings/usb/renesas,usbhs.txt      |   1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 138 +++++++++++++++++++--
 7 files changed, 136 insertions(+), 10 deletions(-)

-- 
2.7.4
