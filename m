From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 2/8] ARM: sun4i: Add display blocks for
 the sun4i dtsi.
Date: Tue, 14 Feb 2017 09:24:29 +0100
Message-ID: <20170214082429.hoz4dvmszu3d7sz2@lukather>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-3-plaes@plaes.org>
 <20170213091612.d5ifc4oi63xf7boi@lukather>
 <CAGb2v648uAKxpYaU_qhTLAyfe5snW1LG1VWmm+UMLRSQ5a7DKg@mail.gmail.com>
 <1487004405.20308.3.camel@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hlqnbzq2m7sqv5c4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPX5RLCQKGQEXD3M4WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1487004405.20308.3.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hlqnbzq2m7sqv5c4
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 13, 2017 at 06:46:45PM +0200, Priit Laes wrote:
> On Mon, 2017-02-13 at 17:20 +0800, Chen-Yu Tsai wrote:
> > On Mon, Feb 13, 2017 at 5:16 PM, Maxime Ripard
> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > Hi,
> > >=20
> > > On Sat, Feb 11, 2017 at 07:43:59PM +0200, Priit Laes wrote:
> > > > Added basic display pipeline consisting of tcon, display backend
> > > > and
> > > > frontend blocks.
> > > >=20
> > > > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > > > ---
> > > > =C2=A0arch/arm/boot/dts/sun4i-a10.dtsi | 104
> > > > +++++++++++++++++++++++++++++++++++++++
> > > > =C2=A01 file changed, 104 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi
> > > > b/arch/arm/boot/dts/sun4i-a10.dtsi
> > > > index ba20b48..70991c9 100644
> > > > --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> > > > +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> > > > @@ -779,6 +779,45 @@
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cel=
ls =3D <0>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0};
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0tcon0: lcd-controller@1c0c000 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D =
"allwinner,sun5i-a13-tcon";
> > >=20
> > > There's a few bits here and there that need to be setup differently
> > > in
> > > A10, so you cannot reuse that compatible (same thing for the
> > > other).
> > >=20
> > > Also, I'd really like to have all the blocks listed here, and not
> > > only
> > > the first pipeline. Ideally, on the A10, the two pipelines should
> > > be
> > > enabled too.
> >=20
> > The display pipeline driver has to be fixed before that can happen
> > though. And I haven't started to work on what I proposed yet. Though
> > if someone wants to take over I can forward any design plans I have.
>=20
> Well, my plan was to get at least minimum bits mainlined and then build
> additional features on top.

I understand that, but now that we have the DT stability to maintain,
I want to make sure that everything is correctly represented from day
one, with code that works.

Otherwise, we might or might not be able to fix things properly later
down the road (or at the expense of ugly hacks).

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

--hlqnbzq2m7sqv5c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYor65AAoJEBx+YmzsjxAgVYcP/0RnEWMcDPOrWovvHLnfqDYU
J2hYmx/HL34Lo7VIwHXC3hBXl1pfTG12xqUUOgrYXuQehM2lH80OSHQpbaLPK6in
knK7VgzSB7w48crzXLUQ7vih6eoRmiDsu92NH2wGJWRxMumtrD0+KEGSpqN0+lRj
J9Y3K/3rBFWRIihqvmdaESuT/c8/BfutkJrRI4xZss7sZRcowAqARSY1FlVuG9qL
OVVCe010O/s5ti55KM/eKHG3Fqn3axpcIWAPK6TzT3YrSRyzZb/F69JwPvNoKCBQ
j1D+HKTc+yTvq36svCIQSTfufTnVPR7DhEhWmsJukv4WLxEaOXIne7rhVOgb8n0E
O2WaIWJelA8zuXPM7qgQgjAZ5iGqBcmYgegWMXP2nzWsiTqU89Vei3cKLEvPTKLS
7U47iD5LYcX0Yruc1M6vvOMZjHvi5aXdZZ99r7CvuMQujtUSe94UtdFYVwmOvdW3
GyFje7BFJ8bkQKf658/JVtI0vvh0OW/MA/m0Yehj6aHrTgIqq+aGQZwbu3WlJmXK
aaz3gwZ3GmVHV0HUibC52ayh3+a5hDkQzJts1/TbIjm1twGYLo4cTpFdhdIihup4
GJjavtOg8c2fvml65CfIS9tHFPpHk5b3ULbBO4Dvf2oM0JIm6egZnXt6Px9kgBeB
8gWi5kXefd6bzHnUUtTK
=TNlE
-----END PGP SIGNATURE-----

--hlqnbzq2m7sqv5c4--
