From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Tue, 11 Feb 2014 12:06:45 +0000
Message-ID: <20140211120645.GH13533@sirena.org.uk>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
 <1392118632-11312-5-git-send-email-mark.rutland@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392118632-11312-5-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2014 at 11:37:09AM +0000, Mark Rutland wrote:

> -	pl022->clk = devm_clk_get(&adev->dev, NULL);
> +	/*
> +	 * For compatibility with old DTBs and platform data, fall back to the
> +	 * first clock if there's not an explicitly named "sspclk" entry.
> +	 */
> +	pl022->clk = devm_clk_get(&adev->dev, "sspclk");
> +	if (IS_ERR(pl022->clk))
> +		pl022->clk = devm_clk_get(&adev->dev, NULL);
> +

I'll just have a bit of a grumble here and point out that this sort of
stuff always worries me with the convention of using nameless clocks -
it causes hassle adding further clocks.

In any case you didn't CC me on the cover letter or any of the non-SPI
patches so I'm not sure what the dependencies are here (if there are
any), does the series need to go in as one?

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+hJSAAoJELSic+t+oim91yYP/i6TIxEGf0ABEfPFFPJLpdO1
BPuWPqs4ZpdkO1dG7O5We2jjCcMwxF3tc/wz+noq2t81ksR/jClgjqyWBzs3wQDo
yA/+S5x0bq1ytegLEM3REmD63kp2VuLxcwJNXFbh4dmEv+JpWOv60JHDgbk0Bb+9
cnOZVwXjQ7lKGf5wVa1sZ6aQlRPhV6W1pExSucpMfoscMLTTUxyS6qezvqpnhYBi
4kUO6bQtcnYo+8y0QDG1KZs+hmUFRZD0k4I6G8rY6oUrcego4z+4e2dVNGhD1Dcc
GkcTjn+ZwAlNzdFswBHvAFP5PUDjRPqR+24yEqAz9uldFOjuU58izf6GW/wXrtMZ
DqOOY1WEwIOSkqt7Jn7zko6ZVSV6MkZTLTVNrGmuJzYAO8MCPt3/ac7tE/nRqt5R
x1WDKtLxTzW+vlXgkPOvfJC7EG8MEGx9psDKHNR4v9PEmZrCegtry2jnSQZIxUjV
3hN3gDYs/1/8D9GPzI1juMnUP/l+LzAKSKPnItQ08eYZaYpCJDUl8qDS4AgUBMer
7Dda9VeeGHnaUG3mMHtmDMClroNz/yGbi5jntnfrZiMl5ZKsFx016FPrddI5udnY
vB8KpovBzgSRZ0kECCLFIaEICwbYqjD1R28yRoQFX99n3HLxKN+gw+0xjdXt5ok3
xMOSIa5AYE1P83T8Zmzw
=4nsc
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
