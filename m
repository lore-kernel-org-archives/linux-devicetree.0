From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun6i: Add required ahb1
 clock parent and rates for dma controller
Date: Tue, 16 Sep 2014 17:48:49 +0200
Message-ID: <20140916154849.GE2166@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-7-git-send-email-wens@csie.org>
 <20140911211531.GN31276@lukather>
 <CAGb2v64+RxJ52DzawhAtYCn=sw+28e4Q11jzG02KQE=8hxa0tQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNNY4GQAKGQECRI36SY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64+RxJ52DzawhAtYCn=sw+28e4Q11jzG02KQE=8hxa0tQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 10:10:25AM +0800, Chen-Yu Tsai wrote:
> On Fri, Sep 12, 2014 at 5:15 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Sat, Sep 06, 2014 at 06:47:27PM +0800, Chen-Yu Tsai wrote:
> >> The DMA controller requires AHB1 bus clock to be clocked from PLL6.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6=
i-a31.dtsi
> >> index 8eb2c6d..1117989 100644
> >> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> >> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> >> @@ -317,6 +317,11 @@
> >>                       clocks =3D <&ahb1_gates 6>;
> >>                       resets =3D <&ahb1_rst 6>;
> >>                       #dma-cells =3D <1>;
> >> +
> >> +                     /* DMA controller requires AHB1 clocked from PLL=
6 */
> >> +                     assigned-clocks =3D <&ahb1>;
> >> +                     assigned-clock-parents =3D <&pll6>;
> >> +                     assigned-clock-rates =3D <200000000>;
> >
> > Where did you get that from?
> >
> > The user manual says that it should be clocked at 600MHz, and I'm not
> > sure it should be enforced there either.
>=20
> The bindings mean that ahb1 should be clocked from pll6 and at 200 MHz,
> not "pll6 should be 200 MHz". I assume you were misled by them.
>=20
> Clocking ahb1 from pll6 and at 200 MHz with the /3 pre-divider is the
> vendor BSP default:
>=20
> On sun6i, the clock init code calls aw_ccu_switch_ahb_2_pll6(), which mux=
es
> ahb1 from pll6 with the highest dividers, then sets the rate for ahb1 to
> pll6, which sets pre-divider to /3 and divider to /1.
>=20
> Hope this clears it up. :)

It does, thanks :)

But still, I find it the wrong place to enforce such a limit. This
should go into the clock driver itself. The DMA controller requires
such a parenting, but it doesn't require any specific rate, this is
more something of the global system policy.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGFvhAAoJEBx+YmzsjxAgZWYP/26aPoXAZ7xFk0fy9qBv1/kr
ss3te0S+1hzwJWIjNz2T6Blr/YnvYkqsOo6Y5znGpUXpjLACEny35ptFLDrrOxVw
z+0zShbWTZCuIdcrkjyz4MSSxn8NaNYVZsfRZn5CfwYWtWdE3i9YvLxO/dXScw8e
1uRlHFOwrDf64oZa0axpIQMMdbq+HDmi/bPx8Qs8gZaruqXVYz12h2cZl+cC6lj2
XR2r9ZKOztJHIERPc3npcnnY9a3ntlRSuQySWTmNxV97qfwdnuh6ICY/d08nkv/0
+/5HFRthNSsvj4l08tQFHqDLe+2RP8XiawFBngMKFPXnlrTRzHPCeZQCm0dNwuua
3fW7bM3lleYPqSE905pteLSKbQHuC7uI1WIMwD2DvGh1Tvd58b+ike+cQgTqRnGS
OyJhq0qF8to4Anr46XvMsy4XN+1M5xhS3q7vLy/18HmY3b2W5VrMQ9/xR+FABhDK
XsZH5JpCWpTKoUxP4iYFqu5lsThKDRW5zIsjiX97HBhd69PYRUSDf+zyqN8+msjJ
DbbVDztdEMLsL+iX5US7MtSiCSLpxLHMWOvC7CqUxAIq5BG4ThNFMAasb9dHHf50
zWwAKuS4qYFnP/sr3CroUo0acXLZ/n2nw6FNHV/6rGlJvOlT+ILGvhjIMn57Lc8p
oZZxeHNhDKx/bo+mKWoy
=GS3C
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
