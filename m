From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: NSP: add PL330 support and XMC board
Date: Tue,  7 Jun 2016 18:28:05 -0400
Message-ID: <1465338487-14932-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for the PL330 DMA engine and the XMC form factor for
Broadcom Northstar Plus SoCs


Jon Mason (2):
  ARM: dts: NSP: Add XMC board support
  ARM: dts: NSP: Add PL330 support

 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/bcm-nsp.dtsi     |  17 ++++++
 arch/arm/boot/dts/bcm958525xmc.dts | 109 +++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958525xmc.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
