From: <min.guo@mediatek.com>
Subject: [PATCH 0/4] Add MediaTek MUSB Controller Driver
Date: Thu, 27 Dec 2018 15:34:22 +0800
Message-ID: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

These patches introduce the MediaTek MUSB controller driver.

The driver can be configured as Dual-Role Device (DRD),
Peripheral Only and Host Only modes. This has beed tested on
MT2701 with a variety of devices in host mode and with the 
f_mass gadget driver in peripheral mode, plugging otg cables
in/out a lot of times in all possible imaginable plug orders

Min Guo (4):
  dt-bindings: usb: musb: Add support for MediaTek musb controller
  arm: dts: mt2701: Add usb2 device nodes
  usb: musb: Move musbhsdma macro definition to musb_dma.h
  usb: musb: Add support for MediaTek musb controller

 .../devicetree/bindings/usb/mediatek,musb.txt      |  49 ++
 arch/arm/boot/dts/mt2701-evb.dts                   |  21 +
 arch/arm/boot/dts/mt2701.dtsi                      |  34 ++
 drivers/usb/musb/Kconfig                           |   8 +-
 drivers/usb/musb/Makefile                          |   1 +
 drivers/usb/musb/mediatek.c                        | 562 +++++++++++++++++++++
 drivers/usb/musb/musb_core.c                       |  10 +
 drivers/usb/musb/musb_core.h                       |   1 +
 drivers/usb/musb/musb_dma.h                        |   7 +
 drivers/usb/musb/musb_host.c                       |  79 ++-
 drivers/usb/musb/musb_regs.h                       |   6 +
 drivers/usb/musb/musbhsdma.c                       |  41 +-
 12 files changed, 782 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
 create mode 100644 drivers/usb/musb/mediatek.c

-- 
1.9.1
