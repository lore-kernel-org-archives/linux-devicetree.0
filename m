From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/6] bus: brcmstb_gisb: add support for GISBv7 arbiter
Date: Wed, 29 Mar 2017 17:29:08 -0700
Message-ID: <20170330002914.7371-1-opendmb@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set contains changes to enable the GISB arbiter driver
on the latest ARM64 architecture Set-Top Box chips from Broadcom.

Since the ARM64 architecture does not support the hooking of low
level fault handlers the driver has been adjusted to depend solely
on GISB interrupts and notify events to provide diagnostic
messaging.  The GISB hardware still triggers bus faults for the
processor so the default low-level aborts will occur and will be
handled based on the architecture specific kernel implementation.

While this tends to obsure the GISB error messaging it is still
reasonable so the same approach is applied to the ARM architecture
for consistency.

The patches also correct some issues with the existing driver
and add the new register map for the GISBv7 hardware first
appearing in the BCM7278 device.

Changes since v2 at [2]:
 - Removed code associated with enabling the hooking of ARM64
   memory faults as well as the code that hooks them for both
   ARM and ARM64 architectures within the GISB arbiter driver.
 - Created separate notifiers for die and panic events to
   prevent list corruption, and substituted the notifier return
   name for the previous magic number (Thanks Mark!)

Changes since v1 at [1]:
 - Removed code associated with hooking SError handling in favor
   of a registered notifier (Thanks Mark!)
 - Removed an unnecessary explicit cast (Thanks Gregory!)

[1] https://lkml.org/lkml/2017/3/24/413
[2] https://lkml.org/lkml/2017/3/28/1125

Doug Berger (6):
  bus: brcmstb_gisb: Use register offsets with writes too
  bus: brcmstb_gisb: correct support for 64-bit address output
  bus: brcmstb_gisb: add notifier handling
  bus: brcmstb_gisb: remove low-level ARM hooks
  bus: brcmstb_gisb: enable driver for ARM64 architecture
  bus: brcmstb_gisb: update to support new revision

 .../devicetree/bindings/bus/brcm,gisb-arb.txt      |   3 +-
 drivers/bus/Kconfig                                |   2 +-
 drivers/bus/brcmstb_gisb.c                         | 121 ++++++++++++---------
 3 files changed, 75 insertions(+), 51 deletions(-)

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
