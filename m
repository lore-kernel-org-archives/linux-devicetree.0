From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi
 working
Date: Mon, 14 Jul 2014 13:00:51 +0100
Message-ID: <20140714120051.GF6800@sirena.org.uk>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405338655-18415-3-git-send-email-sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2014 at 01:50:55PM +0200, Stefan Assmann wrote:
> This partly reverts the following commits to get the wifi working on
> the Pandaboard OMAP4430 ES2.2.

> 0e8e5c34cf1a8beaaf0a6a05c053592693bf8cb4 regulator: twl: Remove references to 32kHz clock from DT bindings
> d1924519fe1dada0cfd9a228bf2ff1ea15840c84 regulator: twl: Remove TWL6030_FIXED_RESOURCE
> 029dd3cefa46ecdd879f9b4e2df3bdf4371cc22c regulator: twl: Remove another unused variable warning
> e76ab829cc2d8b6350a3f01fffb208df4d7d8c1b regulator: twl: Remove references to the twl4030 regulator

No, you need to implement clocks using the clock API.  Please read the
changelogs for the above commits...

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw8ZwAAoJELSic+t+oim9FesP/1M8M/tkmo7BiJyFbln/VLK+
LbKU4030ddpdd7DS97HkxVHtSGv7ibKDa/WFwLzm0a+B6ezd1JQrETzV53+N7DKE
q4NF9+DJiH/RvTSeaO8mwI2IwY6/Qc04B5SNeWYlcIF5e6v3sWt36jDOc+sQpNya
pr/Eln8wQ3EViDXDZeOubELxl9Do0xeFIfKqvn9QjPDdbflocNi4CqTY1JKPCraS
ehb5boP0BbKG6x584QR6SNfK5osH8KxYo0fT/YTivWBZtFiuZJOaTheRjMxUje95
Suovoq4z69m894QL3FjH9ItrR26ZUfpXtAdg/yKwZ//ZD4kFjr7iblt3HnZmbhod
1NU8EOOypoBbwjJ/Rt4g3NQiIb4V5H1uW6PIHl+U32Oh4h7Dq1Nnh9n79LyihgwF
1JByWDklzbW6ghWyRVV2q2bYKMl6OI/ZFrGt846gbkZ+dts14R4QHrtk/tcv2amK
uYJH1depVKbFIeJo4p3m8jq3Qkbz6bLB3uX5w6f2Qqf3N9L8vyUthBoty+e24/0k
9ra7wgUsMOjhVGbJdbBnKoFeXzQxl8xAbzlic5nwpt1T+Ty6M5fzAsDW72srT615
3pMVmFzS3mfLGoDTZF2cdBMSCEEEG41kDcFlJg3SSBmzwpOQ5FIBPnM0vRf554Xp
W4hVpujgkaYU68F5D4yN
=9Rom
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
