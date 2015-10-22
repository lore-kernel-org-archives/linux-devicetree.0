From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] regulator: arizona: Add regulator specific device
 tree binding document
Date: Thu, 22 Oct 2015 13:44:49 +0100
Message-ID: <20151022124449.GH8232@sirena.org.uk>
References: <1444916828-8965-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1444916828-8965-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444916828-8965-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2015 at 02:47:07PM +0100, Charles Keepax wrote:

> +This document lists regulator specific bindings, see the primary binding
> +document:
> +  ../mfd/arizona.txt
> +
> +Required properties:
> +
> +  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
> +    as covered in regulator.txt
> +
> +  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies (wm5102,
> +    wm5110, wm8280, wm8998, wm1814)
> +
> +  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (wm5102,
> +    wm5110, wm8280, wm8998, wm1814)
> +
> +  - SPKVDD-supply : Speaker driver power supply (wm8997)
> +

I'd expect these to be on the MFD since they're (with the exception of
AVDD which supplies the regulators IIRC) not part of the regulator
component of the device and are core for bringing it online.

> +Optional properties:
> +  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
> +
> +Optional subnodes:
> +  - ldo1 : Initial data for the LDO1 regulator, as covered in
> +    Documentation/devicetree/bindings/regulator/regulator.txt
> +  - micvdd : Initial data for the MICVDD regulator, as covered in
> +    Documentation/devicetree/bindings/regulator/regulator.txt

These are the properties for the regulator itself.

> +++ b/MAINTAINERS
> @@ -11381,6 +11381,7 @@ W:	http://opensource.wolfsonmicro.com/content/linux-drivers-wolfson-devices
>  S:	Supported
>  F:	Documentation/hwmon/wm83??
>  F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c

I'd suggest moving this to a separate patch which adds all the new files
together to make it easier to merge things.

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKNpBAAoJECTWi3JdVIfQgw8H/0dzmffT2T5o0Myh9yFG2RVH
4m5e+EvREDRm9p3uA9U2lE6WnJpnamvE7Y69H2bJO/xfN6yfxPilgwZcKKGOjWri
AsV8JSR8Y/5jK6z1Q9+GULG+cDVHuoBc8gJiFP4K9rvGvgzilLU0n51ZEiVSqVgX
EzCqkROPjI70a+yacbhczwPjezHigXxQYH5AkWxjuiGCWZYBBAHcofbWyPSrPaa1
rLz9swuqyMjrWYOGMeDz4eQArkBaJYV6e5UF22FPY0LJZ1CUkeT1htdAkmzfW/FV
BuhEeB3rlcScBExk4n902g49zfs4kAJa6+jySBQSTApe0uVts9nvflDaqJJeWn4=
=vYs3
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
