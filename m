From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 3/5] media: sunxi: Add A10 CSI driver
Date: Fri, 8 Feb 2019 21:19:08 +0100
Message-ID: <20190208201908.t5easf5uurvax7re@flea>
References: <cover.ba7411f0c7155d0292b38d3dec698e26b5cc813b.1548687041.git-series.maxime.ripard@bootlin.com>
 <c1a7d46f8504decb58ff224b0b5f2f0733282cc6.1548687041.git-series.maxime.ripard@bootlin.com>
 <CAAEAJfAxWBvj6E1fJ8fy=F2xDXLHwRq7-2BT3tQqbPvbZxseyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hsnrvmpmpg5r7wb2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAEAJfAxWBvj6E1fJ8fy=F2xDXLHwRq7-2BT3tQqbPvbZxseyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media <linux-media@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org


--hsnrvmpmpg5r7wb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Wed, Feb 06, 2019 at 07:59:43PM -0300, Ezequiel Garcia wrote:
> > +       csi->isp_clk =3D devm_clk_get(&pdev->dev, "isp");
> > +       if (IS_ERR(csi->isp_clk)) {
> > +               dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
> > +               return PTR_ERR(csi->isp_clk);
> > +       }
> > +
> > +       csi->mod_clk =3D devm_clk_get(&pdev->dev, "mod");
> > +       if (IS_ERR(csi->mod_clk)) {
> > +               dev_err(&pdev->dev, "Couldn't get our mod clock\n");
> > +               return PTR_ERR(csi->mod_clk);
> > +       }
> > +
> > +       csi->ram_clk =3D devm_clk_get(&pdev->dev, "ram");
> > +       if (IS_ERR(csi->ram_clk)) {
> > +               dev_err(&pdev->dev, "Couldn't get our ram clock\n");
> > +               return PTR_ERR(csi->ram_clk);
> > +       }
> > +
>=20
> Minor comment: perhaps you can take advantage
> of the clock bulk API and simplify the clock management.

Our clocks have usually very different usages for each IP (the RAM
controls the DMA side of the IP, the mod one controls the "logic" part
of it, the bus one the register, etc.) so they needed to be handled
quite differently. I'd rather stick with the current API.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hsnrvmpmpg5r7wb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXF3kPAAKCRDj7w1vZxhR
xX7rAQDZ8SvZeMCDfXgbukEy4JMwmoZozb1nisAxIhaBIKTsAQD6A3Cj6WVtN5dP
uR0AiYb1Sg3joHZ9DfaysXHNhYUXvA8=
=uUw3
-----END PGP SIGNATURE-----

--hsnrvmpmpg5r7wb2--
