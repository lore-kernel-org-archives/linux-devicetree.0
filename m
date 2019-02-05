From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 0/3] arm64: ti: k3-am654: USB support
Date: Tue, 5 Feb 2019 14:45:19 +0200
Message-ID: <1549370722-414-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com
Cc: nm@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

The AM654 SoC supports 2 DWC3 USB controller instances. The
AM654 base board supports the 2nd (USB1) instance in high-speed.

This series enables support for USB1 instance on the AM654-base-board.

The series depends on [1] and [2]. Both are in the -next branch of their
respective maintainer trees.

To test you can apply on top of linux-next. As usb/next was just pushed
today, it might have not reached linux-next yet. If so please pull that from [3].

If using arm64 defconfig, you need to enable
	CONFIG_USB_DWC3_KEYSTONE=y
	CONFIG_OMAP_USB2=y
and the necessary USB drivers that you want to test. e.g. USB network adapter.

[1] AM654 USB2 PHY support https://lkml.org/lkml/2018/12/5/908
[2] AM654 DWC3 support https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1896101.html
[3] usb-next https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/log/?h=next

Changelog:
v2
- usb & phy nodes are not kept disabled in k3-am65-main.dtsi.
  Unused ones are disabled in board dts instead.

cheers,
-roger


Jyri Sarha (1):
  arm64: dts: ti: am654: Add Main System Control Module node

Roger Quadros (2):
  arm64: dts: ti: k3-am6: add USB support
  arm64: dts: ti: k3-am654-base-board: enable USB1

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi       | 84 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 28 +++++++++
 2 files changed, 112 insertions(+)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
