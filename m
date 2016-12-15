From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCHv3 2/2] regulator: fixed: Handle optional
 overcurrent pin
Date: Thu, 15 Dec 2016 12:19:58 +0000
Message-ID: <20161215121958.klssvbtbuhsz3pga@sirena.org.uk>
References: <20161215112856.9541-3-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v5s3voismrjid7xi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161215112856.9541-3-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--v5s3voismrjid7xi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2016 at 12:28:56PM +0100, Axel Haslam wrote:

> +		ret = devm_request_threaded_irq(&pdev->dev,
> +				gpiod_to_irq(drvdata->oc_gpio), NULL,
> +				reg_fixed_overcurrent_irq, irqflags,
> +				"over_current", drvdata);

>  	drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc,
>  					       &cfg);

We are registering a managed interrupt for the interrupt handler and we
are registering it before we register the regulator.  This means that
the interrupt may fire in both probe and remove paths without the
regulator which it will then try to use in the interrupt handler,
potentially crashing the system.  It's better to register the interrupt
after the regulator (which will make the managed bit OK) to avoid this
possibility.

--v5s3voismrjid7xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhSim0ACgkQJNaLcl1U
h9CXVwf5ATLIQAY6fwKQg524qUryAGYxQYiwCavk3zbpuX8qjJhZKqwg2BTv7alj
0ECtQaEzTzsEhzLRWV+8L+VLrXwUobtb9wdLABXLGmf3ZdkA9CQTj9ZHDD+jvrE5
PY/5XIgE1sBd1zI4TaEHKBP1aAS2snp4OdW25RLtNyKQa6HNhAycIinebgsACSJo
SbTpOQgKr4Tm57Jpo6LCpoZvrBnA8TLYDPFXjA3lCRTy7AB5hWrXLpW4KHRJnbe5
fleVA72JwElfYmxVVXWC7B3J/EKPzLj2BJwZp8XsJUQU+vxFzz864lHgwPc4sXn2
2iKrVTOErSP0SMjkghR6f/xMmWJV0A==
=hbws
-----END PGP SIGNATURE-----

--v5s3voismrjid7xi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
