From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi
 working
Date: Thu, 24 Jul 2014 18:39:26 +0100
Message-ID: <20140724173926.GK17528@sirena.org.uk>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk>
 <53C3C77F.7080208@kpanic.de>
 <20140714181338.GR6800@sirena.org.uk>
 <53C525A2.8080609@kpanic.de>
 <20140716212340.GZ17528@sirena.org.uk>
 <53D12044.1060500@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xWiEbTquLUstXc+R"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53D12044.1060500-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xWiEbTquLUstXc+R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 24, 2014 at 05:03:32PM +0200, Stefan Assmann wrote:

> OK, here's a first attempt to add a clock driver for the twl6030. Let
> me know if this is going the right direction and I'll post a proper
> patchset.

Looks reasonable to me, though I'm not a clock expert.  Few comments...

> +static int of_twl6030_clk32kg_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Shouldn't need empty functions.

> -	ret = regmap_bulk_write(regmap, twl_priv->twl_map[mod_no].base + reg,
> -				value, num_bytes);
> -
> +	if (num_bytes == 1) {
> +		ret = regmap_write(regmap,
> +				   twl_priv->twl_map[mod_no].base + reg,
> +				   *value);
> +	} else {
> +		ret = regmap_bulk_write(regmap,
> +					twl_priv->twl_map[mod_no].base + reg,
> +					value, num_bytes);
> +	}

Just always use regmap_raw_write() - for single byte values there is no
difference anyway, bulk_write() only makes a difference if the values
are multi-byte.

> -	ret = regmap_bulk_read(regmap, twl_priv->twl_map[mod_no].base + reg,
> -			       value, num_bytes);
> -
> +	if (num_bytes == 1) {

Similarly here.

--xWiEbTquLUstXc+R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT0UTLAAoJELSic+t+oim91cQQAJIseExmY04S92HEJhDEH+Eu
Iv23h0XEiDqCvK/Jv6gBS7BqpigaQIO+/dfaO8cpTu98E3PrhU+N+tfl8UTH/P9+
CQKMoioiLf3AwnKsCG07lzCp3nCjt38ajz3s5+38hgGXABxVY6rpXBFiB6xIaF02
txQGtsXXm+31HlvGDSXPvriPiVONo6R9/UiyEYwxzmLx7tNz5dodcjH2Wr4ITHoN
3GBgXQw08eNgEItFtMy74vKKdVQAJuwLoqBiIj6UOHciiJ/FyNTDBWOb1i+4o39q
B63g9IJI879HlUS+amerGWJnhZzqxKPGensAr4WG3bZTQZA5Snj92jyTzaC/DixV
/r/HfLBjUPiTKlmpz5PJy3hWtfrZNGlWAwGXGPXOPWXlHdYi3ImKZxgZc8m037Ap
U++tB6DAQ7LcDim/yPJ7PfMLMn4rQZrExA8xu3d7lKiAPSLIBLuYG0Z288WDg5EC
DhNIt6guUpvp9JkXpKmc5h2wyLwdVeqizqYv4M8R16LLfMt17mLZ2rjXHl/2fVvw
mjDcK4skMiWqy+CQ0wwuq1KgLL0N0qkvxFAt75JREpMWFsiZDJIkSew90Jrd9Qw9
69sTOjZCmKCVovk6AH0hggfUsFDR49smmViFUipPQ8YgjnB824zrYMG1kfELuGGe
p6XP77E3FOVACGM3rR+M
=Zv1x
-----END PGP SIGNATURE-----

--xWiEbTquLUstXc+R--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
