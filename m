From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] SMP support for Broadcom NSP
Date: Wed, 14 Oct 2015 13:46:57 -0400
Message-ID: <1444844820-24290-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

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

Finally, third patch, enables SMP on BCM NSP. It also consolidates
common SMP handling between BCM NSP and BCM Kona.

This patch series is constructed based on Linux v4.3-rc2.

The source code is available at GITHUB:
https://github.com/Broadcom/cygnus-linux/tree/nsp-smp-v1

Kapil Hali (3):
  dt-bindings: add SMP enable-method for Broadcom NSP
  ARM: dts: add SMP support for Broadcom NSP
  ARM: BCM: Add SMP support for Broadcom NSP

 .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       |  36 ++++++
 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  33 +++--
 arch/arm/mach-bcm/Kconfig                          |   2 +
 arch/arm/mach-bcm/Makefile                         |   8 +-
 arch/arm/mach-bcm/bcm_nsp.h                        |  19 +++
 arch/arm/mach-bcm/headsmp.S                        |  37 ++++++
 arch/arm/mach-bcm/{kona_smp.c => platsmp.c}        | 142 +++++++++++++++++++--
 8 files changed, 255 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
 create mode 100644 arch/arm/mach-bcm/bcm_nsp.h
 create mode 100644 arch/arm/mach-bcm/headsmp.S
 rename arch/arm/mach-bcm/{kona_smp.c => platsmp.c} (63%)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
