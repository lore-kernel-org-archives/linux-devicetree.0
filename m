From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Mon, 26 Nov 2012 11:28:23 +0000
Message-ID: <20121126112823.GI12782@gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
 <CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
 <20121123121413.GB22268@gmail.com>
 <20121123123048.GM5384@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121123123048.GM5384@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Shiraz Hashim <shiraz.hashim@st.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Shiraz Hashim wrote:

> On Fri, Nov 23, 2012 at 12:14:13PM +0000, Lee Jones wrote:
> > > >> +             if (np)
> > > >> +                     of_property_read_u32(np, "st,norequest-m=
ask",
> > > >> +                                     &pdata->norequest_mask);
> > > >
> > > > Can you explain to me what this does?
> > >=20
> > > You mean pdata->norequest_mask?  It marks few gpios as unusable.
> > > Because these pads might be used by other blocks of stmpe.
> >=20
> > I'm not sure if that should be set with DT or not.
> >=20
> > Second opinion anyone?
>=20
> This is a board dependent parameter which just informs gpio driver
> about pins, which must not be requested. It may happen for a stmpe
> variant where such gpio pins are multiplexed with some other
> function.
>=20
> Hence it must be part of DT itself.

Doesn't pinctrl normally handle this kind of stuff?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
