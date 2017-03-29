From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Date: Wed, 29 Mar 2017 14:31:18 +0200
Message-ID: <20170329123118.yvwnqpgtamc5pjqf@lukather>
References: <20170328100519.145DE203419@relay.mailchannels.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6ild6ujpwsam4vj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF6S53DAKGQEHMS3HMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170328100519.145DE203419-Y9/x5g2N/Tt0ykcd9G8QkxTxI0vvWBSX@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--d6ild6ujpwsam4vj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 06:05:08PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B43=E6=9C=8827=E6=97=A5 =E4=B8=8A=E5=8D=885:11=E4=BA=8E Maxime=
 Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Mar 17, 2017 at 11:34:45AM +0800, Chen-Yu Tsai wrote:=20
> > > On Thu, Mar 16, 2017 at 1:37 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:=
=20
> > > > On Tue, Mar 07, 2017 at 09:56:26AM +0100, Maxime Ripard wrote:=20
> > > >> The Allwinner Timings Controller has two, mutually exclusive, chan=
nels.=20
> > > >> When the binding has been introduced, it was assumed that there wo=
uld be=20
> > > >> only a single user per channel in the system.=20
> > > >>=20
> > > >> While this is likely for the channel 0 which only connects to LCD =
displays,=20
> > > >> it turns out that the channel 1 can be connected to multiple contr=
ollers in=20
> > > >> the SoC (HDMI and TV encoders for example). And while the simultan=
eous use=20
> > > >> of HDMI and TV outputs cannot be achieved, switching from one to t=
he other=20
> > > >> at runtime definitely sounds plausible.=20
> > > >>=20
> > > >> Add an extra property, allwinner,tcon-channel, to specify for a gi=
ven=20
> > > >> endpoint which TCON channel it is connected to, while falling back=
 to the=20
> > > >> previous mechanism if that property is missing.=20
> > > >=20
> > > > I think perhaps TCON channels should have been ports rather than=20
> > > > endpoints. The fact that the channels are mutually exclusive can be=
=20
> > > > handled in the driver and doesn't really matter in the binding. How=
=20
> > > > painful would it be to rework things to move TCON channel 1 from po=
rt 0,=20
> > > > endpoint 1 to port 1?=20
> > >=20
> > > Having a separate output port for channel 1 was one option we discuss=
ed.=20
> > > However it wouldn't work well with the kernel's of_graph based crtc=
=20
> > > detection (drm_of_find_possible_crtcs / drm_of_find_possible_crtcs),=
=20
> > > which has the crtcs bound via the output port. As the logic is used=
=20
> > > by multiple drivers, I'm not sure it's easy to rework or test.=20
> >
> > Can't we use a different logic than drm_of_find_possible_crtcs to fill=
=20
> > the same role?=20
> >
> > > Also, we still have to support old device trees using channel 1 from=
=20
> > > output port 0 endpoint 1. This is the TV encoder on sun5i (A10s/A13/R=
8).=20
>=20
> And from A83T on we will face channel-1 only TCONs., which do not
> have channel 0 at all in hardware.

Yes, but those patches have not been merged yet, so we don't have to
care about the backward compatibility.

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

--d6ild6ujpwsam4vj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY26kWAAoJEBx+YmzsjxAgb/MP/jtL0JlIwAveyf/CcfjkxgHw
MLNrGlxGFilQgryvyxGYk0QLMYz/1KpXkIWviJHt2dAFkxwxrG/YC6p2zEKDskw0
Pwi0GshgXCs8xRgV98RHH3n60R1tVirmp/S940I1Ci+DdVQVV4Cy/XJzWFqzbpR3
79O2jb+CX5fF/n5g32xij4e5rtjiFRPZ33ywS4J7mRfSf6+aqIx/d51NDncT/3mb
dvQp7yp2mijSRe0wjMxaSvAtRWDBl+qqJ7CKfVHhVpm2yONJCIBk1qE1KvFNCT0S
c/kX/TIR7hJV2j4HQjkcjSTE3vtX3ZdZxErsnV6Q+8xjnJiT5a65LgsaG09bBEdb
IgEL47RcbdYEdObw46n5ykrAyB7IgeQPmhFiftEha28zyVVwjFahEJxBsvj3t57I
93Ll52kx5lw4AB+hEE7e6hbyFaHfMLVXFRuIxjY2/eVKEUOFlm49XfKGey02/lXH
l4lwjqAHOO3czlBA/Bh0mLl5mgTrZF9LhjOzYibkqNU6ct+i4aIwmIjN0bQyRUZC
UmatmpRh9pliIiBSA3eyKMRkVpY1/6NzVsvwEgvzRuK7MrAFjkQwMjoaFBIazzOI
ew5V7qiXXcjJ806QE/dg6PkBVScqUB+14D6/EL9l+HdPzCRAzuG74Dy90wVIPCI8
okHeulGoa3+JdB7BGDPe
=8jnb
-----END PGP SIGNATURE-----

--d6ild6ujpwsam4vj--
