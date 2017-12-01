From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 13:01:37 +0000
Message-ID: <20171201130137.vqzt5lecjecsd5ei@sirena.org.uk>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="crz6jgqv3hwkwncm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--crz6jgqv3hwkwncm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2017 at 04:58:16PM +0800, Erick Chen wrote:

> +static const struct of_device_id sc2731_regulator_of_match[] = {
> +	{.compatible = "sprd,sc2731-regulator",},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sc2731_regulator_of_match);

This looks like a subdriver for one specific device that can't be reused
with anything else as it's specific to an individual device so I'd not
expect it to appear as a separate thing in DT - the way Linux splits
things up might not map well onto other OSs and may even change in
future versions of Linux (look at all the audio drivers with clock
controllers in them for example).  I'd expect the MFD to just register
the subdevice without needing it to appear in the DT.

> +subsys_initcall(sc2731_regulator_init);
> +module_exit(sc2731_regulator_exit);

Why not module_platform_driver()?  Deferred probe should sort out probe
order.

--crz6jgqv3hwkwncm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlohUrEACgkQJNaLcl1U
h9AHtQf/WUgHJohdjoDi7cSttUeVod4eFiP9k9nkEoN9w3Obwe0T9DQHnk6w3kAo
YhjKkClb0mKP/W2fr3asGeZCbYm2fcRqmjZZRCATlvskPneXYWwTLXmEh3oSqvS6
k4hdNFdCj1MbYzsAWJoaqgZJ/UHosiSYdkXRYEocPWgKEZxaTaW/PdqMChFeWTY4
V6D97WF31L7/KFYUqgTkhdtd2oJJgzp/AyqztEaTMwMtVQDsVmtbGq4WFYbq9h5t
HsYpKIQSd3dHYq92QCbMIUJCY5oCwyYK4CjkUJlMm8p9pM+VKWBChMPhwVtPOndA
T+bQDh4jzCtQarr6tvYI2crWJHaL7Q==
=lU7a
-----END PGP SIGNATURE-----

--crz6jgqv3hwkwncm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
