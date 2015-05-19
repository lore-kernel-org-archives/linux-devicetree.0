From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 04/10] pinctrl: sunxi: Prepare for building SoC
 specific drivers as modules
Date: Tue, 19 May 2015 09:55:37 +0200
Message-ID: <20150519075537.GU4004@lukather>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
 <1431707940-19372-5-git-send-email-jenskuske@gmail.com>
 <20150517141922.GE4004@lukather>
 <5559B1AF.2010200@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OB5EHGIE61HZYYnQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5559B1AF.2010200@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Kuske <jenskuske@gmail.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--OB5EHGIE61HZYYnQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 11:32:31AM +0200, Jens Kuske wrote:
> Hi,
>=20
> On 05/17/15 16:19, Maxime Ripard wrote:
> > On Fri, May 15, 2015 at 06:38:54PM +0200, Jens Kuske wrote:
> >> Add a remove function and export the init and remove function
> >> to allow us to build the SoC specific drivers as modules.
> >>
> >> Signed-off-by: Jens Kuske <jenskuske@gmail.com>
> >> ---
> >>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 25 +++++++++++++++++++------
> >>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
> >>  2 files changed, 21 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/s=
unxi/pinctrl-sunxi.c
> >> index f8e171b..4ef6b3d 100644
> >> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >> @@ -856,7 +856,6 @@ int sunxi_pinctrl_init(struct platform_device *pde=
v,
> >>  	struct sunxi_pinctrl *pctl;
> >>  	struct resource *res;
> >>  	int i, ret, last_pin;
> >> -	struct clk *clk;
> >> =20
> >>  	pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> >>  	if (!pctl)
> >> @@ -954,13 +953,13 @@ int sunxi_pinctrl_init(struct platform_device *p=
dev,
> >>  			goto gpiochip_error;
> >>  	}
> >> =20
> >> -	clk =3D devm_clk_get(&pdev->dev, NULL);
> >> -	if (IS_ERR(clk)) {
> >> -		ret =3D PTR_ERR(clk);
> >> +	pctl->clk =3D devm_clk_get(&pdev->dev, NULL);
> >> +	if (IS_ERR(pctl->clk)) {
> >> +		ret =3D PTR_ERR(pctl->clk);
> >>  		goto gpiochip_error;
> >>  	}
> >> =20
> >> -	ret =3D clk_prepare_enable(clk);
> >> +	ret =3D clk_prepare_enable(pctl->clk);
> >>  	if (ret)
> >>  		goto gpiochip_error;
> >> =20
> >> @@ -1015,10 +1014,24 @@ int sunxi_pinctrl_init(struct platform_device =
*pdev,
> >>  	return 0;
> >> =20
> >>  clk_error:
> >> -	clk_disable_unprepare(clk);
> >> +	clk_disable_unprepare(pctl->clk);
> >>  gpiochip_error:
> >>  	gpiochip_remove(pctl->chip);
> >>  pinctrl_error:
> >>  	pinctrl_unregister(pctl->pctl_dev);
> >>  	return ret;
> >>  }
> >> +EXPORT_SYMBOL(sunxi_pinctrl_init);
> >> +
> >> +int sunxi_pinctrl_remove(struct platform_device *pdev)
> >> +{
> >> +	struct sunxi_pinctrl *pctl =3D platform_get_drvdata(pdev);
> >> +
> >> +	gpiochip_remove(pctl->chip);
> >> +	pinctrl_unregister(pctl->pctl_dev);
> >> +
> >> +	clk_disable_unprepare(pctl->clk);
> >=20
> > We should also remove the domain and the interrupt mapping here.
>=20
> Ouch, I missed that. Only looked at the *_error: labels.
>=20
> Apart from that, currently the kernel panics some seconds after removing
> the pinctrl module because mmc wants to access a gpio. Can this be
> prevented somehow? I think pinctrl must not be removed once other
> devices use any pin-related things.

pinctrl_unregister doesn't look like it cares about whether or not
there's users left in the system.

Maybe the easiest path would be to just make this builtin like Paul
suggested then ... :/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OB5EHGIE61HZYYnQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVWux5AAoJEBx+YmzsjxAg8ugQAJ0uYbDdAWINdYcNim81eYLz
iulFf455/3/WANKxGFD7yyYrsi7x0BPFNhe0dUTvxwtB6bTH3WmHkY1DWGwpqNb1
BSI8goLrdcPXkgxdJYAEwBqUs2QsKFO/4pCSaM53fAoQv6f6JvVNbertXwkohjbM
dEWtha+uHA4uxtUcN1pBmf0MU8LE/YwiM3NxzxQOG75TniWpzqDjtWhCU/vePRWM
um0ZY6DYTkRSJcKJetqKPc9tvScuGdM1vrJZHArprb+iNx295mBAlDI1nvMVyyNe
8JPwp6IZiWopFa7UOuNzHnjSexmEhZMxw4JKa3EfcSL0qDP1kIISgWJmfQpqVurX
GXUF6qY6kfLU1/EMmZTTukWRLhqZ8kpvUUQq/rsG+QKvuWLr5drFtcGQdUG9VeBH
AU7Bb5noSEYYWrWjClf3WEQJGd0g4PbBPypKgFyljc0H0y795wvoWIf51Rmyqb+f
7p9B77yX8ZSFlxOA0vif9z8Co34s+O/OeKnStUtGNnBMh8y1G9MsJ2ldiGVPpo1s
uDofO+75jlihdMqAjjzCO5OSPGdRSp+LN3o0quJZtJ7ZOF3LnDhZASQyCmRUXw3m
hGQHA/6SmO9MWN74rdKBoS6W/TbaiwtqighGyXTrtT3e6/FsFdIhTWHX8fWppCBC
+1EGkmFSI+ls3mboqanU
=dfaO
-----END PGP SIGNATURE-----

--OB5EHGIE61HZYYnQ--
