From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] ARM: shmobile: r8a7790: add for USB-DMAC
Date: Fri, 8 May 2015 16:13:05 +0900
Message-ID: <1431069187-6088-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on renesas.git / renesas-devel-20150507-v4.1-rc1
tag. (commit id = c3059b3fff4ed6568783fdabdee1d62a55aa469c)

This patch set is related to the usb-dmac driver and renesas_usbhs driver.
Almost all patches for the drivers have been merged in Linus tree.
And a fixed patch for renesas_usbhs driver have beed merged in the subsystem:

[ linux repository ]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/dma/sh/usb-dmac.c?id=0c1c8ff32fa29e425b4938934c21afdb81104431
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/dma/sh/usb-dmac.c?id=d7d8e892aa6fe280a2e2974d9fd1ec9253ee1a05
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/renesas_usbhs?id=7a96b78464bd8ba72c1c3095c543c1402db59e35
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/renesas_usbhs?id=9b53d9af7aac09cf249d72bfbf15f08e47c4f7fe
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/renesas_usbhs?id=ab330cf3888d8e0779fa05a243d53ba9f53a7ba9

[ usb repository ]
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=5a294e5469891d0701183049c4a9678887fa7091

Changes from v2:
 - Add "Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>" in patch 1.
 - Change dma-names in patch 2.

Changes from v1:
 - Rebase the latest renesas-devel tag.

Yoshihiro Shimoda (2):
  ARM: shmobile: r8a7790: add USB-DMAC device nodes
  ARM: shmobile: r8a7790: Enable DMA for HSUSB

 arch/arm/boot/dts/r8a7790.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

-- 
1.9.1

