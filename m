From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 0/4] This suspend patch is only support cut off the power of cpu and some external
Date: Mon, 01 Dec 2014 17:26:26 -0800
Message-ID: <7hmw763kql.fsf@deeprootsystems.com>
References: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
	<7htx1f409k.fsf@deeprootsystems.com>
	<CAD=FV=V2go5BMFbiFKu73_aVz5ck949W-kJQ6WLkAQRPJbjPVA@mail.gmail.com>
	<CAD=FV=XuQk17CTNKJY++J+w9Ab9_OUX0ca0A99m7yKPAWSs2=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XuQk17CTNKJY++J+w9Ab9_OUX0ca0A99m7yKPAWSs2=w@mail.gmail.com>
	(Doug Anderson's message of "Mon, 1 Dec 2014 17:07:39 -0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:

> Hi,
>
> On Mon, Dec 1, 2014 at 2:08 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Hi,
>>
>> On Mon, Dec 1, 2014 at 11:51 AM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:
>>>
>>>> devices, since we still lack power_domain driver, so the other power rail
>>>> of rk3288 need keep power on.
>>>> I have tested it on rk3288-evb board, atop next-20141112. goto suspend by type
>>>> "echo mem > /sys/power/state", vdd_cpu is about 0mv by measuring, so it can be
>>>> determined in sleep mode, then press power button to wakeup it.
>>>
>>> I tested this on top of today's linux-next (next-20141201) and it
>>> suspends, but doesn't wake up from any of the button presses.  What
>>> wakeup sources are configured for the rk3288-evb-rk808?
>>
>> Just to close the loop (I talked with Kevin over IM about this, too):
>>
>> I have a huge description of how I tested this as part of my patch at
>> <https://patchwork.kernel.org/patch/5414941/>.  Chris:  I think Kevin
>> has asked you several times to include information like this in your
>> cover letter.  Please, please, please can you try to remember to do
>> this?
>
> Talked to Chris offline.  He said that in his tests the other patches
> weren't needed, so he didn't list any other patches.  Things just
> worked for him.  ...so I guess he did post the instructions that
> worked for him.  Sorry for the complaint.  Possibly things are
> different on "next-20141112" and that's where Chris said he tested.

This series doesn't apply cleanly to next-20141112.  Manually applying
(with fuzz), it boots but I have the same results: it suspends, but none
of the buttons wake it up.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
