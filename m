From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 7/8] clocksource: Add a new timer-ingenic driver
Date: Thu, 29 Mar 2018 16:52:29 +0200
Message-ID: <1522335149.1792.0@smtp.crapouillou.net>
References: <20180110224838.16711-2-paul@crapouillou.net>
        <20180317232901.14129-1-paul@crapouillou.net>
        <20180317232901.14129-8-paul@crapouillou.net>
        <a8d28b2b-4e40-83b9-d65e-beecbd36ad33@linaro.org>
        <06976e4ae275c4cc0bddacc5e0c0c9a9@crapouillou.net>
        <af33e522-7f87-d62a-0a35-d56a403387b7@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <af33e522-7f87-d62a-0a35-d56a403387b7@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, James Hogan <jhogan@kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le mer. 28 mars 2018 =C3=A0 18:25, Daniel Lezcano=20
<daniel.lezcano@linaro.org> a =C3=A9crit :
> On 28/03/2018 17:15, Paul Cercueil wrote:
>>  Le 2018-03-24 07:26, Daniel Lezcano a =C3=A9crit :
>>>  On 18/03/2018 00:29, Paul Cercueil wrote:
>>>>  This driver will use the TCU (Timer Counter Unit) present on the=20
>>>> Ingenic
>>>>  JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>>=20
>>>  Please provide a more detailed description about the timer.
>>=20
>>  There's a doc file for that :)
>=20
> Usually, when there is a new driver I ask for a description in the
> changelog for reference.
>=20
>>>  Where is the clocksource ?
>>=20
>>  Right, there is no clocksource, just timers.
>>=20
>>>  I don't see the point of using channel idx and pwm checking here.
>>>=20
>>>  There is one clockevent, why create multiple channels ? Can't you=20
>>> stick
>>>  to the usual init routine for a timer.
>>=20
>>  So the idea is that we use all the TCU channels that won't be used=20
>> for PWM
>>  as timers. Hence the PWM checking. Why is this bad?
>=20
> It is not bad but arguable. By checking the channels used by the pwm=20
> in
> the code, you introduce an adherence between two subsystems even if it
> is just related to the DT parsing part.
>=20
> As it is not needed to have more than one timer in the time framework
> (at least with the same characteristics), the pwm channels check is
> pointless. We can assume the author of the DT file is smart enough to
> prevent conflicts and define a pwm and a timer properly instead of
> adding more code complexity.
>=20
> In addition, simplifying the code will allow you to use the timer-of
> code and reduce very significantly the init function.

That's what I had in my V1 and V2, my DT node for the timer-ingenic=20
driver
had a "timers" property (e.g. "timers =3D <4 5>;") to select the channels=20
that
should be used as timers. Then Rob told me I shouldn't do that, and=20
instead
detect the channels that will be used for PWM.

>>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>  ---
>>>>   drivers/clocksource/Kconfig         |   8 ++
>>>>   drivers/clocksource/Makefile        |   1 +
>>>>   drivers/clocksource/timer-ingenic.c | 278
>>>>  ++++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 287 insertions(+)
>>>>   create mode 100644 drivers/clocksource/timer-ingenic.c
>>>>=20
>>>>   v2: Use SPDX identifier for the license
>>>>   v3: - Move documentation to its own patch
>>>>       - Search the devicetree for PWM clients, and use all the TCU
>>>>         channels that won't be used for PWM
>>>>   v4: - Add documentation about why we search for PWM clients
>>>>       - Verify that the PWM clients are for the TCU PWM driver
>>>>=20
>>>>  diff --git a/drivers/clocksource/Kconfig=20
>>>> b/drivers/clocksource/Kconfig
>>>>  index d2e5382821a4..481422145fb4 100644
>>>>  --- a/drivers/clocksource/Kconfig
>>>>  +++ b/drivers/clocksource/Kconfig
>>>>  @@ -592,4 +592,12 @@ config CLKSRC_ST_LPC
>>>>         Enable this option to use the Low Power controller timer
>>>>         as clocksource.
>>>>=20
>>>>  +config INGENIC_TIMER
>>>>  +    bool "Clocksource/timer using the TCU in Ingenic JZ SoCs"
>>>>  +    depends on MACH_INGENIC || COMPILE_TEST
>>>=20
>>>  bool "Clocksource/timer using the TCU in Ingenic JZ SoCs" if=20
>>> COMPILE_TEST
>>>=20
>>>  Remove the depends MACH_INGENIC.
>>=20
>>  This driver is not useful on anything else than Ingenic SoCs, why=20
>> should I
>>  remove MACH_INGENIC then?
>=20
> For COMPILE_TEST on x86.

Well that's a logical OR right here, so it will work...

>>>>  +    select CLKSRC_OF
>>>>  +    default y
>>>=20
>>>  No default, Kconfig platform selects the timer.
>>=20
>>  Alright.
> [ ... ]
>=20
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM=20
> SoCs
>=20
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>=20
=
