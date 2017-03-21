From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [v3 3/5] coresight: add support for debug module
Date: Tue, 21 Mar 2017 09:15:03 -0600
Message-ID: <20170321151503.GA17413@linaro.org>
References: <516f8989-4dde-2686-d549-0761feb14d1b@arm.com>
 <CANLsYkzJsGvr4ZzNbTwcPu1Qki6=Szvu+bMjHZ_rza==DqFChw@mail.gmail.com>
 <20170317101328.GA19877@leoy-linaro>
 <20170317155007.GA20435@linaro.org>
 <20170317162836.GD2020@leoy-linaro>
 <5995f6a7-08b1-c868-fc88-a145d1748a33@arm.com>
 <CANLsYkyiAnSGW4Ujs6L-yBKK3no3zigbyBgOCWbm06ZdV-f2Hw@mail.gmail.com>
 <20170321025924.GA7429@leoy-linaro>
 <7226bc83-24f5-f609-2f87-f0afc7657488@arm.com>
 <20170321114711.GA5886@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170321114711.GA5886@leoy-linaro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 07:47:11PM +0800, Leo Yan wrote:
> On Tue, Mar 21, 2017 at 10:16:45AM +0000, Suzuki K Poulose wrote:
> 
> [...]
> 
> > >>In my opinion booting with "nohlt" on the cmd line is sufficient to
> > >>determine if we should use the driver or not.  That way we also avoid
> > >>declaring yet another sysfs flag, something I really want to avoid.
> > >
> > >Agree.
> > >
> > >I did spend some time to implement coresight core framework to support
> > >debug module, you could see it on:http://termbin.com/k2fj; this also
> > >gives me more sense which is better choice. If declaring another sysfs
> > >flag to support debug module in coresight framework, this lets the
> > >codes and interfaces more complex. E.g. for best fit into coresight
> > >framework, finally we can get 8 sysfs nodes for 8 CPUs in system; so
> > >that means we need enable every CPU one by one.
> > 
> > Having a node for each debug area indeed doesn't look good. We could
> > as will stick a single node under /sys/kernel/debug/ which would enable/disable
> > the debug component.
> > 
> > I am OK with it being tied to nohlt. In that case we will have to add
> > a Kconfig dependency on GENERIC_IDLE_POLL_SETUP (though it is selected
> > by default on ARM/ARM64). Parsing the boot command line for nohlt doesn't
> > look like a good idea. We may have to figure out a way to do that.
> 
> I remembered that we can use QoS constraint for CPUIdle:
>         pm_qos_add_request(pm_qos_req, PM_QOS_CPU_DMA_LATENCY, 0);
> 
> Using this way we can disable all low power states and don't depend on
> nohlt anymore.

The idea is to use "nohlt" as a trigger option.  If it is set then we use this
driver - if it isn't then it is kept under wrap.

> 
> > Also, please could you add support for building this as a module ? Since it
> > doesn't depend on the coresight bus anyway, it should be pretty straight
> > forward.
> 
> Yeah. Will support module building.
> 
> Thanks,
> Leo Yan
