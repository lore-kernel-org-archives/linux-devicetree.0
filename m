From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: axp20x: simplify device access
Date: Sat, 24 Sep 2016 10:59:27 +0200
Message-ID: <20160924105927.794f768afbe30e53616cf95f@free.fr>
References: <cover.1474616699.git.moinejf@free.fr>
	<d3078ed4eefd4de48e4b5666a64f6123f8d72483.1474616699.git.moinejf@free.fr>
	<CAGb2v64ZpQ=9KUH39cFoRxU6n03cgDoUbHegjFfDWaTLQAZ2wg@mail.gmail.com>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBBEJTG7QKGQEJ3WACHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64ZpQ=9KUH39cFoRxU6n03cgDoUbHegjFfDWaTLQAZ2wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 24 Sep 2016 16:29:11 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

	[snip]
> >  static int axp20x_regulator_probe(struct platform_device *pdev)
> >  {
> > +       struct device *dev =3D pdev->dev.parent;
>=20
> There are 2 struct device's in play in this function, 1 from the parent,
> and 1 for the platform device for this regulator sub-device.
>=20
> >         struct regulator_dev *rdev;
> > -       struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent)=
;
> > +       struct axp20x_dev *axp20x =3D dev_get_drvdata(dev);
> >         const struct regulator_desc *regulators;
> >         struct regulator_config config =3D {
> > -               .dev =3D pdev->dev.parent,
> > +               .dev =3D dev,
> >                 .regmap =3D axp20x->regmap,
> >                 .driver_data =3D axp20x,
> >         };
> > @@ -532,7 +533,7 @@ static int axp20x_regulator_probe(struct platform_d=
evice *pdev)
> >                 dcdc5_ix =3D AXP22X_DCDC5;
> >                 dc1sw_ix =3D AXP22X_DC1SW;
> >                 dc5ldo_ix =3D AXP22X_DC5LDO;
> > -               drivevbus =3D of_property_read_bool(pdev->dev.parent->o=
f_node,
> > +               drivevbus =3D of_property_read_bool(dev->of_node,
> >                                                   "x-powers,drive-vbus-=
en");
> >                 break;
> >         case AXP806_ID:
> > @@ -555,13 +556,13 @@ static int axp20x_regulator_probe(struct platform=
_device *pdev)
> >                 dc5ldo_ix =3D AXP809_DC5LDO;
> >                 break;
> >         default:
> > -               dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
> > +               dev_err(dev, "Unsupported AXP variant: %ld\n",
>=20
> So this one is incorrect. You should use this device's struct,
> not the parent. It's possible the mfd driver supports a PMIC,
> but the regulator driver is still missing.

Why do you need a regulator driver? The 'regulator' node in the DT is
not a real device. It is just a container and it could be removed
without any problem.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
