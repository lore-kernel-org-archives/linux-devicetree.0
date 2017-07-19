From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: support mail and IPA thermal for rk3399
Date: Wed, 19 Jul 2017 23:06:53 +0200
Message-ID: <3610458.AeGaZ0pxhP@phil>
References: <1500279271-15249-1-git-send-email-wxt@rock-chips.com> <65759378-509b-3287-fd78-02361e89429b@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <65759378-509b-3287-fd78-02361e89429b-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Roger Chen <roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 19. Juli 2017, 17:06:59 CEST schrieb Caesar Wang:
> Hi Rob & Heiko,
> 
> Do we have the chance to merge these patches?

>From the mali-thermal thingy, it doesn't look like Rob likes that IPA stuff.

So I'll most likely pick the other patches that rely on approved bindings
after I return from my vacation and leave the thermal issue until it can
be resolved.


Heiko

> 
> I'm try to bring up the display and run webgl for testing with my github on
> https://github.com/Caesar-github/rockchip/commits/gru/next-stable-chromeos
> 
> I believe the Rocky@RK will post patches to support the other SoCs after.
> 
> -Caesar
> 
> 在 2017年07月17日 16:14, Caesar Wang 写道:
> > This series patches supported the mail in devicetree and used the
> > thermal IPA by default.
> >
> > Verified with kernel is based on Linus's master branch and Heiko's
> > v4.14-armsoc-tmp/dts64 branch. ( The Linux version 4.12.0 for now).
> >
> > The most rockchip SoCs will be supported with IPA mode for thermal
> > in later.
> >
> > ---
> >
> > History version:
> > 1. The first version found on
> > https://www.spinics.net/lists/arm-kernel/msg593118.html
> >
> > Tested on Kevin board with bringing up ChromeOS.
> > OS VERSION:
> >      CHROMEOS_RELEASE_DESCRIPTION=9693.1.0 (Official Build) dev-channel kevin test
> >
> > BIOS VERSION:
> >      Google_Kevin.8785.211.2017_06_20_1043
> >
> > EC VERSION:
> >      Build info:    kevin_v1.10.217-24514961d 2017-07-03 07:46:36 wxt@nb
> >
> > With the ARM's lastest mali driver TX011-SW-99002-r18p0-01rel0 on
> > https://developer.arm.com/products/software/mali-drivers/midgard-kernel
> >
> >  From the bootup log:
> >      localhost devfreq0 # dmesg |grep mali
> >      [    0.933334] mali ff9a0000.gpu: GPU identified as 0x0860 r2p0 status 0
> >      [    0.940830] mali ff9a0000.gpu: Protected mode not available
> >      [    0.947334] mali ff9a0000.gpu: Using configured power model mali-simple-power-model, and fallback mali-simple-power-model
> >      [    0.960083] mali ff9a0000.gpu: Probed as mali0
> >
> >      localhost devfreq0 # pwd
> >      /sys/devices/platform/ff9a0000.gpu/devfreq/devfreq0
> >      localhost devfreq0 # ls
> >      available_frequencies  device    min_freq          subsystem    uevent
> >      available_governors    governor  polling_interval  target_freq  userspace
> >      cur_freq               max_freq  power             trans_stat
> >
> >      localhost ff9a0000.gpu # ls
> >      core_availability_policy  gpuinfo               modalias       soft_job_timeout
> >      core_mask                 js_scheduling_period  of_node        subsystem
> >      devfreq                   js_timeouts           pm_poweroff    uevent
> >      driver                    mem_pool_max_size     power
> >      driver_override           mem_pool_size         power_policy
> >      dvfs_period               misc                  reset_timeout
> > ---
> >
> > And for thermal with IPA.
> > Try to run 'md5sum /dev/zero &' and octane/benchmark scripts to go up the temperature.
> >  From the scripts to have a look at the actual control.
> > "
> > while true; do grep "" /sys/class/thermal/thermal_zone[0-1]/temp /sys/devices/system/cpu/cpu[0-5]/cpufreq/scaling_cur_freq /sys/devices/platform/ff9a0000.gpu/devfreq/devfreq0/cur_freq;date;sleep .5; done &
> > "
> >
> > -Caesar
> >
> >
> > Changes in v2:
> > As Heiko comments on https://patchwork.kernel.org/patch/9835939/
> > - interrupt-name use the lower case.
> > - use the correct compatible "arm,mali-t860"
> > - remove the clock name, since the mali only have one input clock.
> > - foo@ will produce warnings when used without reg property.
> > - update the commit to explain the two passive trip points changed.
> >
> > Caesar Wang (5):
> >    dt-bindings: gpu: add the RK3399 mali for rockchip specifics
> >    dt-bindings: gpu: add a power_model optional properties for MALI
> >    arm64: dts: rockchip: add ARM Mali GPU node for RK3399 SoCs
> >    arm64: dts: rockchip: enable the GPU for RK3399-GRU
> >    arm64: dts: rockchip: update the thermal zones for RK3399 SoCs
> >
> >   .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 13 ++++
> >   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |  5 ++
> >   arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi   | 33 ++++++++++
> >   arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       | 33 ++++++++++
> >   arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 74 ++++++++++++----------
> >   5 files changed, 125 insertions(+), 33 deletions(-)
> >
> 
> 
> 
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
