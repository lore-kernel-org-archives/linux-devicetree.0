From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] ARM: berlin: SMP support
Date: Thu, 20 Mar 2014 21:39:44 +0100
Message-ID: <1395347986-30203-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a small patch set for SMP support on Marvell Berlin BG2
and recently provided BG2Q. Nothing spectacular, as it basically
copies SMP holding pen mechanism from mach-prima2 and plat-versatile
with minor Berlin specific code for SCU and general purpose registers
used by secondary CPUs to get their boot address.

There was some IRC discussion with Alexandre about using
scu_get_base() instead of a DT node. Although BG2Q is true A9
and provides SCU base; BG2 with PJ4b does not and I decided to
depend on a DT node for SCU in both cases, which is fine I guess.

I tested this on BG2, and BG2CD (which is UP). I expect the
Free-Electrons guys to test on BG2Q.

There is a branch based on v3.14-rc1 and latest BG2Q DTs for the
lucky ones who are able to boot unsigned images at

https://github.com/shesselba/linux-berlin.git topic/smp-bg2-bg2q

Sebastian

Sebastian Hesselbarth (2):
  ARM: berlin: add scu and chipctrl device nodes for BG2/BG2Q
  ARM: berlin: add SMP support

 arch/arm/boot/dts/berlin2.dtsi  |  10 +++
 arch/arm/boot/dts/berlin2q.dtsi |  10 +++
 arch/arm/mach-berlin/Kconfig    |   1 +
 arch/arm/mach-berlin/Makefile   |   1 +
 arch/arm/mach-berlin/berlin.c   |   3 +
 arch/arm/mach-berlin/common.h   |  18 ++++++
 arch/arm/mach-berlin/headsmp.S  |  43 +++++++++++++
 arch/arm/mach-berlin/platsmp.c  | 139 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 225 insertions(+)
 create mode 100644 arch/arm/mach-berlin/common.h
 create mode 100644 arch/arm/mach-berlin/headsmp.S
 create mode 100644 arch/arm/mach-berlin/platsmp.c

---
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
