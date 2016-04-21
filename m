From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/18] ASoC: sti: Update example to include
 assigned-clocks and mclk-fs
Date: Thu, 21 Apr 2016 16:49:33 +0100
Message-ID: <20160421154933.GR3217@sirena.org.uk>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-11-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L0pirLHWQnJmYWnZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461236675-10176-11-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org


--L0pirLHWQnJmYWnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2016 at 12:04:27PM +0100, Peter Griffin wrote:

>  		clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> +		assigned-clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> +		assigned-clock-parents = <&clk_s_d0_quadfs 2>;
> +		assigned-clock-rates = <50000000>;

This may be true for the particular system you're looking at but isn't
really relevant to the device.

> @@ -133,6 +139,7 @@ Example of audio card declaration:
>  			/* DAC */
>  			format = "i2s";
>  			dai-tdm-slot-width = <32>;
> +			mclk-fs = <256>;
>  			cpu {
>  				sound-dai = <&sti_uni_player2>;
>  			};

This one is more relevant though I'm still a bit concerned that there's
an expectation that the examples can just be pasted in...

--L0pirLHWQnJmYWnZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGPZ4AAoJECTWi3JdVIfQxU8H/1uVogwvvT/lQB6UkGT5Q+8a
MRFp7Hfsit+g3v2vvPbypesWHaMBb6sluraziRW/Z3OruTdOugetp5vkWios415t
3e+CAaBlM+yFzM1BGchqgs90d7KcXTOO943FFI0eHJBHwFBOEWd7mcPpjs0jIQiB
+tSvlZfFNy3YxfqytUGc9xAgFdoELr2ABdZg2CIHgj8GtDg3WBresNhoJetwd08W
CVxstIS64Pua8EJZu40FxG/KAJ4kIDPEou+TmsiWSmipoisYoXsVLtYlC135bi4u
WWqhJR4j352nx+ckHCvobOsIKLEpvbHl4ZH3UcRoXi4XlDOvIqjgG6Fn1dPmI/4=
=dbpi
-----END PGP SIGNATURE-----

--L0pirLHWQnJmYWnZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
