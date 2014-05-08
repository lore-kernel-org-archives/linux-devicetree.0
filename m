From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/7] clk: sunxi: add PRCM (Power/Reset/Clock
 Management) clks support
Date: Wed, 7 May 2014 21:45:20 -0500
Message-ID: <20140508024520.GH7047@lukather>
References: <1398697130-8338-1-git-send-email-boris.brezillon@free-electrons.com>
 <1398697130-8338-6-git-send-email-boris.brezillon@free-electrons.com>
 <20140428234039.GT3134@lukather>
 <536A697E.5000107@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNpeiK4tTqhYOExY"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB3PBVONQKGQEA5N6SRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536A697E.5000107-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PNpeiK4tTqhYOExY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 07:12:30PM +0200, Boris BREZILLON wrote:
>=20
> On 29/04/2014 01:40, Maxime Ripard wrote:
> > On Mon, Apr 28, 2014 at 04:58:48PM +0200, Boris BREZILLON wrote:
> >> The PRCM (Power/Reset/Clock Management) unit provides several clock
> >> devices:
> >> - AR100 clk: used to clock the Power Management co-processor
> >> - AHB0 clk: used to clock the AHB0 bus
> >> - APB0 clk and gates: used to clk
> > Used to clk?
> "Used to clk peripherals connected on the APB0 bus"
>=20
> I'll add the missing words in the next version :-).
>=20
> >
> [...]
> > Ditto.
> >
> > And you'll probably want to use devm_ioremap_resource when you'll have
> > a single clock for the AR100.
>=20
> Absolutely.
>=20
> >
> >> +
> >> +	clk_parent =3D of_clk_get_parent_name(np, 0);
> >> +	if (!clk_parent)
> >> +		return -EINVAL;
> [...]
> >> +
> >> +static struct platform_driver sun6i_a31_prcm_clk_driver =3D {
> >> +	.driver =3D {
> >> +		.name =3D "sun6i-a31-prcm-clk",
> >> +		.owner =3D THIS_MODULE,
> >> +		.of_match_table =3D sun6i_a31_prcm_clk_dt_ids,
> >> +	},
> >> +	.probe =3D sun6i_a31_prcm_clk_probe,
> > You're not calling the of_clk_del_provider, and you should probably
> > unregister your clocks too.
>=20
> This driver cannot be compiled as a module, and as a result the probed
> clks will never be removed.
>=20
> Do you really want to support clk removal for this HW block ?

Hmm, no, then it's fine.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PNpeiK4tTqhYOExY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTau/AAAoJEBx+YmzsjxAgF4MP/REXX3DCYLkrt/OwMQ89Tmx8
TyJD4e8SEj1nmGX1rzW1/V6pCpNgj0CoVo5nRXCzVOiwLrFATQB3c4dgtzorz8Vc
Judw5pe5FkLAKW6PvxNNcGMyIkD/b9OLe73NMF3FJ9ovu3O+8yGmZrBw81ABom5b
3zLICu6qoY1HEnTyEfKwP3OlMAlDtf7iQL6Snx/Cl9Ys3sDiVX4WHevERjDETIAQ
wNDbZWjQlmKOSGWXACS6yBB4q15lohRIDjwfIMPX0ughZ50vGzzaPFJ7nUMWsXN0
VNTxH6Fg4BLZpDdpWU7X2za4cYYYr8hhhLENCteqjHWPMKLySXTiOLFtQfU0G0Nj
SpD16AKkYfLQa/YVm4WHgFTRGGOl6p2G7fTPsLP3BQrqzBh0AfG2QIHAxGNB2mYo
9ePZc6qFocUp9JCmHhYZYxUXY39BxxDvytbILDgUYYbC5razpyvDjnBrck/GFrIJ
tLWe3D72GdN0BM6T7JVefkmetRucmFqsDpJm63/FESvOfE3L+L0YwO5CPcZcR0HY
4rxtnk/0DUVMgJHvHfXn3oJI7w8wwA3oFn2S7K7pojSre9RiyqZTeJX2zGVDD5Ln
75XEc0VlqCglb7FiSEXeGcektcF8TTBqeivpRscSgbO0XdNWhuvnKoqGYTVoYzjj
+8oOo2ZKQsXS5U8rwo2/
=b36f
-----END PGP SIGNATURE-----

--PNpeiK4tTqhYOExY--
