From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 12:14:13 +0000
Message-ID: <20121123121413.GB22268@gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
 <CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

> >> -     stmpe_gpio->chip.base =3D pdata ? pdata->gpio_base : -1;
> >
> > Why have you deleted this?
> >
> >> +
> >> +     if (pdata) {
> >> +             stmpe_gpio->norequest_mask =3D pdata->norequest_mask=
;
> >> +             stmpe_gpio->chip.base =3D pdata->gpio_base;
> >
> > Then added this?
> >
> >> +     } else {
> >> +             stmpe_gpio->chip.base =3D -1;
> >
> > And this?
>=20
> To group all non-DT assignments in a single if block, instead of two.

That assignment has nothing to do with DT.

> > Just leave the top line in and it saves you lots of complecations.
>=20
> Sorry, Couldn't get this one.

I'm saying, just leave it where it is.

> >> +             if (np)
> >> +                     of_property_read_u32(np, "st,norequest-mask"=
,
> >> +                                     &pdata->norequest_mask);
> >
> > Can you explain to me what this does?
>=20
> You mean pdata->norequest_mask?  It marks few gpios as unusable.
> Because these pads might be used by other blocks of stmpe.

I'm not sure if that should be set with DT or not.

Second opinion anyone?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
