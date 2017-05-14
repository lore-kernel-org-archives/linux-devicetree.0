From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] regulator: Allow for asymmetric settling times
Date: Sun, 14 May 2017 19:16:52 +0900
Message-ID: <20170514101652.waoc5fhjzpd2emoq@sirena.org.uk>
References: <20170501183715.35375-1-mka@chromium.org>
 <20170501183715.35375-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ivad277dvdv2q3fs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170501183715.35375-2-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ivad277dvdv2q3fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 01, 2017 at 11:37:15AM -0700, Matthias Kaehlcke wrote:

>  	else if (rdev->constraints->settling_time)
>  		return rdev->constraints->settling_time;
> +	else if (rdev->constraints->settling_time_up &&
> +		 (new_uV > old_uV))
> +		return rdev->constraints->settling_time_up;
> +	else if (rdev->constraints->settling_time_down &&
> +		 (new_uV < old_uV))
> +		return rdev->constraints->settling_time_down;

It feels like we should warn if the user mixes specific up/down settling
times with the more general property, can you please send a followup
patch adding a warning for that?  It's not exactly obvious what the
precedence is and may do the wrong thing with an older kernel or
non-Linux OS.

--ivad277dvdv2q3fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkYLpMACgkQJNaLcl1U
h9A+IAf+JaXIIGyP2AVYmoGOHmEbQOJsucNpCBGUaM5asCtjU42IMMyRMSz6s+pU
JfGF4gHmIO7B/GuBiUiHwzB3Byzx+NBXuPxRS5jMqHmBCBWv5SIzm31fcchHf4iO
vXfLx4y9nipoUedG18CkYO8S1RwM4LiSgR7jkIF50cI3xbGszirgtM1iC5rKJrDg
ioLV84bJw5A5J+d5JRUX1iTIMrtQ3ute24Ogh0DFFAjEIaqXs//0V8+DIelv+PCI
GaZ9CMsP/5JeGwYGtLkJSo+QXOQUn0Y4SeiZEbiUxY5zqFrOpdfBMvC50dzWSrfF
FtRPQRf3r8pXg+PbDNRRTSadTiwswQ==
=lXaH
-----END PGP SIGNATURE-----

--ivad277dvdv2q3fs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
