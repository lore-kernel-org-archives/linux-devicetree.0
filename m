From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v8 0/5] media: Allwinner A10 CSI support
Date: Fri, 23 Aug 2019 09:47:54 +0200
Message-ID: <20190823074754.z23rx62o5do4pu3z@flea>
References: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p5b5zggpj4lv77ke"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org


--p5b5zggpj4lv77ke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2019 at 10:21:11AM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Hi,
>
> Here is a series introducing the support for the A10 (and SoCs of the same
> generation) CMOS Sensor Interface (called CSI, not to be confused with
> MIPI-CSI, which isn't support by that IP).
>
> That interface is pretty straightforward, but the driver has a few issues
> that I wanted to bring up:
>
>   * The only board I've been testing this with has an ov5640 sensor
>     attached, which doesn't work with the upstream driver. Copying the
>     Allwinner init sequence works though, and this is how it has been
>     tested. Testing with a second sensor would allow to see if it's an
>     issue on the CSI side or the sensor side.
>   * We don't have support for the ISP at the moment, but this can be added
>     eventually.

Applied patch 4.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--p5b5zggpj4lv77ke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV+aKgAKCRDj7w1vZxhR
xRMwAP0fMmxNQd3iwRCBEhylWiBgjth2nBRFWwaoecI6PiXhjQD8Cr8Op739M9P5
ELbAfEs0KtHW7ro3qTMi5KruzloAGgU=
=+ikl
-----END PGP SIGNATURE-----

--p5b5zggpj4lv77ke--
