From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Support PMU for rk3399 SoCs
Date: Mon, 05 Sep 2016 00:09:19 +0200
Message-ID: <2592055.1Nh3JWbsOA@phil>
References: <1467792357-9749-1-git-send-email-wxt@rock-chips.com> <57CA159D.8050103@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57CA159D.8050103-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Samstag, 3. September 2016, 08:13:17 CEST schrieb Caesar Wang:
> Heiko,
> 
> What do you think of it?
> Maybe I need re-update these patches on next kernel, and re-test them.

I checked linux-next and the underlying changes seem to all have gone in now, 
so we should be fine.

Updating the patches would be cool. I tried applying them to my dts64 branch 
just now, but they don't apply cleanly anymore due to other changes going in 
before.

When you check against linux-next, please take into account that there is no 
new linux-next since 20160825 and 20160905 is the next planned linux-next 
release (probably Stephen being on holiday).


Thanks
Heiko

> 
> On 2016年07月06日 16:05, Caesar Wang wrote:
> > Hello Heiko, Marc & ARM guys
> > 
> > When Jay first submitted the rk3399.dtsi upstream
> > <https://patchwork.kernel.org/patch/8885821/> he had the PMU node in
> > there,
> > but then took it out because the upstream binding wasn't done yet.
> > It looks as if the upstream stuff has landed, since in linux/master I see:
> > 287e9357abcc DT/arm,gic-v3: Documment PPI partition support
> > e3825ba1af3a irqchip/gic-v3: Add support for partitioned PPIs
> > 9e2c986cb460 irqchip: Add per-cpu interrupt partitioning library
> > 222df54fd8b7 genirq: Allow the affinity of a percpu interrupt to be
> > set/retrieved 651e8b54abde irqdomain: Allow domain matching on irq_fwspec
> > 
> > This series patches add to support the rk3399 SoCs PMU.
> > I pick up the https://patchwork.kernel.org/patch/9209369/.
> > 
> > As do some tests with ChromeOs for my rk3399 board.
> > Tested with linus master 4.7-rc6 kernel on rk3399 board.
> > https://github.com/Caesar-github/rockchip/tree/rk3399/pmu-upstream
> > 
> > localhost / # perf list
> > 
> > List of pre-defined events (to be used in -e):
> > cpu-cycles OR cycles [Hardware event]
> > instructions [Hardware event]
> > cache-references [Hardware event]
> > cache-misses [Hardware event]
> > branch-instructions OR branches [Hardware event]
> > branch-misses [Hardware event]
> > bus-cycles [Hardware event]
> > ...
> > 
> > perf stat --cpu 0/1/2/3..... to minitor
> > e.g. cpu0;
> > 
> > localhost / # perf stat --cpu 0
> > 
> > Performance counter stats for 'CPU(s) 0':
> > 
> > 3374.917571 task-clock (msec) # 1.001 CPUs utilized [100.00%]
> > 20 context-switches # 0.006 K/sec [100.00%]
> > 2 cpu-migrations # 0.001 K/sec [100.00%]
> > 55 page-faults # 0.016 K/sec
> > 7151843 cycles # 0.002 GHz [100.00%]
> > <not supported> stalled-cycles-frontend
> > <not supported> stalled-cycles-backend
> > 4272536 instructions # 0.60 insns per cycle [100.00%]
> > 568406 branches # 0.168 M/sec [100.00%]
> > 65652 branch-misses # 11.55% of all branches
> > 
> > Also, 'perf top' to monitor the PMU interrupts from cpus
> > 
> > -Caesar
> > 
> > 
> > Changes in v2:
> > - AS Mark comments on https://patchwork.kernel.org/patch/9209369/
> > 
> >    remove the interrupt-affinity property, we need depend on Marc' perf
> >    code on https://patchwork.kernel.org/patch/9209369/.
> > 
> > Caesar Wang (2):
> >    arm64: dts: rockchip: change all interrupts cells for 4 on rk3399 SoCs
> >    arm64: dts: rockchip: support the pmu node for rk3399
> >   
> >   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 118
> >   ++++++++++++++++++------------- 1 file changed, 69 insertions(+), 49
> >   deletions(-)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
