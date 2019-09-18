From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date: Wed, 18 Sep 2019 16:30:12 +0200
Message-ID: <20190918143012.4o54doeauiv3j42z@gilmour>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
 <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
 <3227980.eWD6USAIP4@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="murlg7gnizd4neyj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3227980.eWD6USAIP4@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--murlg7gnizd4neyj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 14, 2019 at 08:42:22AM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard na=
pisal(a):
> > Hi,
> >
> > On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> > > +	dev->regmap =3D devm_regmap_init_mmio(dev->dev, dev->base,
> > > +
> &deinterlace_regmap_config);
> > > +	if (IS_ERR(dev->regmap)) {
> > > +		dev_err(dev->dev, "Couldn't create deinterlace
> regmap\n");
> > > +
> > > +		return PTR_ERR(dev->regmap);
> > > +	}
> > > +
> > > +	ret =3D clk_prepare_enable(dev->bus_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable bus clock\n");
> > > +
> > > +		return ret;
> > > +	}
> >
> > Do you need to keep the bus clock enabled all the time? Usually, for
> > the SoCs that have a reset line, you only need it to read / write to
> > the registers, not to have the controller actually running.
> >
> > If you don't, then regmap_init_mmio_clk will take care of that for
> > you.
> >
> > > +	clk_set_rate(dev->mod_clk, 300000000);
> > > +
> > > +	ret =3D clk_prepare_enable(dev->mod_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable mod clock\n");
> > > +
> > > +		goto err_bus_clk;
> > > +	}
> > > +
> > > +	ret =3D clk_prepare_enable(dev->ram_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable ram clock\n");
> > > +
> > > +		goto err_mod_clk;
> > > +	}
> > > +
> > > +	ret =3D reset_control_reset(dev->rstc);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to apply reset\n");
> > > +
> > > +		goto err_ram_clk;
> > > +	}
> >
> > This could be moved to a runtime_pm hook, with get_sync called in the
> > open. That way you won't leave the device powered on if it's unused.
>
> Currently I'm looking at sun4i_csi.c as an example of runtime ops, but it
> seems a bit wrong to have suspend and resume function marked with
> __maybe_unused because they are the only functions which enable needed cl=
ocks.
> If CONFIG_PM is not enabled, then this driver simply won't work, because
> clocks will never get enabled. I guess I can implement runtime pm ops in =
the
> same way and add additional handling when CONFIG_PM is not enabled, right?

Ah, right. I guess you can either add a depends on PM, or you can call
the function directly and use set_active like we're doing in the SPI
driver.

> BTW, which callback is get_sync? I don't see it in dev_pm_ops. I suppose I
> need only runtime_suspend and runtime_resume.

get_sync is the user facing API, ie what you call when you want the
device to be powered up. This will call runtime_resume if needed
(there were no users, and you become the first one), and on the parent
devices if needed too (even though it's not our case).

> Off topic: sun6i_csi.c includes linux/pm_runtime.h but it doesn't have an=
y kind
> of power management as far as I can see.

That's probably something we can remove then

Thanks!
Maxime

--murlg7gnizd4neyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYI/dAAKCRDj7w1vZxhR
xevqAQCkxjBKYVgA/AYg52M5egxPmCw9EbU+dTVOFOS3HnL94wD8C/1DfMGYclzH
K2NXT3v5e5dek4yjiUUAdMyPuzrn4gU=
=xZgs
-----END PGP SIGNATURE-----

--murlg7gnizd4neyj--
