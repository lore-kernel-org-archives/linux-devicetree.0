From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [v3 3/5] coresight: add support for debug module
Date: Tue, 21 Mar 2017 10:59:24 +0800
Message-ID: <20170321025924.GA7429@leoy-linaro>
References: <20170309175915.GA964@leoy-linaro>
 <3f27efee-3b63-81fd-eb96-73fd7e6f5e92@arm.com>
 <20170313165600.GB32431@linaro.org>
 <516f8989-4dde-2686-d549-0761feb14d1b@arm.com>
 <CANLsYkzJsGvr4ZzNbTwcPu1Qki6=Szvu+bMjHZ_rza==DqFChw@mail.gmail.com>
 <20170317101328.GA19877@leoy-linaro>
 <20170317155007.GA20435@linaro.org>
 <20170317162836.GD2020@leoy-linaro>
 <5995f6a7-08b1-c868-fc88-a145d1748a33@arm.com>
 <CANLsYkyiAnSGW4Ujs6L-yBKK3no3zigbyBgOCWbm06ZdV-f2Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkyiAnSGW4Ujs6L-yBKK3no3zigbyBgOCWbm06ZdV-f2Hw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 10:40:00AM -0600, Mathieu Poirier wrote:

[...]

> >>> If we don't check for "nohlt" some platform may freeze, others may work.
> >>> If we
> >>> mandate that "nohlt" be present on the kernel cmd line it works in all
> >>> cases.
> >>> As such mandating that "nohlt" be present is a better way to go.
> >>
> >>
> >> Sure, so I will add below checking code in the probe function, please
> >> let me know if you have alter better way to implement this:
> >>
> >> +       if (IS_ENABLED(CONFIG_CPU_IDLE) &&
> >> +                       !strstr(boot_command_line, "nohlt")) {
> >> +               dev_err(dev, "May not be accessible in CPU power
> >> domain.\n");
> >> +               return -EPERM;
> >> +       }
> >>
> >
> > There is an API which kind of achieves what "nohlt" does at runtime :
> >
> >   cpu_idle_poll_ctrl(true)
> >
> > So may be we could use that instead of depending on "nohlt". The other side
> > of the issues is "when do we decide to use the API". May be we could add
> > something
> > like : enable_debug, which could then trigger the panic notifier
> > registrations
> > and the above. That would still leave us with a case where the system
> > crashes
> > even before the user gets a terminal. May be the following is the best
> > option :
> >
> > 1) Dedicated kernel command line parameter for enabling the CPU debug at
> > boot/probe.
> >
> > and
> >
> > 2) Runtime enable method via sysfs.
> >
> > What do you think ?
> 
> In my opinion booting with "nohlt" on the cmd line is sufficient to
> determine if we should use the driver or not.  That way we also avoid
> declaring yet another sysfs flag, something I really want to avoid.

Agree.

I did spend some time to implement coresight core framework to support
debug module, you could see it on:http://termbin.com/k2fj; this also
gives me more sense which is better choice. If declaring another sysfs
flag to support debug module in coresight framework, this lets the
codes and interfaces more complex. E.g. for best fit into coresight
framework, finally we can get 8 sysfs nodes for 8 CPUs in system; so
that means we need enable every CPU one by one.

root@linaro-developer:~# ls /sys/bus/coresight/devices/
f6590000.debug  f6594000.debug  f65d0000.debug  f65d4000.debug
f6592000.debug  f6596000.debug  f65d2000.debug  f65d6000.debug

This is not quite reasonable to introduce complexity for either code
or using it. If we review coresight topology, some components need to
interact with each other and coresight framework should handle them
properly to enable/disable path, etc. But as Mathieu meantioned, from
the point of the hardware topology, the CPU debug module is quite
standalone under the coresight umbrella, and it has no any dependency
with other tracing or bus modules. So it's good to keep it simple,
this also matches with hardware implementation.

Thanks,
Leo Yan
