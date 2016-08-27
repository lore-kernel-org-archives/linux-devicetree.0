From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun9i: Add missing #interrupt-cells to R_PIO
 pinctrl device node
Date: Sat, 27 Aug 2016 13:59:25 +0200
Message-ID: <20160827115925.GP3165@lukather>
References: <20160827075950.26524-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kERJ49nCKmnv470N"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160827075950.26524-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kERJ49nCKmnv470N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2016 at 03:59:50PM +0800, Chen-Yu Tsai wrote:
> The R_PIO device node is missing #interrupt-cells, which causes
> interrupt parsing to fail to match it as a valid interrupt controller.
>=20
> Add #interrupt-cells to it. Also remove the unnecesary #address-cells
> and #size-cells.
>=20
> Fixes: 1ac56a6da9e1 ("ARM: dts: sun9i: Add A80 R_PIO pin controller device
> 		      node")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kERJ49nCKmnv470N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwYCdAAoJEBx+YmzsjxAgSpQP/RHqz60wrRFRUFOuFZ1kzFUU
nykeMV+aCUrCTz7bbqi1AOaOu3jqIhB6LM4Gm/6oKi+DUVYxLv2c0KfOdwHte9LF
vitk0/n16PkmMg/1WtAt3pzQlkUhqRTVf5DEXLTUDustP7zOOLyZEdi4y0U0AR9U
PP617QbeK90YEusc6r4qWSX0alJMfKraAX+1uXbkq1OZknWhwMhXz35gcV8Msa3E
gKa4YHx+CuI/PCv81BF32nmTyJjQvULLGrzkLbqCUGAxfSaZaF+05G0DrnEMAMpt
wTmxP31RRAN1rtnmsCk1qSoL8WkL0Guz6Mt+3okJHFyHJiS9cKP56T7FeIIcueuC
vk9KWwv9TwiP+NQp/uV5I36ioOhQYINDL5GGdLtZZUq9IcG6Hjk8OV76NFCw6opB
r6nYaGWYalZl6jsMZJ3Jm/Fbl1bKJ/WddTY9GyToFDr/Yozevz8x7duO7KxTvVaO
qGPo4ml554tNqWEwqmHRDw68ApCmJSaPiqGH4U5scftVZQbmx+VljkQFpWl3rkAa
Pdw2sG3lcvoYEc+jAsjK5qHQQCQQE1ynJX4Y0QWmb9ZbOtcaOeeY0AmmEHiEnRGp
rDGbVF4CWcQJakAY8Hb/CI4XGRqduX2kyKZ6kgwAIlE/ozTk2LyzuEmo8W1B2Bfq
bUXku9t2scCoPd+oSjMV
=sc0p
-----END PGP SIGNATURE-----

--kERJ49nCKmnv470N--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
