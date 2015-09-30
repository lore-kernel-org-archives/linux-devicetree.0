From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: pmic: Document Hi655x pmic driver
Date: Wed, 30 Sep 2015 18:39:21 +0100
Message-ID: <20150930173921.GJ15635@sirena.org.uk>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
 <1443611111-3196-2-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HkMjoL2LAeBLhbFV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443611111-3196-2-git-send-email-w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, william.wfei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HkMjoL2LAeBLhbFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 07:05:04PM +0800, Fei Wang wrote:

> +Hisilicon hi655x Power Management Integrated Circuit (PMIC)
> +
> +hi655x consists of a large and varied group of sub-devices:
> +
> +Device			 Supply Names	 Description
> +------			 ------------	 -----------
> +hi655x-powerkey		:		: Powerkey
> +hi655x-regulator-pmic	:		: Regulators
> +hi655x-usbvbus		:		: USB plug detection
> +hi655x-pmu-rtc		:		: RTC
> +hi655x-coul		:		: Coulomb

...counter?

There's no documentation of the bindings for any of the above devices or
how things are structured, you need to provide binding documentation
which is understandable standalone.  None of the properties are
documented, nor is the set of regulators supported or how this is
structured.

> +                coul: coul@1 {
> +                        compatible = "hisilicon,hi655x-coul";
> +                        interrupt-parent = <&pmic>;
> +                        interrupts = <24 0>, <25 0>, <26 0>, <27 0>;
> +                        interrupt-names = "cl_int_i", "cl_out_i", "cl_in_i", "vbat_int_i";
> +                        battery_product_index = <0>;

For example, the "battery_product_index" property here is undocumented.

--HkMjoL2LAeBLhbFV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDB5IAAoJECTWi3JdVIfQuO0H/0M/kWh41VA1rb1m+7boZOEw
3pfopLMbJR57H/9HQCqA/LFlei88/uY9omUgZwL0D4QI1PY4GJiifI9rvi+L7DRP
aIadlfBo3bz3WURWK4iZ1w5ipQwYJsLtxLDfETRZeeG0mVAnqx0A1YY+0caTlVGi
Yo3qXDbnVdDB4NyZWt65Iq4b7ULgdTQviDa3zU43kAlnjK9hSCOgg9k2j+1V5qOm
nlWqbKblnCpyjZ0OsBev0ubp8lRySBFkKC08gkgekNuqHkixPGv3TrIULwOQJAy9
LgexOUFXZ4JCLSutCZdNId55n8GNv0e5AMMnLO7UKRqGifGForBUF0XtzYZmRXU=
=Fgaz
-----END PGP SIGNATURE-----

--HkMjoL2LAeBLhbFV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
