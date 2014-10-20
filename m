From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Mon, 20 Oct 2014 11:41:22 +0200
Message-ID: <CAMuHMdVTfPW2Hb_d6QLg8aQdaV55TODwjEivfbs+4dvXEZJcDw@mail.gmail.com>
References: <6106CAF835F351419ADA79E4836E6EC71B6A53C826@SC-VEXCH4.marvell.com>
	<9034CBD80F070943B59700D7F8149ED9A0875730@SC-VEXCH4.marvell.com>
	<20140513184503.GF16388@arm.com>
	<9034CBD80F070943B59700D7F8149ED9A087573F@SC-VEXCH4.marvell.com>
	<537337F3.4080300@arm.com>
	<9034CBD80F070943B59700D7F8149ED9A0875776@SC-VEXCH4.marvell.com>
	<9034CBD80F070943B59700D7F8149ED90182308172@SC-VEXCH4.marvell.com>
	<20140703175706.GI17372@arm.com>
	<9034CBD80F070943B59700D7F8149ED9024EB81CD8@SC-VEXCH4.marvell.com>
	<5444D2E0.9070205@arm.com>
	<20141020092005.GD4370@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141020092005.GD4370-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 20, 2014 at 11:20 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Oct 20, 2014 at 10:16:16AM +0100, Sudeep Holla wrote:
>> On 20/10/14 09:46, Neil Zhang wrote:
>> > Will, I prefer to check always-on field under PMU node to check
>> > whether we need Save/restore them.
>> >
>> But how do you handle it for different idle states. e.g. if CPU is in
>> retention, PMU's *might be* retained. Also I don't think PMUs will be
>> placed in "always-on" power domain like timers. So using "always-on"
>> sounds incorrect to me.
>
> Adding Mathieu to CC, since I spoke to him at LPC about this and he was
> talking about implementing proper PM domain descriptions for coresight
> components.

Good to hear that!

Gr{oetje,eeting}s,

                        Geert (who skipped LPC)

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
