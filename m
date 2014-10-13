From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [RFC 2/7] clocksource: add dependencies for Vybrid pit
 clocksource
Date: Mon, 13 Oct 2014 11:46:06 +0200
Message-ID: <98ca2b7a76dc786a36cf6c4113ca751f@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
 <603e0f51e88b5643cb42e966cbb1b80b21a55ecf.1413136383.git.stefan@agner.ch>
 <20141012181821.GQ31554@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141012181821.GQ31554-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 2014-10-12 20:18, schrieb Uwe Kleine-K=C3=B6nig:
> Hello,
>=20
> On Sun, Oct 12, 2014 at 08:13:56PM +0200, Stefan Agner wrote:
>> Add the minimal dependencies required to use the Vybrid PIT
>> clocksource driver. Those are not part of the SoC dependencies.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  drivers/clocksource/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconf=
ig
>> index cfd6519..26464dd 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -146,6 +146,8 @@ config FSL_FTM_TIMER
>>
>>  config VF_PIT_TIMER
>>  	bool
>> +	select CLKSRC_MMIO
>> +	select CLKSRC_OF
>>  	help
>>  	  Support for Period Interrupt Timer on Freescale Vybrid Family So=
Cs.
> This one seems to qualify as a fix for the MMU stuff, right?

Well, this appeared when working on the !MMU stuff. Because on the MMU
SoC, CLKSRC_OF is selected by ARCH_MULTIPLATFORM and CLKSRC_MMIO is
selected by ARCH_MXC, it would not be a problem for MMU SOC_VF610. But =
I
guess we should try to define dependencies on the lowest level, so it i=
s
probably a general fix?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
