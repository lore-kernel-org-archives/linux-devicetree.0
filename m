From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date: Sun, 29 Sep 2019 15:18:58 +0200
Message-ID: <14809830.gx5DXe3C1k@jernej-laptop>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <20190912175132.411-6-jernej.skrabec@siol.net> <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBRG6YLWAKGQEGHWDVDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190912202647.wfcjur7yxhlelvd6-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard napi=
sal(a):
> Hi,
>=20
> On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> > +	dev->regmap =3D devm_regmap_init_mmio(dev->dev, dev->base,
> > +					   =20
&deinterlace_regmap_config);
> > +	if (IS_ERR(dev->regmap)) {
> > +		dev_err(dev->dev, "Couldn't create deinterlace=20
regmap\n");
> > +
> > +		return PTR_ERR(dev->regmap);
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(dev->bus_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable bus clock\n");
> > +
> > +		return ret;
> > +	}
>=20
> Do you need to keep the bus clock enabled all the time? Usually, for
> the SoCs that have a reset line, you only need it to read / write to
> the registers, not to have the controller actually running.
>=20
> If you don't, then regmap_init_mmio_clk will take care of that for
> you.

I just tested and using regmap_init_mmio_clk() with "bus" clock doesn't wor=
k.=20
I guess it has to be enabled whole time. I'll just leave it as-is.

Best regards,
Jernej

>=20
> > +	clk_set_rate(dev->mod_clk, 300000000);
> > +
> > +	ret =3D clk_prepare_enable(dev->mod_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable mod clock\n");
> > +
> > +		goto err_bus_clk;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(dev->ram_clk);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to enable ram clock\n");
> > +
> > +		goto err_mod_clk;
> > +	}
> > +
> > +	ret =3D reset_control_reset(dev->rstc);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to apply reset\n");
> > +
> > +		goto err_ram_clk;
> > +	}
>=20
> This could be moved to a runtime_pm hook, with get_sync called in the
> open. That way you won't leave the device powered on if it's unused.
>=20
> > +struct deinterlace_dev {
> > +	struct v4l2_device	v4l2_dev;
> > +	struct video_device	vfd;
> > +	struct device		*dev;
> > +	struct v4l2_m2m_dev	*m2m_dev;
> > +
> > +	/* Device file mutex */
> > +	struct mutex		dev_mutex;
> > +
> > +	void __iomem		*base;
> > +	struct regmap		*regmap;
>=20
> Do you need to store the base address in that structure if you're
> using the regmap?
>=20
> Maxime




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/14809830.gx5DXe3C1k%40jernej-laptop.
