From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: NSP: dma-coherent and USB3 changes
Date: Tue, 25 Jul 2017 18:06:09 -0400
Message-ID: <1501020372-19607-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add dma-coherent to the relevant DT entries, and add USB3 support

Jon Mason (3):
  ARM: dts: NSP: Add dma-coherent to relevant DT entries
  ARM: dts: NSP: Rearrage USB entries
  ARM: dts: NSP: Add USB3 and USB3 PHY to NSP

 arch/arm/boot/dts/bcm-nsp.dtsi     | 61 +++++++++++++++++++++++++++++---------
 arch/arm/boot/dts/bcm958522er.dts  |  8 +++++
 arch/arm/boot/dts/bcm958525er.dts  |  8 +++++
 arch/arm/boot/dts/bcm958525xmc.dts |  8 +++++
 arch/arm/boot/dts/bcm958622hr.dts  |  8 +++++
 arch/arm/boot/dts/bcm958623hr.dts  |  8 +++++
 arch/arm/boot/dts/bcm958625hr.dts  |  8 +++++
 arch/arm/boot/dts/bcm958625k.dts   |  8 +++++
 8 files changed, 103 insertions(+), 14 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
