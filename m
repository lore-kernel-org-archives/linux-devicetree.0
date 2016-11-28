From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: NS2: Add GICv2m and PAXC
Date: Mon, 28 Nov 2016 14:31:29 -0500
Message-ID: <1480361491-22221-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for GICv2m and PAXC.  GICv2m was tested on an e1000e
adapter, with some hacking of the driver to verify MSI and legacy
interrupts work.

Jon Mason (2):
  arm64: dts: NS2: enable GICv2m for PAXB/PAXC interfaces
  arm64: dts: NS2: enable PAXC on NS2 SVK

 arch/arm64/boot/dts/broadcom/ns2-svk.dts |   4 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 121 +++++++++++++++++++++++++------
 2 files changed, 101 insertions(+), 24 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
