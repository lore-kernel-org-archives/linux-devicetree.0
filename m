From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Fri,  6 Mar 2015 17:18:46 -0800
Message-ID: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This adds (long in coming) support for the Broadcom BCM7xxx Set-Top Box NAND
controller. This controller has been used in a variety of Broadcom SoCs.

There are a few more features I'd like add in the near future, mostly to
support more SoCs, but this is the base set, which should only need relatively
minor additions to support chips like BCM63138, BCM3384, and Cygnus/iProc.
Particularly, we may need to straighten out some endianness issues for the data
path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BCM3xxx, and
others.

TODO: add this to the DTS(I) files for BCM7445.

Happy reviewing! (Speaking of which, I need to catch up on reviewing everybody
else's MTD submissions...)

Brian

Brian Norris (3):
  mtd: nand: add common DT init code
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver for Broadcom STB NAND controller

 .../devicetree/bindings/mtd/brcmstb_nand.txt       |  109 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmstb_nand.c                    | 2182 ++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |   41 +
 include/linux/mtd/nand.h                           |    5 +
 6 files changed, 2346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
 create mode 100644 drivers/mtd/nand/brcmstb_nand.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
