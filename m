From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Tue, 13 May 2014 19:45:03 +0100
Message-ID: <20140513184503.GF16388@arm.com>
References: <1398133596-29170-1-git-send-email-zhangwm@marvell.com>
 <20140422103642.GF7484@arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com>
 <20140423170821.GJ5649@arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE5507A3C1F1@SC-VEXCH4.marvell.com>
 <5360FB07.5030407@arm.com>
 <6106CAF835F351419ADA79E4836E6EC71B6A53C826@SC-VEXCH4.marvell.com>
 <9034CBD80F070943B59700D7F8149ED9A0875730@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9034CBD80F070943B59700D7F8149ED9A0875730-r8ILAu4/owuq90oVIqnETxL4W9x8LtSr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, "'linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org'" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 12, 2014 at 11:22:09AM +0100, Neil Zhang wrote:
> > > The device tree bindings for power domains is under discussion [1]
> > 
> > Thanks for the information.
> > But it currently for device only, core related stuff are not supported.
> > And is it really good to register power provider for core and let vfp / pmu etc
> > to get it?
> > 
> 
> What's your suggestion about it?
> Is it OK that I add it under the PMU node?

I don't really mind. I just want to avoid re-inventing the wheel in a
PMU-specific way and having to maintain that code forever because it ended
up in our DT description.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
