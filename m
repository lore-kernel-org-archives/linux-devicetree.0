From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH  0/4] Add USB function support
Date: Fri, 13 Oct 2017 16:50:39 +0100
Message-ID: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add USB function support for iWave RZ/G1E (R8A7745) board.
This series has been tested against renesas-dev tag 20171013-v4.14-rc4.

The patch "ARM: dts: iwg22d-sodimm: Enable HS-USB" depend upon
the below patch

* [4/4] ARM: dts: iwg22d-sodimm: sort dt nodes
https://patchwork.kernel.org/patch/10004691/

This patch has documentation dependency on below patches

* [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/
* [v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990113/

Regards,

Biju Das (4):
  ARM: dts: r8a7745: Add HS-USB device node
  ARM: dts: r8a7745: Add USB-DMAC device nodes
  ARM: dts: r8a7745: Enable DMA for HSUSB
  ARM: dts: iwg22d-sodimm: Enable HS-USB

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 11 +++++++
 arch/arm/boot/dts/r8a7745.dtsi              | 45 +++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
