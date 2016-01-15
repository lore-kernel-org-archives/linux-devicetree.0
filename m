From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/2] fix rk3066a based boards hang when cpufreq changes
Date: Fri, 15 Jan 2016 21:23:43 +0800
Message-ID: <1452864223-423-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


I found the rayeager board always hang in the system boot
process or when cpufreq change. When check the BSP code[0]
from ChipSpark, I found the current vdd_arm voltage is too
low and so is the vdd_logic voltage, which should be modulated
by PWM3.

So I increase the vdd_arm voltage and enabled pwm3 as a pwm
regulator here.

[0] https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/arch/arm/mach-rkpx2/board-rkpx2-sdk.c

Changes in v2:
- move the opp table to rk3066a.dtsi, make it as the default opp table
  for rk3066a based board.
- also enable the pwm regulator for bqcurie2 and Marsboard

Andy Yan (2):
  ARM: dts: rockchip: increase vdd_arm voltage for rk3066a based boards
  ARM: dts: rockchip: enable pwm3 as pwm regulator for rk3066a based
    boards

 arch/arm/boot/dts/rk3066a-bqcurie2.dts  | 16 ++++++++++++++++
 arch/arm/boot/dts/rk3066a-marsboard.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/rk3066a-rayeager.dts  | 16 ++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi          | 12 +++++++-----
 4 files changed, 55 insertions(+), 5 deletions(-)

-- 
1.9.1



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
