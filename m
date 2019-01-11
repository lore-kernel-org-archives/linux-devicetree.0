From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH 0/3] arm64: ti: k3-am654: USB support
Date: Fri, 11 Jan 2019 12:00:58 +0200
Message-ID: <1547200861-17795-1-git-send-email-rogerq@ti.com>
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

To test, you need to first apply the below 2 series.

AM654 USB2 PHY support https://lkml.org/lkml/2018/12/5/908
AM654 DWC3 support https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1896101.html

cheers,
-roger

Jyri Sarha (1):
  arm64: dts: ti: am654: Add Main System Control Module node

Roger Quadros (2):
  arm64: dts: ti: k3-am6: add USB support
  arm64: dts: ti: k3-am654-base-board: enable USB1

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi       | 88 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 20 ++++++
 2 files changed, 108 insertions(+)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
