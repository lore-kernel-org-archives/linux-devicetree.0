From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/18] ASoC: sti: Update DT example to match the driver
 code
Date: Thu, 21 Apr 2016 16:57:53 +0100
Message-ID: <20160421155753.GS3217@sirena.org.uk>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-10-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NNVaupgJYQhsR2bD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461236675-10176-10-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NNVaupgJYQhsR2bD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2016 at 12:04:26PM +0100, Peter Griffin wrote:
> uniperiph-id, version and mode are ST specific bindings and
> need the 'st,' prefix. Update the examples, as otherwise copying
> them yields a runtime error parsing the DT node.

I'm not sure what connection this or the other ASoC documentation update
have to the rest of the series?

--NNVaupgJYQhsR2bD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGPiAAAoJECTWi3JdVIfQzjcH/2KCqeWG5MKtRq7x2GcPv0b7
cuCJNEjrU3naBZG+gm0GkN6vWGgakhh110zF8mm5LfrObFLBKqVsFUAaMQxjRHBq
8r6RWxD1j4eo67EtPkeVMRjnf042mLCsg/EjPzQ8bfVkPH8nFZ96Mgs9DWR2xbnz
AWbl9ugXc0aj8eYc/zl3B8Ax7FhtLCJEaWVWD9idQAqzUURlc5ol6n2ms+3+p+Bp
xT5XwFtKQO2RGw4VXv8ogg0cY0tnsdKkyFGaRjdNP70g146UstxAqLHT8zYQh3UF
Qs4ltUOSd0x0BKOms2ru1j+Ro4vpYBBpxT2C9AlVjSvxqaK65Zi/Grg9rhUcbOU=
=enfe
-----END PGP SIGNATURE-----

--NNVaupgJYQhsR2bD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
