From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Date: Sat, 3 Jun 2017 00:21:38 +0200
Message-ID: <20170602222138.2sra42yjkbwms53d@flea.lan>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
 <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
 <3164416.5xR36OcyjH@jernej-laptop>
 <20170523125321.t7y7yfrrfokpkzgd@flea.home>
 <98c3572beee0a81755994b4bdc508b18@aosc.io>
 <20170524073019.bl6rojc2srrigalp@flea.home>
 <98558BA2-BC99-4D0A-A045-571C643875C5@aosc.io>
 <20170531184306.hzu2em35vr4qi4un@flea.lan>
 <715e6ab52d8aa0032c9759393ace20dc@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cuas4phllyrebc2e"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7OJY7EQKGQEKAL7DVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <715e6ab52d8aa0032c9759393ace20dc-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cuas4phllyrebc2e
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2017 at 10:11:14PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-06-01 02:43=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Wed, May 24, 2017 at 04:25:46PM +0800, Icenowy Zheng wrote:
> > >=20
> > >=20
> > > =E4=BA=8E 2017=E5=B9=B45=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=883:30:19, Maxime Ripard
> > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> > > >On Tue, May 23, 2017 at 09:00:59PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > > >> =E5=9C=A8 2017-05-23 20:53=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=
=93=EF=BC=9A
> > > >> > On Mon, May 22, 2017 at 07:55:56PM +0200, Jernej =C5=A0krabec wr=
ote:
> > > >> > > Hi,
> > > >> > >
> > > >> > > Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai
> > > >napisal(a):
> > > >> > > > On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec
> > > ><jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > >> > > wrote:
> > > >> > > > > Hi,
> > > >> > > > >
> > > >> > > > > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng
> > > >napisal(a):
> > > >> > > > >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =
=E4=B8=8A=E5=8D=882:03:30, Maxime Ripard
> > > ><maxime.ripard@free-
> > > >> > > > >
> > > >> > > > > electrons.com> =E5=86=99=E5=88=B0:
> > > >> > > > >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng
> > > >wrote:
> > > >> > > > >> >> Allwinner H3 features a TV encoder similar to the one =
in
> > > >earlier
> > > >> > > > >> >
> > > >> > > > >> >SoCs,
> > > >> > > > >> >
> > > >> > > > >> >> but with some different points about clocks:
> > > >> > > > >> >> - It has a mod clock and a bus clock.
> > > >> > > > >> >> - The mod clock must be at a fixed rate to generate
> > > >signal.
> > > >> > > > >> >
> > > >> > > > >> >Why?
> > > >> > > > >>
> > > >> > > > >> It's experiment result by Jernej.
> > > >> > > > >>
> > > >> > > > >> The clock rates in BSP kernel is also specially designed
> > > >> > > > >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> > > >> > > > >
> > > >> > > > > My experiments and search through BSP code showed that TVE
> > > >seems to have
> > > >> > > > > additional fixed predivider 8. So if you want to generate =
27
> > > >MHz clock,
> > > >> > > > > unit has to be feed with 216 MHz.
> > > >> > > > >
> > > >> > > > > TVE has only one PLL source PLL_DE. And since 216 MHz is a
> > > >bit low for
> > > >> > > > > DE2,
> > > >> > > > > BSP defaults to 432 MHz for PLL_DE and use divider 2 to
> > > >generate 216 MHz.
> > > >> > > > > This clock is then divided by 8 internaly to get final 27
> > > >MHz.
> > > >> > > > >
> > > >> > > > > Please note that I don't have any hard evidence to support
> > > >that, only
> > > >> > > > > experimental data. However, only that explanation make sen=
se
> > > >to me.
> > > >> > > > >
> > > >> > > > > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which
> > > >both use 27 MHz
> > > >> > > > > base clock. Further experiments are needed to check if the=
re
> > > >is any
> > > >> > > > > possibility to have other resolutions by manipulating cloc=
ks
> > > >and give
> > > >> > > > > other proper settings. I plan to do that, but not in very
> > > >near future.
> > > >> > > >
> > > >> > > > You only have composite video output, and those are the only=
 2
