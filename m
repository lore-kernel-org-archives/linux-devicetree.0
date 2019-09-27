From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 0/2] drm: LogiCVC display controller support
Date: Fri, 27 Sep 2019 20:32:01 +0200
Message-ID: <20190927183201.hfkhayehmloi34vo@gilmour>
References: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tukillri5nr7fxtt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--tukillri5nr7fxtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 12:07:36PM +0200, Paul Kocialkowski wrote:
> This series introduces support for the LogiCVC display controller.
> The controller is a bit unusual since it is usually loaded as
> programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
> More details are presented on the main commit for the driver.
>
> More information about the controller is available on the dedicated
> web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--tukillri5nr7fxtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXY5VoQAKCRDj7w1vZxhR
xYKdAQD7nEpueam4PSkHSKh8hVDVyPCVaXN/FdzJgTHzv4XOkQEAzBZjTbENrCBg
0RfwWhlSmQVPQssAzVRlemjHylV2zQg=
=95Js
-----END PGP SIGNATURE-----

--tukillri5nr7fxtt--
