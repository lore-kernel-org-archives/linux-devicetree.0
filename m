From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] drivers/rtc/rtc-as3722: add RTC driver
Date: Tue, 17 Sep 2013 12:43:38 +0100
Message-ID: <20130917114338.GW21013@sirena.org.uk>
References: <1379400338-20704-1-git-send-email-ldewangan@nvidia.com>
 <1379400338-20704-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zGa1rFMfQatMxgJk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379400338-20704-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, florian.lobmaier-QzQKeY2x7wg@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zGa1rFMfQatMxgJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2013 at 12:15:38PM +0530, Laxman Dewangan wrote:

> +Optional properties:
> +-------------------
> +ams,enable_clk32k_out: Enable CLK32K output.

This looks like it should be being supported via the clock API?  This
sort of thing is one of the reasons why I'm not too keen on representing
the MFD structure directly in the DT.

--zGa1rFMfQatMxgJk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOEBmAAoJELSic+t+oim9I0AQAIbpSzwHF9eepbxJXqKUCUhB
aWROqPd7Dyj65kx4iU0wOlyiYl1f+RhUliFC6q6k+q7us1gjdOGJbThFdSaV/dNA
JehexnH5/Pyd24KEQsVGWcP3FuYJPSf63XScbzanrfEKUCsypiSAdB0KdxyJU6AT
Ty4cAREnpyEjnKnjHGRK/4Qrrt4gOsZMjFQffkvky2Vp62s81SztC1EV2G6D9u1O
QR4E/z5dqBUhUyFGqpJyBJsxV6ZUcykd5TI0pzbFbYHqqsuKwcw6Y47vebUHTreA
1keChsQYoJbh1mb5IuBEXgkrR7afccNiLvYr15MX7nJH2EugJ6LhxlsXzLtwRd1E
jDVf/BRfHHA4hTEP2e4QCDEHigqslwS4JXL2AlaTM5TgRPZWS8u0DZzgvU4Gl/2K
D30b0DXWtg03ofT/PebIvAx+KHe+kdSFz9DRc7VR0Bf7dVnZA/ckcFdjAxntsRo/
iJ/WRWRIYrFc9Kj93Q7pfBgkHhDAxF0FJWBMkWj/8jkSFufO3H+5qYMugmQaeM17
OC2ebPcy03ML9fWmX9rYMKSG9EDvpanwsk9K5EY8/Nj39FR9ZX4l83IsTZrjEB+B
udBRxYzhlpcvutIVEzPEQo7OB5hWj0Ftd2IPXWpWiN+svuE2mL6XJkFHz9j5cYjg
aBMssUYJt0aE10yH3QYH
=Ktbe
-----END PGP SIGNATURE-----

--zGa1rFMfQatMxgJk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
