From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Fri, 25 Jul 2014 01:00:09 +0200
Message-ID: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds an initial device tree for the Parallella board.
UART, SD card, Ethernet are enabled.
Not yet enabled are HDMI, QSPI flash and 2x USB.

v2 adds some SPI and FPGA pieces and tidies the device tree with a=20
compatible string and matching documentation.

Not having all pieces for testing all of this (most notably I'm missing=
=20
ADI ADV7513 and AXI-HDMI support for VDMA and axi-clkgen, as well as=20
the 25Q128A flash chip for QSPI), I've kept new things in separate patc=
hes
so that we can make progress on the basic version and possibly squash
further cherry-picked pieces.

Punnaiah Choudary Kalluri had recently proposed to extend the Chipidea=20
USB driver for Zynq; it kept complaining about the PHY though, and I=20
haven't spotted a revised version based on the generic driver yet.
https://patchwork.kernel.org/patch/4434681/

My rebasing work branch is here:
https://github.com/afaerber/linux/commits/parallella-next

Regards,
Andreas

Cc: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> (USB)
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> (HDMI)

Andreas F=C3=A4rber (11):
  Documentation: devicetree: Adapteva vendor prefix
  Documentation: devicetree: Adapteva boards
  ARM: dts: zynq: Add Parallella device tree
  ARM: dts: zynq: Update deprecated xuartps clock names
  ARM: dts: zynq: Add QSPI for Parallella
  ARM: dts: zynq: Add DMAC for Parallella
  Documentation: devicetree: Fix Xilinx VDMA specification
  ARM: dts: zynq: Add VDMA to Parallella
  Documentation: devicetree: Fix ADI AXI SPDIF specification
  ARM: dts: zynq: Add SPDIF for Parallella
  ARM: dts: zynq: Add AXI clkgen for Parallella

 Documentation/devicetree/bindings/arm/adapteva.txt |   7 ++
 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |   2 +-
 .../devicetree/bindings/sound/adi,axi-spdif-tx.txt |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/zynq-7000.dtsi                   |  58 +++++++++-
 arch/arm/boot/dts/zynq-parallella.dts              | 119 +++++++++++++=
++++++++
 7 files changed, 188 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/adapteva.txt
 create mode 100644 arch/arm/boot/dts/zynq-parallella.dts

--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
