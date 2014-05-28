From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: Enable "power-source" to be extracted from DT files
Date: Wed, 28 May 2014 10:48:11 +0200
Message-ID: <CACRpkdYR9cZOnG2r3Kh027LNKgsDJqxL0J9Gryu+JHXacTNHbQ@mail.gmail.com>
References: <CACRpkdZyLxMTSygRP6pD-mxghQ_D6tQ821tvn8GYw0Rnh9hZoQ@mail.gmail.com>
	<2480893.UEqfxe8meR@phil>
	<CACRpkdbaWYgku0_n5CqGU8DAFnn-5jEJ64Mfh9fixB4mRPnfwg@mail.gmail.com>
	<1943407.eJZOu7V4pT@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1943407.eJZOu7V4pT@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 28, 2014 at 10:36 AM, Heiko St=C3=BCbner <heiko@sntech.de> =
wrote:
> Am Mittwoch, 28. Mai 2014, 10:15:43 schrieb Linus Walleij:
>> On Tue, May 27, 2014 at 3:09 PM, Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>> > Am Dienstag, 27. Mai 2014, 09:27:36 schrieb Ivan T. Ivanov:
>> >> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
>> >>
>> >> Add "power-source" property to generic options used for DT parsin=
g files.
>> >> This  enables drivers, which use generic pin configurations, to g=
et the
>> >> value passed to this property.
>> >
>> > I think the main problem here is, that pinconf-generic.h defines t=
he
>> > power-
>> > source as having a "custom format". With DT as a hardware descript=
ion,
>> > implementaton specific values do not work well - instead it should=
 have a
>> > regular unit-value.
>> >
>> > For the power-source I think volts could work well - as this is th=
e main
>> > use- case for pinctrl I know. The regulator-binding uses microvolt=
s,
>> > maybe it would be good use a similar unit.
>>
>> (...)
>>
>> >         pcfg_1v8 {
>> >
>> >                 power-source =3D <1800000>;
>> >
>> >         };
>>
>> I don't think this is what it's meant for actually. In this case the=
 thing
>> would be modeled as a regulator rather than some pin control option =
I
>> guess?
>>
>> I think it's more like a selector, such as found on old amplifiers,
>> input source A, B or C? So it's just some discrete number.
>
> as I said, you know this better than me ;-)
>
> I was thinking more of these io-voltages, where one can select betwee=
n say 1.8
> and 3.3V for the pins.
>
> I have this somewhere on my todo list for the rockchips too.
>
> So essentially the pinctrl driver [as it is a pin-group specific sett=
ing]
> should just export regulators for these voltage settings, without tou=
ching the
> pinconfig itself, right?

Hm hm hm.

I am a bit in the blue actually.

I think we need to have a discussion with Mark Brown on how to
handle this.

We have previously had the case of MMC/SD level-shifters, where
a certain setting gives a certain level of signals out, and another set=
ting
gives another level. Like two discrete levels.

So we modeled that as a regulator provider inside the pin control
driver eventually, see sh-pfc/pfc-sh73a0.c

But this is different: it is the power of the pin itself.

I can think of a "padring regulator" hooking in as part of the pin stat=
e
but have no clear idea on how to actually do that. We need some
coding I think.

Yours,
Linus Walleij
