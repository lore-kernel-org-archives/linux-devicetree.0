From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/6] add basic rk3288 smp support
Date: Wed, 15 Oct 2014 10:22:59 -0700
Message-ID: <1413393785-26783-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


rk3288 is qual-core CPU Soc, we enable the smp in this patch.

In version 3 we use regmap and pmu syscon for cpu power on/off.
This should be work after Pankaj Dubey's patch applied:
"syscon: Decouple syscon interface from platform devices"
(https://lkml.org/lkml/2014/9/30/156)

Changes in v5:
- use read_cpuid_part() but not read_cpuid_part_number()

Changes in v4:
- add rockchip,pmu property into cpus.txt
- merge patch "fix up rk3288 smp cpu hotplug" into this patch
- remove "rockchip,rk3288-pmu-sram" because we don't use it here
- modify the author info for patches

Changes in v3:
- add pmu regmap patches in version 3
- use one ops and secondary_starup for all rockchip SOCs
- pick back the power domain operation for cpu hotplug
- remove 'enable-method' from this patch
- add compitable name "rockchip,rk3288-pmu-sram" for pmu-intmem

Changes in v2:
- use rk3288_boot_secondary instead ofsmp_boot_secondary
- discards the power domain operation
- handle the per cpu starup when actived by 'sev'
- adjust the alignment

Kever Yang (6):
  ARM: rockchip: convert to regmap and use pmu syscon if available
  ARM: rockchip: add option to access the pmu via a phandle in
    smp_operations
  ARM: dts: rockchip: add pmu references to cpus nodes
  ARM: rockchip: add basic smp support for rk3288
  ARM: dts: rockchip: add intmem node for rk3288 smp support
  ARM: dts: rockchip: add reset for CPU nodes

 Documentation/devicetree/bindings/arm/cpus.txt |   9 +
 arch/arm/boot/dts/rk3288.dtsi                  |  18 ++
 arch/arm/mach-rockchip/headsmp.S               |   5 +-
 arch/arm/mach-rockchip/platsmp.c               | 223 ++++++++++++++++++++-----
 4 files changed, 211 insertions(+), 44 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
