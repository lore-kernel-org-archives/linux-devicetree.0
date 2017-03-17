From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [v3 3/5] coresight: add support for debug module
Date: Fri, 17 Mar 2017 18:13:28 +0800
Message-ID: <20170317101328.GA19877@leoy-linaro>
References: <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
 <011fdac0-59bf-b539-2de3-0b59a41bc922@arm.com>
 <20170309175915.GA964@leoy-linaro>
 <3f27efee-3b63-81fd-eb96-73fd7e6f5e92@arm.com>
 <20170313165600.GB32431@linaro.org>
 <516f8989-4dde-2686-d549-0761feb14d1b@arm.com>
 <CANLsYkzJsGvr4ZzNbTwcPu1Qki6=Szvu+bMjHZ_rza==DqFChw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkzJsGvr4ZzNbTwcPu1Qki6=Szvu+bMjHZ_rza==DqFChw@mail.gmail.com>
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

On Wed, Mar 15, 2017 at 02:41:59PM -0600, Mathieu Poirier wrote:
> On 15 March 2017 at 10:44, Suzuki K Poulose <Suzuki.Poulose@arm.com> wrote:
> > On 13/03/17 16:56, Mathieu Poirier wrote:
> >> On Fri, Mar 10, 2017 at 02:29:53PM +0000, Suzuki K Poulose wrote:

[...]

> >>> Btw, I don't see any PM calls to make sure the power domain (at least the
> >>> debug domain)
> >>> is up, which could cause problems with accesses to some of these
> >>> registers (leave alone the
> >>> ones in CPU power domain), especially the EDPRSR. We could also do
> >>> pm_runtime_get on the
> >>> CPU's power domain, if the CPU is online, before we access the pcsr.
> >>
> >>
> >> I thought about PM runtime operations a little while back but wondered if
> >> it is
> >> really a good thing to have them around.  When this code is called the
> >> system
> >> has crashed and as such making PM runtimes call isn't a good idea.
> >
> >
> > You are right. It is not safe to make such calls when we have crashed.
> > The other side effect is, if we don't have the debug power domain up,
> > we could possibly hang the system and prevent other registered notifiers
> > from running, which doesn't sound good either.
> >
> >>
> >> One thing we could do is _not_ call pm_runtime_put() at the end of the
> >> probe()
> >> operation.  That way we wouldn't have to mess around with PM runtime
> >> operations
> >> on an unstable system.  This, of course, is costly in terms of power
> >> consumption
> >> but the system is under test/debug anyway.
> >
> >
> > May be control the behavior via kernel command line ? Something like
> > coresight_debug={on or 1} or
> > even use the "nohlt" ?
> 
> We need to deal with the debug and CPU power domains.
> 
> For the former I suggest we do what coresight does and use the
> "power-domains" binding[1].  For the CPU power domain we can re-use
> the "nohlt" flag.  In the probe function if the "nohlt" cmd line flag
> is not set the code bails out.  If it is set pm_runtime_put() is _not_
> called and the driver can be used without worries of hanging the
> system when the panic handler is invoked.
> 
> Am I forgetting something?

I tested this drvier on Hikey and DB410c. For Hikey we must pass
"nohlt" to disable low power states, otherwise the kernel will hang
during initialization. But for DB410c, this driver even can work well
without "nohlt" and I checked the CPUIdle has been really enabled with
below sysfs entries:

root@linaro-developer:~# cat /sys/devices/system/cpu/cpu*/cpuidle/state*/usage
5992
6988
4225
4547
2790
23696
4202
3899

And from my previous experience, I'm quite sure some SoCs can access
the debug module registers with CPUIdle enabled, and it will read
back 0xFFFF_FFFF_FFFF_FFFF when the CPU stays in low power state.
So I prefer we could keep current method to suggest to use "nohlt" in
Kconfig's help description but it's not mandotory to check this in
the code. How about you think for this?

Thanks,
Leo Yan
