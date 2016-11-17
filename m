From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: NS2: Add sdio1, PCI phys
Date: Thu, 17 Nov 2016 18:25:01 -0500
Message-ID: <1479425103-2119-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The second SDIO seems to have been forgotten to be enabled in the
Northstar2 SVK dts.  Also, the PCI PHY entries are missing from the PCI
bus device tree entries.

Jon Mason (2):
  arm64: dts: NS2: enable sdio1
  arm64: dts: NS2: Add PCI PHYs

 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 4 ++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
