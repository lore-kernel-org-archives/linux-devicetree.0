From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2] dts: arm64: add CoreSight trace support for hi3660
Date: Tue, 5 Mar 2019 09:07:07 +0800
Message-ID: <20190305010707.GA9544@leoy-ThinkPad-X240s>
References: <6496F4728C09F6479CFF21A8E67D33D568F32660@dggema525-mbx.china.huawei.com>
 <20190302125955.GA11385@leoy-ThinkPad-X240s>
 <CANLsYkzakXjuMR+=ncVpcohE8n-uF60Qa6EAN+Xh=FKBoJtrgg@mail.gmail.com>
 <9109e498-0cd9-0b81-15a0-2208d4282359@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9109e498-0cd9-0b81-15a0-2208d4282359@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mathieu.poirier@linaro.org, shiwanglai@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, john.stultz@linaro.org, xuwei5@huawei.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, suzhuangluan@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 05:29:22PM +0000, Suzuki K Poulose wrote:

[...]

> > > To support for a funnel without any register address range (we have
> > > support replicator like this mode), we also need to extend the driver
> > > drivers/hwtracing/coresight/coresight-funnel.c.
> > > 
> > > Mathieu, Mike, Suzuki, could you help confirm this is the right
> > > direction we should move forward to?
> > 
> > Leo, thanks for testing this out.  Shiwanglai, please add Suzuki and
> > myself to future revision of this set - this will help you getting a
> > timely response for your work.

Yeah, I didn't give a good example for this; just remind to Wanglai,
usually we can add maintainers' email address in the "To:" list so
this will be more friendly for email filters.

> > As Leo pointed out we already have support for replicators that don't
> > have a register map and the same thing should be done in this case.
> > But contrary to what was done for replicators, I think we should keep
> > the drivers in the same file as Russell did here[1].  That way we can
> > keep all things funnel at the same place and reduce the amount of
> > kernel configuration options.
> 
> I back that. I have already merged the static and programmable replicators
> into one and this should be out here soon. So, I back the single driver
> approach for funnels.

That's great!  Thanks for advices, Mathieu & Suzuki.

Will sync with you offline for proceeding.

Thanks,
Leo Yan
