From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/6] add basic rk3288 smp support
Date: Fri, 10 Oct 2014 14:26:04 -0700
Message-ID: <1412976370-14468-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

rk3288 is qual-core CPU Soc, we enable the smp in this patch.

In version 3 we use regmap and pmu syscon for cpu power on/off.
This should be work after Pankaj Dubey's patch applied:
(https://lkml.org/lkml/2014/9/30/156)

Changes in v3:
- add pmu regmap patches in version 3
- use one ops and secondary_starup for all rockchip SOCs
- pick back the power domain operation for cpu hotplug
- add compitable name "rockchip,rk3288-pmu-sram" for pmu-intmem

Changes in v2:
- use rk3288_boot_secondary instead ofsmp_boot_secondary
- discards the power domain operation
- handle the per cpu starup when actived by 'sev'
- adjust the alignment

Kever Yang (6):
  ARM: rockchip: convert to regmap and use pmu syscon if available
  ARM: dts: rockchip: use the same pmu node name as before
  ARM: rockchip: add option to access the pmu via a phandle in
    smp_operations
  ARM: dts: rockchip: add pmu references to cpus nodes
  ARM: rockchip: add basic smp support for rk3288
  ARM: dts: rockchip: add intmem node for rk3288 smp support

 arch/arm/boot/dts/rk3288.dtsi    |  21 ++++-
 arch/arm/mach-rockchip/headsmp.S |   5 +-
 arch/arm/mach-rockchip/platsmp.c | 188 +++++++++++++++++++++++++++++----------
 3 files changed, 167 insertions(+), 47 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
