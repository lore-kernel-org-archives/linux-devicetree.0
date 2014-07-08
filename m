From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl: qpnp: Qualcomm PMIC pin controller driver
Date: Tue, 8 Jul 2014 09:52:47 +0200
Message-ID: <20140708075247.GP30458@sirena.org.uk>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
 <1404745893-6379-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404745893-6379-2-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 07, 2014 at 06:11:30PM +0300, Ivan T. Ivanov wrote:

> +struct qpnp_pindesc {
> +	u16 offset;		/* address offset in SPMI device */
> +	u32 index;		/* offset from GPIO info base */
> +	u8 type;		/* peripheral hardware type */
> +	u8 subtype;		/* peripheral hardware subtype */
> +	u8 major;		/* digital major version */
> +	u8 num_regs;		/* control register count */
> +	u8 cache[QPNP_NUM_CTL_REGS]; /* control register cache */
> +};

The device uses a regmap, why do you also need to open code a register
cache here?

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTu6NMAAoJELSic+t+oim9saIP/0oLJNJPxAmPXzslNwnalws1
dH6/C01z73n6Ly8bMLB5ClNOO8257cYBDnTc8Rl6Mfcg7IfWUm8JgDs7mmY2Fudc
poGjYZvQo54FEbq7Bqtrg/TzsG7sWIoW6KtldO5DShEGrVeiegrkeKcahpPp9UJq
r7/sJXe/jVeXzh/bkhuqWkIt7C+7LMJ4VsoMLeoddcDoPE1magXMQIDHnTeja43H
qFnq4U6qMUEe84PKC3zFYaUstaq6O9AGzZIUOvdSDw7PNsuWMopOxJBiqnvaf8Sa
34CIFocHmHiQDxo9j28+R22MjSnqI6fwNsRne9b0aQGcBBHubI7erUOBFtsTtYaQ
jACm/srVFRPMq9f4L05b4GI8sp9szW+0wjYBPNWTdAze5cLeeoYAMVaEnqZbcE+9
PBfiekB5Ohj8yaeQBu2I8DSxkXzQbfX5eK8bQ5y1qJf+qOHGwLIv+GQxD1aOcuAo
ifV5YvZtwRptn3eKTjbcCxnJuF4w4qd36ZXhop676WgnRGRAGEKxD5unbTPTFSqy
oB6uZdUymUrQg5fJHXUsdFzMavRTqOQOWnwhttbwsGjkhY1SdLHLdiwozz7w4W8+
wl9qstyMXezvvc8GR3A5qlyuIm0Fu+f9FPWkQLVaLomlYN/f40fGacySKD02UKhj
TYGrx9U/LjbQAwMfH4EY
=7nrv
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
