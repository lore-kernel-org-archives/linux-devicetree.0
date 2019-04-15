From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: sound: sun4i-spdif: Add
 Allwinner H6 compatible
Date: Mon, 15 Apr 2019 16:51:35 +0200
Message-ID: <20190415145135.fjbcaldwy7w3eqcs@flea>
References: <20190411214422.2267-1-peron.clem@gmail.com>
 <20190411214422.2267-2-peron.clem@gmail.com>
 <20190415080443.frubh4ln4agrdsfe@flea>
 <CAJiuCcc0Q8rh8u_30gKi8o07k0+e35UR99ZBHtCjx-DPkJEtdw@mail.gmail.com>
 <20190415081816.2pay4pioc5d4mojf@flea>
 <CAJiuCcedNF0xYSa_+Zfwj-vqYsbjfEpRqisOhEvuitYALMsyjw@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sxl5ukncdhkjkqsu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB65U2LSQKGQEH5WLQVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAJiuCcedNF0xYSa_+Zfwj-vqYsbjfEpRqisOhEvuitYALMsyjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sxl5ukncdhkjkqsu
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 10:30:38AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> On Mon, 15 Apr 2019 at 10:18, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> w=
rote:
> >
> > On Mon, Apr 15, 2019 at 10:09:11AM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Hi,
> > >
> > > On Mon, 15 Apr 2019 at 10:04, Maxime Ripard <maxime.ripard-LDxbnhwyfcKIwRZHo2/mJg@public.gmane.org=
m> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Apr 11, 2019 at 11:44:19PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > Allwinner H6 has a SPDIF controller with an increase of the fifo
> > > > > size and the possibility to output the master clock.
> > > > > However it's still compatible with the already existing driver fo=
r
> > > > > Allwiner H3.
> > > > >
> > > > > Add this compatible in the device-tree bindings documentation.
> > > >
> > > > How was this tested?
> > >
> > > Using Alsa utils on a Beelink GS1 and I check correct output sound on
> > > my home cinema.
> > >
> > > > After looking at the datasheet, it looks like it's still significan=
tly
> > > > different. In particular:
> > > >
> > > >   - The MCLK divider isn't at the same offset
> > >
> > > We don't use the MCLK
> > >
> > > >   - The bits to flush the FIFO aren't at the same offset
> > > >   - The FIFO trigger levels aren't at the same offset
> > > >   - The FIFO status register layout is almost entirely different
> > >
> > > We use DMA not FIFO
> >
> > Well, DMA still uses the FIFOs. And even then, you're kind of missing
> > the point. The device tree's compatible is about whether a particular
> > device can be used as another one. How you are using it in the driver
> > is completely irrelevant.
>
> Sorry I meant " We use DMA not PIO".

I'm still not quite sure what you mean. Both DMA and PIO would be
using the FIFOs.

> I didn't change the driver and the SPDIF is working what's irrelevant
> in declaring the driver as compatible ?

It's working by accident.

This won't work for example:
https://elixir.bootlin.com/linux/latest/source/sound/soc/sunxi/sun4i-spdif.=
c#L181

> If some feature are missing they can be introduce later as there is a
> special binding for H6 no ?

Again, that's irrelevant. The only question you need to ask yourself
is whether, if you take an imaginary source code that would support
all the H3 SPDIF features and run it on an H6, it works just as well.

The examples above that it's not the case, so you can't claim that the
device is compatible.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--sxl5ukncdhkjkqsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLSadwAKCRDj7w1vZxhR
xceAAP96JN2YhYM1zBkmyvK0GznWHP/qGjaXEu34Ymc9cr94WgEA5YRrzmmCqSra
G/5VRd32UJzMeF3TWQFNRHrueDOylwI=
=A0UO
-----END PGP SIGNATURE-----

--sxl5ukncdhkjkqsu--
