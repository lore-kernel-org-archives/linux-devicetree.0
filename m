From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: add support for NS, NSP, and NS2 clocks
Date: Wed, 18 Nov 2015 18:13:47 -0500
Message-ID: <1447888430-4451-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org


This patch series adds device tree support for the Broadcom Northstar,
Northstar Plus, and Northstar 2 clocks.

Last sent as an RFC (see https://lkml.org/lkml/2015/10/13/882) due to
the inability to merge because of the driver dependencies.  Those
necessary driver changes were merged into 4.4.  All comments have been
addressed and it is ready to be pulled in.


Jon Mason (3):
  ARM: dts: enable clock support for BCM5301X
  ARM: dts: enable clock support for Broadcom NSP
  ARM64: dts: enable clock support for Broadcom NS2

 arch/arm/boot/dts/bcm-nsp.dtsi        | 99 ++++++++++++++++++++++++++---------
 arch/arm/boot/dts/bcm5301x.dtsi       | 92 ++++++++++++++++++++++++--------
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 80 +++++++++++++++++++++++++++-
 3 files changed, 225 insertions(+), 46 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