> > > >standard
> > > >> > > > resolutions that make any sense.
> > > >> > >
> > > >> > > Right, other resolutions are for VGA.
> > > >> > >
> > > >> > > Anyway, I did some more digging in A10 and R40 datasheets. I
> > > >think
> > > >> > > that H3 TVE
> > > >> > > unit is something in between. R40 TVE has a setting to select =
"up
> > > >> > > sample".
> > > >> >
> > > >> > That might be just another translation of oversampling :)
> > > >> >
> > > >> > I didn't know it could be applied to composite signals though, b=
ut
> > > >I
> > > >> > guess this is just another analog signal after all.
> > > >> >
> > > >> > > Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP
> > > >> > > driver on R40
> > > >> > > has this setting enabled only for PAL and NTSC and it is alway=
s
> > > >216
> > > >> > > MHz. I
> > > >> > > think that H3 may have this hardwired to 216 MHz and this woul=
d
> > > >be
> > > >> > > the reason
> > > >> > > why 216 MHz is needed.
> > > >> > >
> > > >> > > Has anyone else any better explanation?
> > > >> >
> > > >> > That's already a pretty good one.
> > > >> >
> > > >> > Either way, wether this is upsampling, oversampling or just a
> > > >> > pre-divider, this can and should be dealt with in the mode_set
> > > >> > callback, and not in the probe.
> > > >>
> > > >> I got a better idea -- let TVE driver have the CLK_TVE as an
> > > >> input and create a subclock output with divider 16, and feed this
> > > >> subclock to TCON lcd-ch1.
> > > >>
> > > >> This is a model of the real hardware -- the clock divider is in
> > > >> TVE, not TCON.
> > > >
> > > >That's definitely not a good representation of the hardware. There's
> > > >one clock, it goes to the TCON, period.
> > >=20
> > > No, I still think it goes to the TVE as:
> > >=20
> > > 1. it's named TVE in datasheet.
> >=20
> > Feel free to come up with a better, more sensible explanation?
> >=20
> > > 2. Generating signal with such a low resolution but such
> > > a high dotclock is not a good situation.
> >=20
> > What? What do you mean? The pixel clock is 27MHz, I'm pretty sure we
> > agree on that.
>=20
> Yes, so I don't think the TCON code should set the clock to any value
> rather than 27MHz.

The pixel clock that matters is what is output on the TV
connector. The intermediate pixel clock don't matter, and in this
case, it seems to be clearly the case that the TCON needs a higher
clock, then let's give it a higher clock.

> So we should create a clock with divider in TVE, and feed it to TCON.

I'm sorry, but this still doesn't make much sense. The clock is
provided by the TCON, and there's a divider in the TVE, it's as simple
as that, unless you can provide some other meaningful explanation.

That the TV encoder feeds a clock that would drive the TCON is already
suspicious, and all the precedent designs indicate that this is not
what is going on. Both the explanation and the design is much simpler
that way.

Sometimes the Occam's razor is a better justification than a label on
a datasheet.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--cuas4phllyrebc2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMeTyAAoJEBx+YmzsjxAgKt4P/jCf8xltjs7sYgm3q+XPqQyy
eBLKo4UQIkwCaL90MaE2055VfMfHXIbfAPumMJm0mcz44UNUCKQgk/DhEshYSP7t
GgwXXWEroAz2R7jEqThF9DimQCSrcrzWYmw849r5EPnoM0AM28PdVDGvLvLUOcWG
LnPSrxLG9YV/jmKv84fn3SC+uo3J30Fg8MvLnuu9AMMhoRIziHceeI798jDnvYcX
5bRdYQG6e7p4e7n4UL2UO7faxmUVry7hUdQHs6AxIGdOynYkyVBUT3T0BLgBcHt/
J8kYdoMK8xtqtBT1av09WLy+XgO+J4n7rwneTXLGN3O4hm1Wb1MsElLhyeGlV8R4
dVWcQ1KNWm+o311/FAsxXN5nYRR7W12LmwuFUKgF7O5CmgtYqGjSemeOtOQ5yqBO
SipSFx/+P+9jm/Ck9/EITMFFgomDco7tX5NoUrqgp5Z3f6KTon07GrMZdMVasXYU
UyyzgYqlON1EDo/OOorbES70ViK7LEbLMTeQzy3WZR3mWfsI46/C89OeUu18s2Xi
rqMp5vfEbcY2dEE/B1NLyeglFoipkU5edYGUYlUNehbmVLMQJYu3QOq+oIKkwT7F
vHjSUQBaugtnFzyhWq7TgLHShqdPREMKHwNSXJ+oJ7FCNEUwROtWSvzji5JJaSBf
NDgxLi1hwBdzsqq4OXxq
=9Y44
-----END PGP SIGNATURE-----

--cuas4phllyrebc2e--
