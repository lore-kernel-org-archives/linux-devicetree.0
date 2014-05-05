From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: syscon or memory mappings (was: Re: [RFC/PATCH 0/8] pinctrl-rockchip: Change wrong initial assumptions)
Date: Mon, 05 May 2014 14:11:08 +0200
Message-ID: <3114029.fvjZVjkFrH@diego>
References: <1414506.B4e2jZujVm@diego> <4321949.A6Ghcdztds@diego> <9747726.2b5sgjTxWB@typ>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9747726.2b5sgjTxWB@typ>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 3. Mai 2014, 14:40:36 schrieb Max Schwarz:
> Hello Heiko,
>=20
> On Saturday 03 May 2014 at 01:45:11, Heiko St=FCbner wrote:
> > > However, this sheds light on an underlying issue: Rockchip is not
> > > treating
> > > the whole GPIO block as one cohesive device as we do currently. I=
nstead,
> > > it
> > > seems to me, one GPIO bank is one device. Each has its cohesive m=
ux,
> > > bank
> > > and pull registers - apart from rk3188-bank-0, maybe. But that on=
e is
> > > special anyway with regards to register ordering (s.b.).
> > >=20
> > > The issues you had with RK3188 and now have with RK3288 seem to s=
tem
> > > from
> > > trying to group all banks together into one pinctrl driver.
> > >=20
> > > So maybe we should promote the GPIO banks to full devices in the =
dt and
> > > make smaller mappings for each GPIO bank, i.e. three mappings for=
 each
> > > GPIO bank (mux, bank, pull). I know we have to stay backwards com=
patible
> > > dt-wise, but that should be doable.
> >=20
> > Yes, that is another miss-conception from the early days. The
> > gpio-controllers themself are actually Synopsis Designware IPs - th=
e
> > kernel
> > now even has a separate driver for them (gpio-dwapb). Only the real
> > pincontrol/muxing/pull/etc is from Rockchip.
> >=20
> > Currently I can't think of a way to move over gracefully, without
> > introducing crap into the gpio-dwapb driver. As at the moment it pa=
rses
> > all
> > information it needs from the dt directly - of course with differen=
t
> > bindings.
> >=20
> > That is also the reason I do not want to introduce more "special-ca=
ses" in
> > the bank-declaration we're using currently - to not make this move =
more
> > difficult in the future.
> >=20
> > As it is, with the patch attached to the last mail, the pinctrl dri=
ver
> > wouldn't even need the "rockchip,rk3188-gpio-bank0" compatible anym=
ore, as
> > the information about its special case is now sitting in the bank
> > declaration inside the driver. Which then would enable us to remove=
 the
> > gpio-bank subnodes alltogether and use the external gpio driver.
>=20
> Okay, you convinced me. That sounds like a good plan to me. Maybe we =
can
> introduce some compability code into the pinctrl driver to generate t=
he
> correct dt nodes for gpio-dwabp at runtime? I think that would depend=
 on
> something like CONFIG_OF_DYNAMIC though.

Yep, that's one option. The other would be to let the driver support bo=
th (the=20
internal gpio code and the real gpio-dwapb), deprecate the old one=20
[of course also disallowing it for rk3288 and following] and simply rem=
ove it=20
after the appropriate timespan (1 or more years if I remember correctly=
 :-) ].



> > While for example syscon cannot handle clocks currently, the underl=
ying
> > regmap can - so it would be only a matter of teaching syscon to tel=
l
> > regmap
> > of the clock to use (GRF and PMU register-clocks in this case), ins=
tead of
> > needing to have every user of parts of these registers handle the r=
elevant
> > clock itself on register accesses.
> >=20
> > Also, as you can see in the grf map, the rk3188 actually has two
> > soc_status
> > registers (0xac and 0x108) which have the dmac, cpu and drive stren=
gth
> > registers in between. So having a syscon only for soc_con and soc_s=
tatus
> > will produce problems too.
> >=20
> > Another example, GRF_IO_VSEL at 0x0380 is most likely some sort of =
pin
> > voltage selection. As it only spans 1 register I'd assume it could =
contain
> > settings that span all pin banks.
>=20
> Okay, we couldn't handle that with individual devices for each bank.
>=20
> > And of course, splitting the register space into dozens of small
> > individual
> > mappings looks messy :-)
>=20
> Yes, I agree now ;-)

cool :-D

I've also just sent a v2, including the missing MFD_SYSCON dependency, =
thanks=20
for the find.



Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
