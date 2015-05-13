From: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx5: Add dts files for USB armory.
Date: Wed, 13 May 2015 10:53:28 -0700
Message-ID: <87vbfwe547.fsf@aikidev.net>
References: <87h9t6i40r.fsf@aikidev.net> <20150427081428.GC9231@dragon> <87y4ldnvqd.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87y4ldnvqd.fsf-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 2015-04-27, Vagrant Cascadian wrote:
> On 2015-04-27, Shawn Guo wrote:
>> On Fri, Mar 27, 2015 at 01:23:00PM -0700, Vagrant Cascadian wrote:
>>> Add support for the USB armory board by Inverse Path. This board
>>> features a Freescale iMX53 SoC, 512MB RAM, and USB OTG operating in
>>> either peripheral or host mode, and 5 GPIO pins.
>>>=20
>>> One .dtb is generated for operating in peripheral mode, and one is
>>> generated for operating in host mode.
>>
>> Is it possible to ask bootloader to patch the dtb instead of maintaining
>> a new one for just changing one USB property?
>
> It does appear to be possible with u-boot:
>
>   load mmc 0:1 $fdt_addr_r $fdtfile
>   fdt addr $fdt_addr_r
>   fdt set /soc/aips@50000000/usb@53f80000 dr_mode host
>
> Since the user would have to manually select the appropriate .dtb
> anyways, it may be reasonable to drop the host_mode.dtb and rely on the
> u-boot to tweak the fdt on boot to switch between usb modes.

Given that it is possible to set from u-boot, I'm wondering if it
wouldn't be worth reworking the patch to only generate a single .dtb for
now, and revisit the options for switching between USB host mode and
peripheral mode later?

live well,
  vagrant

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVU4+YAAoJELeLgtSBS5G2XaMP/A5Hqy5Mfu963tC2Bn1Zmb5m
FSLc1kaWf3ILFyIv8hiYIh2NRQpCIU+Jd1kMKCiTufcyUk3kc1eiBuLdIRqjfQ5T
IiZEZFh/edHLLmEMGoKxwchOTBhNo1KctoV6BbFt2nJXS9NFRTvn/Da8chWtGIul
cFkIDZsoTcZ7LdLFEKuaHYsCIL/eHz/9RvVbFUu6ZTzOzOkBqzJiGTvl8OGCeZ2J
DQfYOyUmf+4XijzfpqCHzPoPgzlTmy1pBHeFQQ4VD+ajXmSuub3iwrfR/fDIveq4
TblrWeXIrPd0gXJ+/exl0BQw7QQ3JWDnAvMfwL8/MUncWE2MlqBWoO9IEfVYT5D3
faqltfD14XFNvjkzJyShSs9l9/BHmGWdFElTy8Ski5Dku15as7V/5BqGcRLH5k5w
4pFzzUgW9ryF16omc5ENhGcUjf7VpVqWQ1i81INPJAfiqsq7ng9PNlROYUn1kxc7
XHbieW7arAGujbKsaklXs6rrL8Uj30FGVoePLYwNeKkqV5XHaw5gZpPr2CBXIjoT
57+IQ5U+eR2ZRYzjTt5dGMfXFum1FdoLn0eIW5eHUfW3j8ZZxQEv3oJ+eKPMVeBT
qrbL7GvgVgiP15XJONS+uUf2zsVjTk7o+lgiXRHs3/qkpQPzxUELBNrehj3LEd8G
uOozT5kG3WK1lkhbDMH+
=U/Yk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
