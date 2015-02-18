From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Device Tree Quirks & the Beaglebone
Date: Wed, 18 Feb 2015 16:59:32 +0200
Message-ID: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following patchset introduces Device Tree quirks which
apply right after unflattening. Quirks allow using a single
device tree blob to support revisions of a single board.

This makes deployment easier, since there is no need to modify
the bootloader environment, and allow booting using a very small
bootloader shim with a resulting decrease in boot time which
is extremely important in various use-cases.

For details please look at Documentation/devicetree/quirks.txt

This patch has an implicit dependency on a previous patch
"of: Custom printk format specifier for device node" for debugging
prints of device nodes.

Pantelis Antoniou (4):
  arm: of: Add a DT quirk method after unflattening
  of: DT quirks infrastructure
  arm: am33xx: DT quirks for am33xx based beaglebone variants
  arm: dts: Common Black/White Beaglebone DTS using quirks

 .../bindings/quirks/am33xx-bone-quirk.txt          |  82 ++++
 Documentation/devicetree/quirks.txt                | 101 +++++
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/am335x-bone-all.dts              | 157 +++++++
 arch/arm/include/asm/mach/arch.h                   |   1 +
 arch/arm/kernel/setup.c                            |   3 +
 arch/arm/mach-omap2/Makefile                       |   5 +
 arch/arm/mach-omap2/am33xx-dt-quirks.c             | 498 +++++++++++++++++++++
 arch/arm/mach-omap2/am33xx-dt-quirks.h             |  10 +
 arch/arm/mach-omap2/board-generic.c                |   1 +
 arch/arm/mach-omap2/common.h                       |   8 +
 drivers/of/dynamic.c                               | 358 +++++++++++++++
 include/linux/of.h                                 |  16 +
 13 files changed, 1242 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/quirks/am33xx-bone-quirk.txt
 create mode 100644 Documentation/devicetree/quirks.txt
 create mode 100644 arch/arm/boot/dts/am335x-bone-all.dts
 create mode 100644 arch/arm/mach-omap2/am33xx-dt-quirks.c
 create mode 100644 arch/arm/mach-omap2/am33xx-dt-quirks.h

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
