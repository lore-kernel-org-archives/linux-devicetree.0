From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: max77620: add support to configure MPOK
Date: Wed, 16 Nov 2016 12:16:44 +0000
Message-ID: <20161116121644.4cfuapcqcsqokr32@sirena.org.uk>
References: <1479297161-7705-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="54scu5ljx65iqrk3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479297161-7705-1-git-send-email-vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, svelpula-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--54scu5ljx65iqrk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2016 at 05:22:40PM +0530, Venkat Reddy Talla wrote:

> Adding support to configure regulator POK mapping bit
> to control nRST_IO and GPIO1 POK function.

This leaves me none the wiser as to what this is supposed to do...

> +	if (chip->chip_id == MAX20024) {

Please use switch statements so we can add new cases without rewriting
everything.

> +	ret = of_property_read_u32(np, "maxim,power-ok-control", &pval);
> +	rpdata->power_ok = (!ret) ? pval : -1;
> +

Please write normal logic statements, people need to be able to read the
code and understand what it does.

--54scu5ljx65iqrk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYLE4rAAoJECTWi3JdVIfQ2rcH/2etzGzNAk+xVL8m4WZpDmpe
0Wpc3itGXPf8zHANhCprig2nruVqU7cy21nlEzA/O8y5/Fw23LgIB7mH2zzeaHk/
0C4EwH9D+axt9sFFxwrrZpWWSzBBOXgbvOO0ax1sN2Wh8Etn+f9ELFZuWnS+gy6W
M2/qExbJAmsT/AavvSOZSBoNVPfUJRKYFd1t1wlsninYjKu8ctnzH1g9iHf5XWHw
hn8fZfo+VZTnUb1RYFLLSpoHntVCasFJ4lEjeHcGtvAH010QNvntirTVrPVGUmso
UcFFU2yroCAGC8+KW5RHqJNPJjjDHswaemL0rQRU1bgemJh+aPt366S3nDHFMlA=
=6qVd
-----END PGP SIGNATURE-----

--54scu5ljx65iqrk3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
