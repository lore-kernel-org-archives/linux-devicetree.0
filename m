From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] ARM: shmobile: r8a7791: add for USB-DMAC
Date: Tue, 7 Apr 2015 16:53:49 +0900
Message-ID: <1428393231-5272-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on renesas.git / renesas-devel-20150406-v4.0-rc6
tag. (commit id = 8acf8f0880b6a142e6291b9a7d81f2f38c9425ac)

This patch set is related to the usb-dmac driver and renesas_usbhs driver.
And these drivers have been merged in each subsystem:

[ slave-dma repository ]
https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave-dma.git/commit/?h=for-linus&id=a7267831565030ab94dab76eb1afe5d4b63a1009
https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave-dma.git/commit/?h=for-linus&id=0c1c8ff32fa29e425b4938934c21afdb81104431

[ usb repository ]
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=7a96b78464bd8ba72c1c3095c543c1402db59e35
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=9b53d9af7aac09cf249d72bfbf15f08e47c4f7fe
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=ab330cf3888d8e0779fa05a243d53ba9f53a7ba9

Changes from v1:
 - Rebase the latest renesas-devel tag.

Yoshihiro Shimoda (2):
  ARM: shmobile: r8a7791: add USB-DMAC device nodes
  ARM: shmobile: r8a7791: Enable DMA for HSUSB

 arch/arm/boot/dts/r8a7791.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

-- 
1.9.1

