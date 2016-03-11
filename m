From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/4] Implement SoC bus driver for Vybrid
Date: Fri, 11 Mar 2016 14:29:27 +0530
Message-ID: <cover.1457684688.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset implements SoC bus support for Freescale Vybrid platform,
implementing the following
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-devices-soc

This a reworked version of an older patchset series posted in June 2015
which was at v5 then [1]. Since the NVMEM framework was then getting
introduced, we decided that first a NVMEM driver for OCOTP peripheral
being in place would be better.

Compared to the older revisions, this driver now relies on NVMEM
consumer API using the NVMEM based vf610_ocotp driver which has
already been in mainline for a while now. Also now a new syscon
abstraction "syscon_regmap_read_from_offset" is implemented and
exported from syscon allowing accessing a register from a syscon
reference like this

ocotp-cfg1 = <&ocotp 0x20>;

avoiding code repetition in the driver.

One point on which we were not sure here is whether we really should
introduce a new Kconfig symbol as being introduced here. While we
could just enable it when SOC_VF610 is selected, this however would
introduce circular dependencies.

This patch series is based on top of shawn's for-next branch and
tested on Colibri Vybrid VF50 and VF61 modules.

Feedback is most welcome.

[1] Older v5:
http://lkml.iu.edu/hypermail/linux/kernel/1506.0/03787.html
Even earlier versions:
Version 4 of the patchset can be found here
https://lkml.org/lkml/2015/5/26/199
Version 3 of the patchset can be found here
http://www.spinics.net/lists/arm-kernel/msg420847.html
Version 2 of the patchset can be found here
http://www.spinics.net/lists/devicetree/msg80654.html
Version 1 of the patchset can be found here
http://www.spinics.net/lists/devicetree/msg80257.html
The RFC version can be found here
https://lkml.org/lkml/2015/5/11/13

Regards,
Sanchayan.

Sanchayan Maity (4):
  mfd: syscon: Introduce syscon_regmap_read_from_offset
  ARM: dts: vfxxx: Add device tree node for OCOTP
  ARM: dts: vfxxx: Add OCROM and phandle entries for Vybrid SoC bus driver
  soc: Add SoC bus driver for Freescale Vybrid Platform

 arch/arm/boot/dts/vfxxx.dtsi |  28 +++++++-
 drivers/mfd/syscon.c         |  30 ++++++++
 drivers/soc/Kconfig          |   1 +
 drivers/soc/fsl/Kconfig      |  10 +++
 drivers/soc/fsl/Makefile     |   1 +
 drivers/soc/fsl/soc-vf610.c  | 160 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/syscon.h   |  10 +++
 7 files changed, 239 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fsl/Kconfig
 create mode 100644 drivers/soc/fsl/soc-vf610.c

-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
