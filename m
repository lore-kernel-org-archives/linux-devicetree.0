From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/5] SMP support for Broadcom NSP
Date: Sat, 5 Dec 2015 06:53:39 -0500
Message-ID: <1449316424-14549-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes in V6:
* Updated 'enable-method' and 'secondary-boot-reg' device tree
property for Kona and NSP in DT and documentation file.

Changes in v5:
* Made 'enable-method' for SMP per 'cpu' core instead of 'cpus'
node, in the DT files for BCM NSP and BCM4708.

Change in v4:
* Cleaned up kona_smp.c and associated DT file.
* Corrected documentation for DT bindings.
* Corrected secondary-boot-reg entry for bcm4708 DT file.

Change in v3:
* Fixed patch subject from RESEND PATCH to PATCH
* Deleted arch/arm/mach-bcm/bcm_nsp.h file
* Removed inclusion of header file bcm_nsp.h in platsmp.c
* Removed unused variable 'timeout' in nsp_boot_secondary()

Changes in v2:
Removed the pen_holding method of SMP bringup for NSP SoC and
replaced it with simple wakeup of secondary core using ARM IPI.


This series adds SMP support for Broadcom's Northstar Plus SoC.

There are similar SMP enablement methods for many ARMv7 bsed SoCs.
BCM NSP SoC, has a typical such mechanism - after power-on, the
secondary core is held in a standby state, primary core provides a
startup address for the secondary core and wakes it up. Booting of
the secondary core is serialized using pen_release global variable.

The startup address is programmed at a special register location
which is defined in the device tree using a "secondary-boot-reg"
property in a node whose "enable-method" property matches.

The first patch adds cpu-enable-method in the device tree bindings
documentation. It also updates ARM CPU device tree documentation
with Broadcom Northstar Plus CPU details.

The second patch adds SMP support to the BCM NSP device tree file.

The third patch, enables SMP on BCM NSP. It also consolidates
common SMP handling between BCM NSP and BCM Kona.

The final patch, enables SMP on BCM 4708 and this patch is pulled
in from Jon Mason's patch from the mailing list.

This patch series is constructed based on Linux v4.4-rc1.

The source code is available at GITHUB:
https://github.com/Broadcom/cygnus-linux/tree/nsp-smp-v2

Jon Mason (1):
  ARM: BCM: Add SMP support for Broadcom 4708

Kapil Hali (4):
  dt-bindings: add SMP enable-method for Broadcom NSP
  ARM: BCM: Clean up SMP support for Broadcom Kona
  ARM: dts: Add SMP support for Broadcom NSP
  ARM: BCM: Add SMP support for Broadcom NSP

 .../bindings/arm/bcm/brcm,bcm11351-cpu-method.txt  |  12 +-
 .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       |  39 ++++++
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  33 +++--
 arch/arm/boot/dts/bcm11351.dtsi                    |   4 +-
 arch/arm/boot/dts/bcm21664.dtsi                    |   4 +-
 arch/arm/boot/dts/bcm4708.dtsi                     |   3 +-
 arch/arm/mach-bcm/Kconfig                          |   3 +
 arch/arm/mach-bcm/Makefile                         |  11 +-
 arch/arm/mach-bcm/{kona_smp.c => platsmp.c}        | 144 +++++++++++++++++----
 10 files changed, 201 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
 rename arch/arm/mach-bcm/{kona_smp.c => platsmp.c} (63%)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
