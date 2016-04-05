From: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 3/4] perf: xgene: Add APM X-Gene SoC Performance
 Monitoring Unit driver
Date: Tue, 5 Apr 2016 11:50:10 -0700
Message-ID: <CACgAJHx6Y8yt57m3YB51dOQjuxNHFvEnJe255mDhnVZOjmJu_A@mail.gmail.com>
References: <1459467472-31561-1-git-send-email-ttnguyen@apm.com>
	<1459467472-31561-4-git-send-email-ttnguyen@apm.com>
	<20160401121820.GB29876@leverpostej>
	<CACgAJHwZ0MwjBDa65P7tYAkF4-m+TCj-65OGpYYQD2tO6hkFqQ@mail.gmail.com>
	<20160404233338.GA1917@svinekod>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160404233338.GA1917@svinekod>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Mon, Apr 4, 2016 at 4:33 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Apr 04, 2016 at 04:42:11PM -0700, Tai Tri Nguyen wrote:
>> On Fri, Apr 1, 2016 at 5:18 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> >> +static int get_next_avail_cntr(struct xgene_pmu_dev *pmu_dev)
>> >> +{
>> >> +     int shift, cntr, retval;
>> >> +     unsigned long flags;
>> >> +
>> >> +     raw_spin_lock_irqsave(&pmu_dev->lock, flags);
>> >> +
>> >> +     for (cntr = 0; cntr < pmu_dev->max_counters; cntr++) {
>> >> +             shift = cntr;
>> >> +             if (!(pmu_dev->cntr_assign_mask & (1ULL << shift))) {
>> >> +                     pmu_dev->cntr_assign_mask |= (1ULL << shift);
>> >> +                     retval = cntr;
>> >> +                     goto out;
>> >> +             }
>> >> +     }
>> >> +     retval = -ENOSPC;
>
>> > Are the spinlocks necessary?
>> >
>> > I thought add and del couldn't be called in parallel for the same
>> > context, and those are the only users of this mask.
>> >
>>
>> I'm trying to avoid the case where multiple events may claim the same
>> available counter.
>> There's a race condition here.
>
> I don't think there is, so long as events are all associated with the same CPU,
> and hence the same ctx.
>
> As I mentioned, add and del are the only users of this mask. Both of those are
> only called with ctx->lock held, so I couldn't see how these could race.
>
> Were you considering events in different cpu contexts racing?
>
> Is there something I've missed?

Ah, yes. I were considering the event racing in different cpu contexts.
As long as the events are with the same CPU, there should be no racing.
The spin_lock isn't needed. I will get rid of it for the next round.

>
>> >> +     hwc->config = config;
>> >> +     if (config1)
>> >> +             hwc->extra_reg.config = config1;
>> >> +     else
>> >> +             /* Enable all Agents */
>> >> +             hwc->extra_reg.config = 0xFFFFFFFFFFFFFFFFULL;
>> >
>> > I'm not sure I follow what's going on here.
>> >
>> > It would be good to document precisely what this means.
>>
>> These are X-Gene PMU specific for monitoring performance of a specific
>> data path.
>> X-Gene PMUs have 2 registers capable of masking the Agents from which
>> the request come from. If the bit with the bit number corresponding to
>> the AgentID
>> is set, the event will be counted only if it is caused by a request
>> from that agent.
>> Each PMU has different set of Agents. By default, the event will be counted for
>> all agent requests.
>>
>> I'll have it commented better for next revision of the patch.
>
> It might be worth having something under Documentation/ for this, similarly to
> what we do for CCN in Documentation/arm/CCN.txt.
>
> How is the user expected to determine agent IDs? Is there a listing somewhere?
> Does this change between reivisions? This may be worth documenting.
>

Each of the SoC PMU has an agent ID list in our product User Manual
documentation.
An user is expected to refer to the list to determine the agent ID.
The agent ID list
per each PMU is different. Also we may change or add more agents to the list for
next generations of APM X-Gene. I think it would be too much to document it in
the Documentation/ folder.

Thanks,
-- 
Tai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
