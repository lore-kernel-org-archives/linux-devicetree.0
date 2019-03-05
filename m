Return-Path: <SRS0=ZebB=RI=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
In-reply-to: <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
References: <20190304194023.10926-1-marek.vasut@gmail.com> <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at> <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1186.1551802225.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 Mar 2019 17:10:25 +0100
Message-Id: <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marek Vasut writes:
> On 3/5/19 11:07 AM, Harald Geyer wrote:
> > marek.vasut@gmail.com writes:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Reword the binding document to make it clear how the propeties work
> >> and which properties affect which other properties.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Harald Geyer <harald@ccbib.org>
> >> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Mark Brown <broonie@kernel.org>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> To: devicetree@vger.kernel.org
> >> ---
> >> V2: - Make "gpios" a mandatory property
> >>     - Reword "gpio-states" property description
> >>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> >> Note: The recent gpio-regulator rework caused breakage. While the
> >>       changes in the gpio-regulator code were according to the DT
> >>       binding document, they stopped working with older DTs. Make
> >>       the binding document clearer to prevent such breakage in the
> >>       future.
> > =

> > Thanks for the update. I think it addresses all my concerns except for
> > one:
> > =

> >> +- gpios-states	: State of GPIO pins in "gpios" array that is set unt=
il
> >> +			  changed by the first consumer. 0: LOW, 1: HIGH.
> >> +			  Default is LOW if nothing else is specified.
> > =

> > I still believe this not true: There is no guarantee that the regulato=
r
> > core won't change the state of GPIO pins before the first consumer com=
es
> > up.
> =

> Why would it do that ?

Because the regulator core doesn't know about this driver specific
property at all. And without any constraints placed by consumers, the
core is free to choose any state whatsoever at any point in time.

> That would completely invalidate any remaining
> useful-ness of this property.

Yes, I believe this property is mostly useless. That's what I want to
get across with my wording proposal. The remaining usecase, that I can see=
,
is when the GPIOs have been setup by the bootloader and we don't want
to reset them to low during probing (which some OSes might be capable
of, but linux currently doesn't). Also a state of all GPIOs low might
be invalid (not in the "states" property), so we shouldn't set all GPIOs
to low during probing in that case.

HTH,
Harald

> > I still think my proposal describes the property more acurately:
> > gpios-states : On operating systems, that don't support reading back g=
pio
> >                values in output mode (most notably linux), this array
> >                provides the state of GPIO pins set when requesting the=
m
> >                from the gpio controller. Systems, that are capable of
> >                preserving state when requesting the lines, are free to
> >                ignore this property. 0: LOW, 1: HIGH. Default is LOW i=
f
> >                nothing else is specified.
> > =

> > Since we had this discussion already in the V1 thread and you clearly =
don't
> > agree with me, the maintainers will need to decide. You can add =

> > Reviewed-by: Harald Geyer <harald@ccbib.org>
> > once Rob and/or Mark have addressed this issue.
> =

> I think we're just looking at this from two different perspectives and
> for whatever reason can't reconcile them.
> =

> > Thanks for your work!
> > Harald
> > =

> =

> =

> -- =

> Best regards,
> Marek Vasut

-- =

If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
