From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V5 1/3] mfd: add support for ams AS3722 PMIC
Date: Tue, 22 Oct 2013 07:58:03 +0100
Message-ID: <CAF2Aj3g-jc9X+MRxDNwxYkNUuk2f0p_sLagXUNQELrHsLmBXqQ@mail.gmail.com>
References: <1381321761-8898-1-git-send-email-ldewangan@nvidia.com>
	<1381321761-8898-2-git-send-email-ldewangan@nvidia.com>
	<525580A8.5050902@wwwdotorg.org>
	<52650DA2.60609@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <52650DA2.60609@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "rob@landley.net" <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Florian Lobmaier <florian.lobmaier@ams.co>
List-Id: devicetree@vger.kernel.org

>>> The ams AS3722 is a compact system PMU suitable for mobile phones,
>>> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
>>> controller, 11 LDOs, RTC, automatic battery, temperature and
>>> over-current monitoring, 8 GPIOs, ADC and a watchdog.
>>>
>>> Add MFD core driver for the AS3722 to support core functionality.
>>
>> OK, I think the binding here is about clear enough, so the binding,
>> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> I saw that Lee has already acked this (V4) for the nondt side.
>
> As there is no issue on dt side also, can it be apply please?

There is no IMAP access here at the Summit.

Would you be able to do me a favour and resend this patch with
Stephen's and my Acks and I will apply?

--=20
Lee Jones
Linaro ST Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
