From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: architected timers: allow dt based discovery
 using clocksource_of_init
Date: Wed, 30 Jan 2013 17:19:44 +0000
Message-ID: <20130130171930.GA23801@e106331-lin.cambridge.arm.com>
References: <1358731326-2979-1-git-send-email-thomas.abraham@linaro.org>
 <50FD7904.1070201@wwwdotorg.org>
 <CAJuYYwSfH8jTterd6aNc_Aw81PBschfCUf=REKB35=Y4a=i_7A@mail.gmail.com>
 <20130122110456.GC18876@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130122110456.GC18876@e106331-lin.cambridge.arm.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: "johnstul@us.ibm.com" <johnstul@us.ibm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "swarren@nvidia.com" <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Thomas,

On Tue, Jan 22, 2013 at 11:04:56AM +0000, Mark Rutland wrote:
> On Mon, Jan 21, 2013 at 06:30:47PM +0000, Thomas Abraham wrote:
> > Hi Stephen,
> > 
> > On 21 January 2013 09:21, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > > On 01/20/2013 06:22 PM, Thomas Abraham wrote:
> > >> Add an entry in __clksrc_of_table so that ARMv7 architected timer is
> > >> discoverable using call to clocksource_of_init.
> > >
> > >> diff --git a/arch/arm/kernel/arch_timer.c b/arch/arm/kernel/arch_timer.c
> > >
> > >> +#ifdef CONFIG_CLKSRC_OF
> > >> +CLOCKSOURCE_OF_DECLARE(armv7_timer, "arm,armv7-timer", arch_timer_of_register)
> > >> +#endif
> > >
> > > I wonder if we shouldn't enhance include/linux/clocksource.h to define
> > > CLOCKSOURCE_OF_DECLARE even when !CONFIG_CLKSRC_OF; that way, drivers
> > > wouldn't need that ifdef.
> > 
> > Yes, it will be helpful to have a !CONFIG_CLKSRC_OF version of
> > CLOCKSOURCE_OF_DECLARE. And can CONFIG_CLKSRC_OF be enabled by default
> > for all ARM platforms?
> > 
> > Thanks,
> > Thomas.
> 
> Thomas,
> 
> Once the above is worked out, could you send me the updated patch with a
> pointer to whichever {branch,patch}(es) I need for CLKSRC_OF?

Is there any news on this? I'd like to be able to push out a branch ready for
merging soon.

I've also realised that platforms using of_clocksource_init won't get the
architected timer registered as a sched_clock, which would seem like a loss.
I'm not sure what the relative requirements are for sched_clock and
clocksource, so there may be some platforms that want it and some that don't.

I see for exynos5440 the architected timer is regsitered as a
clock{source,_event_device}, but not as a sched_clock, and omap5 is similar,
but may register dmtimer_read_sched_clock first.

We can probably leave it out for now, but it's something we'll need to consider
in future.

Thanks,
Mark.
