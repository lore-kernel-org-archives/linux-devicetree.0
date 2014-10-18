From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH RFC V3 0/3] mxs: add ocotp support for i.MX23 and i.MX28
Date: Sat, 18 Oct 2014 10:32:49 +0000
Message-ID: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series brings readonly support for the On Chip OTP cells in the 
i.MX23 and i.MX28 processor. The driver uses files (one for each cell) 
in sysfs as interface.

This series based on the second version of the patches from 
Christoph G. Baumann, but without write support which is too invasive.

The driver has been tested only with a i.MX28 board, so feedback from 
i.MX23 users are very welcome.

changes in V3:
- drop write support
- take care of i.MX23 which has less registers
- drop unnecessary header file
- move static variables into driver data
- add devicetree probing
- fix missing bank closing in error case
- use kobj from platform device for sysfs
- add SYSFS to Kconfig
- add binding file
- code cleanup

Stefan Wahren (3):
  mxs: add binding for fsl ocotp
  mxs: add driver for ocotp in i.MX23 and i.MX28
  mxs: enable ocotp for i.MX23 and i.MX28

 .../devicetree/bindings/misc/fsl,octop.txt         |   14 +
 arch/arm/boot/dts/imx23.dtsi                       |    3 +-
 arch/arm/boot/dts/imx28.dtsi                       |    3 +-
 drivers/misc/Kconfig                               |   13 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/fsl_ocotp.c                           |  332 ++++++++++++++++++++
 6 files changed, 362 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/fsl,octop.txt
 create mode 100644 drivers/misc/fsl_ocotp.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
