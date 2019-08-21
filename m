From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 04/10] mailbox: sunxi-msgbox: Add a new
 mailbox driver
Date: Wed, 21 Aug 2019 14:30:35 +0200
Message-ID: <20190821123035.tl4aakijjhw3bwbk@flea>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-5-samuel@sholland.org>
 <20190820111825.2w55fleehrnon27u@core.my.home>
 <bc09e14c-1cf5-8124-fc34-c651b78577ce@sholland.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mrpxrcur5riymvjn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3XS6TVAKGQEIZPZJ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <bc09e14c-1cf5-8124-fc34-c651b78577ce-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mrpxrcur5riymvjn
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 08:07:53AM -0500, Samuel Holland wrote:
> On 8/20/19 6:18 AM, Ond=C5=99ej Jirman wrote:
> >> +	reset =3D devm_reset_control_get(dev, NULL);
> >> +	if (IS_ERR(reset)) {
> >> +		ret =3D PTR_ERR(reset);
> >> +		dev_err(dev, "Failed to get reset control: %d\n", ret);
> >> +		goto err_disable_unprepare;
> >> +	}
> >> +
> >> +	ret =3D reset_control_deassert(reset);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to deassert reset: %d\n", ret);
> >> +		goto err_disable_unprepare;
> >> +	}
> >
> > You need to assert the reset again from now on, in error paths. devm
> > will not do that for you.
>
> I know, and that's intentional. This same message box device is used for =
ATF to
> communicate with SCP firmware (on a different channel). This could be hap=
pening
> on a different core while Linux is running. So Linux is not allowed to de=
assert
> the reset. clk_disable_unprepare() is only okay because the clock is mark=
ed as
> critical.

I agree with Ondrej that since this is clearly not the standard use of
the API, this must have a big comment explaining why we're doing it
this way.

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
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190821123035.tl4aakijjhw3bwbk%40flea.

--mrpxrcur5riymvjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV05awAKCRDj7w1vZxhR
xbIJAP9yrpmQb5VASu0xwjQKiF8z6Qkk63ohQogxkr2k66hwcAEAulMS7ROeVRrO
iA0Lo17qVmuTaZnBbSFPofjTOChqgAQ=
=0XW2
-----END PGP SIGNATURE-----

--mrpxrcur5riymvjn--
