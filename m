From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: Provide timekeeping for efm32 SoCs
Date: Tue, 22 Oct 2013 23:00:33 +0200
Message-ID: <5266E771.4070906@linaro.org>
References: <1380830189-21553-1-git-send-email-u.kleine-koenig@pengutronix.de> <5253ECC7.30700@linaro.org> <20131008145147.GP10079@pengutronix.de> <20131022201001.GB27227@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022201001.GB27227-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/22/2013 10:10 PM, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Oct 08, 2013 at 04:51:47PM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
>> Hello Daniel,
>>
>> On Tue, Oct 08, 2013 at 01:30:15PM +0200, Daniel Lezcano wrote:
>>> On 10/03/2013 09:56 PM, Uwe Kleine-K=C3=B6nig wrote:
>>>> An efm32 features 4 16-bit timers with a 10-bit prescaler. This dr=
iver
>>>> provides clocksource and clock event device using one timer instan=
ce
>>>> each.
>>>>
>>>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.=
de>
>>>> ---
>>>
>>> Applied to my tree for 3.13
>> Thanks
> Where is your tree to be found? This commit isn't in
>
> 	git://git.linaro.org/people/dlezcano/linux.git clockevents/3.13
>
> and also it's not included in next-20131021.

Thanks for the heads up.

I synced my local tree with the tree:

git://git.linaro.org/people/dlezcano/linux.git

for the branch clockevents/3.13 and clockevents/3.12-fixes

I will send a PR as soon as I can.

Thanks
   -- Daniel



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
