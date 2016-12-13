From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/7] ARM: dts: NSP: DT Clean-ups and more
Date: Tue, 13 Dec 2016 13:13:44 -0500
Message-ID: <1481652831-2744-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Northstar Plus device tree files have gotten messy and out of sync.
The first 5 patches correct this, the next 2 add support for new things.

Jon Mason (7):
  ARM: dts: NSP: DT Clean-ups
  ARM: dts: NSP: Correct NAND partition unit address
  ARM: dts: NSP: Add QSPI support to missing boards
  ARM: dts: NSP: Add BCM958625K switch ports
  ARM: dts: NSP: Add and enable amac2
  ARM: dts: NSP: Add Ethernet to NSP XMC
  ARM: dts: NSP: Add SD/MMC support

 arch/arm/boot/dts/bcm-nsp.dtsi     |  64 ++++++++++------
 arch/arm/boot/dts/bcm958522er.dts  |  35 ++++++++-
 arch/arm/boot/dts/bcm958525er.dts  |  35 ++++++++-
 arch/arm/boot/dts/bcm958525xmc.dts |  68 +++++++++++++----
 arch/arm/boot/dts/bcm958622hr.dts  |  42 +++++++++++
 arch/arm/boot/dts/bcm958623hr.dts  |  58 ++++++++++++--
 arch/arm/boot/dts/bcm958625hr.dts  |  72 ++++++++++++++----
 arch/arm/boot/dts/bcm958625k.dts   | 151 ++++++++++++++++++++++++++++---------
 arch/arm/boot/dts/bcm988312hr.dts  |  42 +++++++++++
 9 files changed, 472 insertions(+), 95 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
