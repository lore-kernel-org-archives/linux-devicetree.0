From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Thu, 19 Sep 2013 13:34:58 +0200
Message-ID: <523AE162.3040100@gmail.com>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de> <201309172245.25367.arnd@arndb.de> <20130918153424.GR24802@pengutronix.de> <201309191328.12717.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201309191328.12717.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/13 13:28, Arnd Bergmann wrote:
> On Wednesday 18 September 2013, Uwe Kleine-K=F6nig wrote:
>> On Tue, Sep 17, 2013 at 10:45:25PM +0200, Arnd Bergmann wrote:
>>> On Tuesday 17 September 2013, Uwe Kleine-K=F6nig wrote:
[...]
>>>> +
>>>> +void __init efm32_init_time(void)
>>>> +{
>>>> +	of_clk_init(NULL);
>>>> +	clocksource_of_init();
>>>> +}
>>>
>>> When Sebastian Hesselbarth's patches for of_clk_init() are merged,
>>> this function can go away.
>> Do you have a link?
>
> http://lmgtfy.com/?q=3Dhesselbarth+of_clk_init ;-)
>
> I've put Sebastian on Cc, I guess he can comment on the status of his
> patches, so we can come up with a plan for dealing with the dependenc=
y
> here.

Patch set has been sent yesterday, still waiting for ACK's.

Olof already mentioned to (a) take it in arm-soc early and (b) have
a topic branch to depend on.

I guess I will prepare that topic branch and Olof can take it (or fall
back to creating it on his own, if I fail to do it right).

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
