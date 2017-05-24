From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Date: Wed, 24 May 2017 09:30:19 +0200
Message-ID: <20170524073019.bl6rojc2srrigalp@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
 <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
 <3164416.5xR36OcyjH@jernej-laptop>
 <20170523125321.t7y7yfrrfokpkzgd@flea.home>
 <98c3572beee0a81755994b4bdc508b18@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nh63lsvlsuca7ikb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDHNSTEQKGQEL6L25WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <98c3572beee0a81755994b4bdc508b18-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nh63lsvlsuca7ikb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2017 at 09:00:59PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-05-23 20:53=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Mon, May 22, 2017 at 07:55:56PM +0200, Jernej =C5=A0krabec wrote:
> > > Hi,
> > >=20
> > > Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai napisal(a):
> > > > On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec <jernej.skrabe=
c@siol.net>
> > > wrote:
> > > > > Hi,
> > > > >
> > > > > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng napisal=
(a):
> > > > >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=
=E5=8D=882:03:30, Maxime Ripard <maxime.ripard@free-
> > > > >
> > > > > electrons.com> =E5=86=99=E5=88=B0:
> > > > >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng wrote:
> > > > >> >> Allwinner H3 features a TV encoder similar to the one in earl=
ier
> > > > >> >
> > > > >> >SoCs,
> > > > >> >
> > > > >> >> but with some different points about clocks:
> > > > >> >> - It has a mod clock and a bus clock.
> > > > >> >> - The mod clock must be at a fixed rate to generate signal.
> > > > >> >
> > > > >> >Why?
> > > > >>
> > > > >> It's experiment result by Jernej.
> > > > >>
> > > > >> The clock rates in BSP kernel is also specially designed
> > > > >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> > > > >
> > > > > My experiments and search through BSP code showed that TVE seems =
to have
> > > > > additional fixed predivider 8. So if you want to generate 27 MHz =
clock,
> > > > > unit has to be feed with 216 MHz.
> > > > >
> > > > > TVE has only one PLL source PLL_DE. And since 216 MHz is a bit lo=
w for
> > > > > DE2,
> > > > > BSP defaults to 432 MHz for PLL_DE and use divider 2 to generate =
216 MHz.
> > > > > This clock is then divided by 8 internaly to get final 27 MHz.
> > > > >
> > > > > Please note that I don't have any hard evidence to support that, =
only
> > > > > experimental data. However, only that explanation make sense to m=
e.
> > > > >
> > > > > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which both us=
e 27 MHz
> > > > > base clock. Further experiments are needed to check if there is a=
ny
> > > > > possibility to have other resolutions by manipulating clocks and =
give
> > > > > other proper settings. I plan to do that, but not in very near fu=
ture.
> > > >
> > > > You only have composite video output, and those are the only 2 stan=
dard
> > > > resolutions that make any sense.
> > >=20
> > > Right, other resolutions are for VGA.
> > >=20
> > > Anyway, I did some more digging in A10 and R40 datasheets. I think
> > > that H3 TVE
> > > unit is something in between. R40 TVE has a setting to select "up
> > > sample".
> >=20
> > That might be just another translation of oversampling :)
> >=20
> > I didn't know it could be applied to composite signals though, but I
> > guess this is just another analog signal after all.
> >=20
> > > Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP
> > > driver on R40
> > > has this setting enabled only for PAL and NTSC and it is always 216
> > > MHz. I
> > > think that H3 may have this hardwired to 216 MHz and this would be
> > > the reason
> > > why 216 MHz is needed.
> > >=20
> > > Has anyone else any better explanation?
> >=20
> > That's already a pretty good one.
> >=20
> > Either way, wether this is upsampling, oversampling or just a
> > pre-divider, this can and should be dealt with in the mode_set
> > callback, and not in the probe.
>=20
> I got a better idea -- let TVE driver have the CLK_TVE as an
> input and create a subclock output with divider 16, and feed this
> subclock to TCON lcd-ch1.
>=20
> This is a model of the real hardware -- the clock divider is in
> TVE, not TCON.

That's definitely not a good representation of the hardware. There's
one clock, it goes to the TCON, period.

However, the TV encoder has a constraint on that clock rate. This can
be easily implemented using a custom encoder state where you'd set the
multiplier to set on that clock, and the TCON will use it.

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

--nh63lsvlsuca7ikb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJTaLAAoJEBx+YmzsjxAgKKQP/3jEdTA+FMluj1ZbFxPfWx5J
9hovicyPslTagdaqTUTeX9H/+g/3f1ZkGxaU4ASVo/rmkIlRQp5D3EgOYy+IK17c
DmWbPWDlZBS0UWrGzNTFB7wPZG9HFZmcrJ1p/UU1MG3nesOHf9yT0zzfjl5sTp25
1NMqIag0dmHKIqBAcYq2iacFxVqu99vgoMGjT9oVaJ4/VuNSd0NgreU2oRrQgBC4
SXJ9gOFIhbLM1JLQLW7Idn+hwx5Itdv8Y2nR0D/eeb1aZBDDPm5IQ/oL84TifZN4
XML8xXQiuTDFlvYZZ8mmcdtXSXjGgHUVSd4xtjC5xdqHxyzrA43rjag0/2+PuJCj
B8+eXjWwB1itqfW1tLZoAfjeWF/Ah/dw8DPLIkT+cL35UPgnW5njHnP7JgHD0pWV
m4ziCVVlo3skKmsfJtVIsge8BALw8LdvwIHkoH9QKH2D6a6HLA7coCy6kEBVrf/z
3EB7sZ5ucP2u7woYeySDZVoDP5FUdABWWEFzn13yEtLNOWu9TwdNAQ5uujEIvad8
/bGEs9PGDske08VnGs+Exy5v97lga5yuK6nMfrh5oHpz288Xire33xcKdhRQ0H09
6jKVXDIFfRj6MQtQDECCeHA0iU/9/dhkYq0KenhFt0l4oNMVU7K+ZWAKupN9y4cD
yktaJoGMR4sfqPdVVDzp
=8RGh
-----END PGP SIGNATURE-----

--nh63lsvlsuca7ikb--
