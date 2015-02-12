From: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: perf: Add support for Scorpion PMUs
Date: Wed, 11 Feb 2015 20:57:28 -0500
Message-ID: <CAJ5Y-ebrzQfhac2eoEkt-haZiG_tMiix6dVvunrf9_+JzFVA0g@mail.gmail.com>
References: <1423616724-20849-1-git-send-email-sboyd@codeaurora.org>
	<1423616724-20849-3-git-send-email-sboyd@codeaurora.org>
	<CAJ5Y-eZsCbeZMwgPrNOg9Qdt8XqAoJBVNbiNMC7c3PQTOrUJ+g@mail.gmail.com>
	<20150211182717.GA11190@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150211182717.GA11190-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ashwin Chaugule <ashwinc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Leeder <nleeder-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 February 2015 at 13:27, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 02/10, Ashwin Chaugule wrote:
>> Hi Stephen,
>>
>> On 10 February 2015 at 20:05, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> > Scorpion supports a set of local performance monitor event
>> > selection registers (LPM) sitting behind a cp15 based interface
>> > that extend the architected PMU events to include Scorpion CPU
>> > and Venum VFP specific events. To use these events the user is
>> > expected to program the lpm register with the event code shifted
>> > into the group they care about and then point the PMNx event at
>> > that region+group combo by writing a LPMn_GROUPx event. Add
>> > support for this hardware.
>> >
>> > Note: the raw event number is a pure software construct that
>> > allows us to map the multi-dimensional number space of regions,
>> > groups, and event codes into a flat event number space suitable
>> > for use by the perf framework.
>> >
>> > This is based on code originally written by Ashwin Chaugule and
>> > Neil Leeder [1] massed to become similar to the Krait PMU support
>> > code.
>>
>> Thanks for taking this up!
>> Overall this series looks good to me, but from what I faintly
>> recollect, doesn't this (and the Krait pmu code) get affected by
>> powercollapse issues anymore?
>> e.g.
>> https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/arch/arm/kernel/perf_event_msm.c?h=msm-3.4&id=b5ca687960f0fea2f4735e83ca5c9543474c19de
>>
>
> Right now there isn't any power collapse support in mainline so
> there's no immediate problem. Once we add power collapse support
> (i.e. cpuidle) to the Scorpion and Krait platforms we'll need to
> do something in the perf event code to properly maintain the
> counts across idle. I imagine it would be done by registering for
> cpu_pm notifications and then doing the save/restore on
> CPU_PM_ENTER and CPU_PM_EXIT. At least, that's what you started
> doing in this patch[1]. And then it seems the patch you mention
> came after that and actually did the save/restore of the counts.
>
> [1] https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/?h=msm-3.4&id=464983a7e991a484cac0bc0885cee4fee318d659

Right. Thats essential whenever the power collapse stuff goes in.

Thanks,
Ashwin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
