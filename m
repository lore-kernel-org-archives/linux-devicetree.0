MIME-Version: 1.0
In-Reply-To: <20171004220046.tfejhywhhowgf3ma@pengutronix.de>
References: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
	<20171004205306.wzvxmstcberpws25@rob-hp-laptop>
	<20171004220046.tfejhywhhowgf3ma@pengutronix.de>
Date: Thu, 5 Oct 2017 09:01:27 -0500
Message-ID: <CAL_JsqLtHoxd3zu4tAYmCPA5Bkgv0gRC2sDN9YSChca=jqzLSQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: of: document gpio-init nodes
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 4, 2017 at 5:00 PM, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@peng=
utronix.de> wrote:
> On Wed, Oct 04, 2017 at 03:53:06PM -0500, Rob Herring wrote:
>> On Fri, Sep 22, 2017 at 10:41:38PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> > Sometimes it is desirable to define a "safe" configuration for a GPIO =
in
>> > the device tree but let the operating system later still make use of
>> > this pin.
>> >
>> > This might for example be useful to initially configure a debug pin th=
at
>> > is usually unconnected as output to prevent floating until it is used
>> > later.
>> >
>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> > ---
>> > Hello,
>> >
>> > this picks up a discussion that pops up now and then with our customer=
s.
>> >
>> > Last time I discussed this topic with Linus Walleij my suggestion was =
to
>> > merge this usecase with gpio-hogs, but he wasn't happy with it because
>> > hogging implies that the pin is not free for other usage and he
>> > suggested to use "gpio-init" instead.
>> >
>> > Maybe it's arguable if this "initial configuration" belongs into the
>> > device tree, but IMHO defining a "safe configuration" should have a
>> > place and the requirements are identical. This isn't implied by the na=
me
>> > however, but I don't have a better idea for a different name.
>>
>> It can be argued that by the time the kernel boots, it is way to late to
>> configure pins to a safe state. Of course, even secure world reads the
>> DT these days (or are at least talking about doing so). Still any s/w
>> handling this could be too slow to get to a safe state.
>
> Note I didn't target the kernel to implement this. I already have
> patches that implement this in barebox which is also using dt. (After
> all dt is about hardware description and not about what Linux should do,
> right? :-)

Right. But how do you know barebox is early enough?

>> Maybe "optimal default" state would be more accurate.
>>
>> > Thinking further (which was also discussed last time) it would also be
>> > nice to restrict usage. For example that a given pin that has
>> > "output-low" as its safe setting might be configured later als high
>> > output but not as input. Maybe:
>>
>> I can't imagine that an output can't be an input.
>
> It might make that line float which I'd consider "unsafe" (or "not
> optimal").
>
>> Regardless, what you're describing is constraints and that seems like
>> a whole other problem than default/initial state.
>>
>> Plus, for constraints I'd think we want this done at the pin level, not
>> GPIO. And we kind of already have that with pin states.
>
> Not 100% sure I'm up to date here, if you mean
>
>         pinctrl-names =3D "default", "idle"
>         pinctrl-0 =3D ... /* that's default */
>         pinctrl-1 =3D ... /* that's idle */
>
> this doesn't help completely. If the idle/save state means that the pin
> should be configured as low-output, you cannot define that in general.
> You can only configure the pin into its gpio function but not say it
> should be an output driving the pin low.

>
>> >     companion-reset {
>> >             gpio-somethingwithsafe;
>> >             gpios =3D <12 0>;
>>
>> "gpios" is already a defined property with a type (phandle + args). dtc
>> checks for this now though gpio-hogs is already one exception, and I
>> don't want to add another. Maybe it could be generalized to be allowed
>> when the parent is a gpio-controller, but really I'd like to avoid this
>> pattern from spreading.
>
> I choosed the same way as gpio-hogs because IMHO they are quite similar.
> Also if the propery is supposed to be located in a child node of a
> gpio-controller, repeating &gpioX seems to be at least arguable.
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
