From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH RESEND 0/3]  ARM: dts: NSP: Add PCI, NAND, and TWD Support to DT
Date: Mon, 2 Nov 2015 13:40:55 -0500
Message-ID: <1446489658-29705-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Resending due to lack of any response to the original series

Add PCI, NAND, and TWD Support to the Broadcom Northstar Plus SoC device
tree file.  Since no driver changes are needed to enable these pieces of
hardware, only the device tree changes are required to make them
functional.

Jon Mason (3):
  ARM: dts: NSP: Add PCI support
  ARM: dts: NSP: Add NAND Support to DT
  ARM: dts: NSP: Add TWD Support to DT

 arch/arm/boot/dts/bcm-nsp.dtsi   | 104 ++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/bcm958625k.dts |  50 +++++++++++++++++++
 2 files changed, 153 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
