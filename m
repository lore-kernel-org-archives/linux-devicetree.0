From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Broadcom Cygnus device tree changes
Date: Thu, 17 Sep 2015 16:57:58 -0700
Message-ID: <1442534282-21356-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series cleans up the Broadcom Cygnus device tree files and makes it
more consistent with the rest of Broadcom iProc device tree files. This patch
series also enables various peripherals on Cygnus boards. They include:

bcm11360_entphn:
NAND

bcm958300k:
touchscreen

bcm958305k:
I2C, PCIe, NAND, touchscreen

Code is based on v4.3-rc1 and is available on GITHUB:
https://github.com/Broadcom/cygnus-linux/tree/cygnus-dt-v1

Ray Jui (4):
  ARM: dts: clean up Cygnus DT files
  ARM: dts: Enable various peripherals on bcm958305k
  ARM: dts: Enable NAND support on bcm911360_entphn
  ARM: dts: enable touchscreen support on Cygnus

 arch/arm/boot/dts/bcm-cygnus.dtsi      | 337 +++++++++++++++++----------------
 arch/arm/boot/dts/bcm911360_entphn.dts |  28 ++-
 arch/arm/boot/dts/bcm911360k.dts       |  10 +-
 arch/arm/boot/dts/bcm958300k.dts       |  45 ++---
 arch/arm/boot/dts/bcm958305k.dts       |  41 +++-
 5 files changed, 257 insertions(+), 204 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
