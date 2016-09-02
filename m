From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 0/3] MIPS: OCTEON: Add support for D-Link DSR-500N router
Date: Sat,  3 Sep 2016 00:11:33 +0300
Message-ID: <20160902211136.8610-1-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

D-Link DSR-500N is close to 1000N and with small changes we
can support both.

A.

Aaro Koskinen (3):
  MIPS: OCTEON: split dlink_dsr-1000n.dts
  MIPS: OCTEON: add DTS for D-Link DSR-500N
  MIPS: OCTEON: fix PCI interrupt routing on D-Link DSR-500N

 .../boot/dts/cavium-octeon/dlink_dsr-1000n.dts     | 45 +----------------
 .../dts/cavium-octeon/dlink_dsr-500n-1000n.dtsi    | 58 ++++++++++++++++++++++
 .../mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts | 42 ++++++++++++++++
 arch/mips/pci/pci-octeon.c                         |  2 +
 4 files changed, 103 insertions(+), 44 deletions(-)
 create mode 100644 arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n-1000n.dtsi
 create mode 100644 arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts

-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
