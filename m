From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi
 working
Date: Wed, 16 Jul 2014 22:23:40 +0100
Message-ID: <20140716212340.GZ17528@sirena.org.uk>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk>
 <53C3C77F.7080208@kpanic.de>
 <20140714181338.GR6800@sirena.org.uk>
 <53C525A2.8080609@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MjBORTcaENZKFEO1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53C525A2.8080609-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MjBORTcaENZKFEO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2014 at 02:59:14PM +0200, Stefan Assmann wrote:

> Looking at this more closely it seems to me that it's a regulator thing
> after all. In the end it all boils down to a single register write.
> twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER, 0x41, 0x8e);
> This is a write to the CLK32KG_CFG_STATE [1] register to power on the
> device.

The register description happening to mention power doesn't mean it's
not functionally an enable for a clock.

> I tried moving that to omap4xxx_dt_clk_init() but that won't work
> because the twl core structures aren't initialized yet.

> Any suggestions?

Why not just add this to (or create a new) clock driver for the chip?

--MjBORTcaENZKFEO1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxu1ZAAoJELSic+t+oim9cSUP/R56SoNvaDVff4ZBiXWUTsiH
1w6NPx+Ct8ks/7S2S3UjG4SSd9uyz6jppEasv8pNgylABSXmRTUCob2Ig2aR+G3C
5+zWagVcTicUQps7AEdYYyCwkXFyOh5ywEeKvXt2YxoAHoF/GIhxAteFAO2PTZkw
l6w2LHAL4lBCeltfZq5kOn9QjuJK06IveKjOOjGdPxV73G+TTjbeEtZCYZ+cqPCp
rb/ANoNBgITEbpp5jKHTIF9nInyqgYetOr179ti11I/daDFnH/V4lHy6+YsI3sHN
mv33H5ZHw78JDAhu7oRIdKGvrBrOYsBA+kStoRX7on6vjOF0fSq9Omox+85QOHq9
9eEEi+CKJ9vxm8ox6B8ufOp1Anvucg8CdRsHETIPokm1hNhgowIwDoHKvSD+g8+5
WljU2HECqumkp2lu9jfaAB/ZB4eC8OPSIo5I0lTM+6k90ptIVeCiay0JpNsFwX54
+Ktx94BPmJq449/4D3qYSXV3+Q4vwLFYfvvGsJGsMoDNWlWhb6hb7hOFSH52Nwy+
OFEGbl626S7qpp20pSElZdnysc0H7MIxocskYJg2T091uWIL130lxbqvjypCWyPS
A94v36W9UxDEHbWQLFq3NTiu8SXJC/rjeNhwnVfOEIDAuIx34JvnCoBgyG0BbXx2
BtDRtgID2lFZtFAKfqYn
=lCZl
-----END PGP SIGNATURE-----

--MjBORTcaENZKFEO1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
