From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Fri, 29 Jan 2016 01:16:03 +0100
Message-ID: <20160129001603.GM4130@sirena.org.uk>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GeONROBiaq1zPAtT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453863463-30515-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GeONROBiaq1zPAtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 27, 2016 at 10:57:42AM +0800, Wenyou Yang wrote:

> +static const struct of_device_id act8945a_pmic_of_match[] = {
> +	{ .compatible = "active-semi,act8945a-regulator" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, act8945a_pmic_of_match);

This seems mostly OK but why do we have a compatible string here -
shouldn't the MFD be able to instantiate the regulator function without
needing this?

--GeONROBiaq1zPAtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqq9BAAoJECTWi3JdVIfQ4vYH/3qOtD2p46jimDLXWmrFSVDV
73raJO0RD5tQrG4WBPXzcEyuuIltS7ntlmcQVzU+3cQSL2FbEUwFKfciG843nFWY
bR0p7jcLuTc49r2HpDgytkC8K81pckjgSDq1HqGGy00u7UKj/v+52ULMOpfqr2Wr
Wd1nJNKL0Qw6HDnjWzyRHKE5HbEQ/UObRhHGOawTy6POhJIOnhOSyDGPP8dCsdCI
lnr3/VSlw+7KXQfziZ/dKuWUz9upcsi9xDw2UFROCUMDMtH1GHSzdPMxTMHh7qGz
D+vqMfOVJzR1UTgPVwvmpftHz7A4i4HT3BPq7VCQda8FtiX/UAzXx4EoUI7MFDQ=
=P57e
-----END PGP SIGNATURE-----

--GeONROBiaq1zPAtT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
