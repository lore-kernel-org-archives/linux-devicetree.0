From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: Re: [PATCH v2 5/6] clocksource: Add a new timer-ingenic driver
Date: Wed, 03 Jan 2018 22:56:16 +0100
Message-ID: <1515016576.1642.2@smtp.crapouillou.net>
References: <20171229125942.27305-2-paul@crapouillou.net>
        <20180101143344.2099-1-paul@crapouillou.net>
        <20180101143344.2099-5-paul@crapouillou.net>
        <20180103210840.hsh4kghuxz7btu5f@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103210840.hsh4kghuxz7btu5f@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Le mer. 3 janv. 2018 =E0 22:08, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> a =E9crit :
> On Mon, Jan 01, 2018 at 03:33:43PM +0100, Paul Cercueil wrote:
>>  This driver will use the TCU (Timer Counter Unit) present on the=20
>> Ingenic
>>  JZ47xx SoCs to provide the kernel with a clocksource and timers.
>>=20
>>  Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>  ---
>>   .../devicetree/bindings/timer/ingenic,tcu.txt      |  35 +++
>=20
> Separate patch please.

OK.

>>   drivers/clocksource/Kconfig                        |   8 +
>>   drivers/clocksource/Makefile                       |   1 +
>>   drivers/clocksource/timer-ingenic.c                | 256=20
>> +++++++++++++++++++++
>>   4 files changed, 300 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>   create mode 100644 drivers/clocksource/timer-ingenic.c
>>=20
>>   v2: Use SPDX identifier for the license
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt=20
>> b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>  new file mode 100644
>>  index 000000000000..e4944972ea53
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>  @@ -0,0 +1,35 @@
>>  +Ingenic JZ47xx SoCs Timer/Counter Unit driver
>>  +---------------------------------------------
>>  +
>>  +Required properties:
>>  +
>>  +- compatible : should be "ingenic,<socname>-tcu". Valid strings=20
>> are:
>>  +  * ingenic,jz4740-tcu
>>  +  * ingenic,jz4770-tcu
>>  +  * ingenic,jz4780-tcu
>>  +- interrupt-parent : phandle of the TCU interrupt controller.
>>  +- interrupts : Specifies the interrupts the controller is=20
>> connected to.
>>  +- clocks : List of phandle & clock specifiers for the TCU clocks.
>>  +- clock-names : List of name strings for the TCU clocks.
>>  +- ingenic,channels: a list of TCU channels to be used as timers.
>=20
> Why is this needed? This looks like you are trying to assign certain
> timers to clocksource and clockevent. A common problem, but one that
> should be decided by describing h/w features. There must be some
> property present or missing to make you decide to use a given channel=20
> or
> not.

Well, it's not easy; some TCU channels will be used as PWM, and there's=20
no way
to know that when the clocksource driver probes. And which ones are PWM=20
/ which
ones are not, is board-specific. If you have a better solution though,=20
I take it.

>>  +
>>  +Example:
>>  +
>>  +/ {
>>  +	regmap {
>>  +		compatible =3D "simple-mfd", "syscon";
>>  +		reg =3D <0x10002000 0x1000>;
>>  +
>>  +		tcu: timer {
>>  +			compatible =3D "ingenic,jz4740-tcu";
>>  +
>>  +			clocks =3D <&tcu 0>, <&tcu 1>;
>>  +			clock-names =3D "timer0", "timer1";
>=20
> It's curious that you have timer0 and timer1 here and then channels 0
> and 1 below. Would your clocks change if you use channel 2 for=20
> example?
> The binding should be a list of clock connections in the h/w, not
> just what the driver needs or what the used h/w configuration is.
>=20
> Rob

I only put these to simplify the example, but you're right, I should=20
have
all the timer clocks supplied there.

Thanks,
-Paul
=

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
