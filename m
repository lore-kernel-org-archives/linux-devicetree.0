From: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: syscon or memory mappings (was: Re: [RFC/PATCH 0/8] pinctrl-rockchip: Change wrong initial assumptions)
Date: Sat, 03 May 2014 14:40:36 +0200
Message-ID: <9747726.2b5sgjTxWB@typ>
References: <1414506.B4e2jZujVm@diego> <1721270.d6hHid1rhj@typ> <4321949.A6Ghcdztds@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4321949.A6Ghcdztds@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Heiko,

On Saturday 03 May 2014 at 01:45:11, Heiko St=FCbner wrote:
> > However, this sheds light on an underlying issue: Rockchip is not t=
reating
> > the whole GPIO block as one cohesive device as we do currently. Ins=
tead,
> > it
> > seems to me, one GPIO bank is one device. Each has its cohesive mux=
, bank
> > and pull registers - apart from rk3188-bank-0, maybe. But that one =
is
> > special anyway with regards to register ordering (s.b.).
> >=20
> > The issues you had with RK3188 and now have with RK3288 seem to ste=
m from
> > trying to group all banks together into one pinctrl driver.
> >=20
> > So maybe we should promote the GPIO banks to full devices in the dt=
 and
> > make smaller mappings for each GPIO bank, i.e. three mappings for e=
ach
> > GPIO bank (mux, bank, pull). I know we have to stay backwards compa=
tible
> > dt-wise, but that should be doable.
>=20
> Yes, that is another miss-conception from the early days. The
> gpio-controllers themself are actually Synopsis Designware IPs - the =
kernel
> now even has a separate driver for them (gpio-dwapb). Only the real
> pincontrol/muxing/pull/etc is from Rockchip.
>=20
> Currently I can't think of a way to move over gracefully, without
> introducing crap into the gpio-dwapb driver. As at the moment it pars=
es all
> information it needs from the dt directly - of course with different
> bindings.
>=20
> That is also the reason I do not want to introduce more "special-case=
s" in
> the bank-declaration we're using currently - to not make this move mo=
re
> difficult in the future.
>=20
> As it is, with the patch attached to the last mail, the pinctrl drive=
r
> wouldn't even need the "rockchip,rk3188-gpio-bank0" compatible anymor=
e, as
> the information about its special case is now sitting in the bank
> declaration inside the driver. Which then would enable us to remove t=
he
> gpio-bank subnodes alltogether and use the external gpio driver.

Okay, you convinced me. That sounds like a good plan to me. Maybe we ca=
n=20
introduce some compability code into the pinctrl driver to generate the=
=20
correct dt nodes for gpio-dwabp at runtime? I think that would depend o=
n=20
something like CONFIG_OF_DYNAMIC though.

> While for example syscon cannot handle clocks currently, the underlyi=
ng
> regmap can - so it would be only a matter of teaching syscon to tell =
regmap
> of the clock to use (GRF and PMU register-clocks in this case), inste=
ad of
> needing to have every user of parts of these registers handle the rel=
evant
> clock itself on register accesses.
>=20
> Also, as you can see in the grf map, the rk3188 actually has two soc_=
status
> registers (0xac and 0x108) which have the dmac, cpu and drive strengt=
h
> registers in between. So having a syscon only for soc_con and soc_sta=
tus
> will produce problems too.
>=20
> Another example, GRF_IO_VSEL at 0x0380 is most likely some sort of pi=
n
> voltage selection. As it only spans 1 register I'd assume it could co=
ntain
> settings that span all pin banks.

Okay, we couldn't handle that with individual devices for each bank.

> And of course, splitting the register space into dozens of small indi=
vidual
> mappings looks messy :-)

Yes, I agree now ;-)

Cheers,
  Max
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
