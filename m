From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 10:33:58 +0300
Message-ID: <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
 <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1993245879=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Karl Beldan <kbeldan@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============1993245879==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8CV4ldK6TAC8usDh094u6c9uRENcaHT6v"

--8CV4ldK6TAC8usDh094u6c9uRENcaHT6v
Content-Type: multipart/mixed; boundary="riLT71sAEA3UwnuCWSu7iGsjxChdInGcO";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Karl Beldan <kbeldan@baylibre.com>
Message-ID: <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
 <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
In-Reply-To: <65fde145-0820-794d-d345-621f66cdacc0@ti.com>

--riLT71sAEA3UwnuCWSu7iGsjxChdInGcO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/10/16 10:12, Sekhar Nori wrote:
> On Monday 17 October 2016 11:26 AM, Tomi Valkeinen wrote:
>> On 15/10/16 20:42, Sekhar Nori wrote:
>>
>>>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.=
dtsi
>>>> index f79e1b9..32908ae 100644
>>>> --- a/arch/arm/boot/dts/da850.dtsi
>>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>>
>>>> @@ -399,6 +420,14 @@
>>>>  				<&edma0 0 1>;
>>>>  			dma-names =3D "tx", "rx";
>>>>  		};
>>>> +
>>>> +		display: display@213000 {
>>>> +			compatible =3D "ti,am33xx-tilcdc", "ti,da850-tilcdc";
>>>
>>> This should instead be:
>>>
>>> compatible =3D "ti,da850-tilcdc", "ti,am33xx-tilcdc";
>>>
>>> as the closest match should appear first in the list.
>>
>> Actually I don't think that's correct. The LCDC on da850 is not
>> compatible with the LCDC on AM335x. I think it should be just
>> "ti,da850-tilcdc".
>=20
> So if "ti,am33xx-tilcdc" is used, the display wont work at all? If that=
s
> the case, I wonder how the patch passed testing. Bartosz?

AM3 has "version 2" of LCDC, whereas DA850 is v1. They are quite
similar, but different.

The driver gets the version number from LCDC's register, and acts based
on that, so afaik the compatible string doesn't really affect the
functionality (as long as it matches).

But even if it works with the current driver, I don't think
"ti,am33xx-tilcdc" and "ti,da850-tilcdc" are compatible in the HW level.

 Tomi


--riLT71sAEA3UwnuCWSu7iGsjxChdInGcO--

--8CV4ldK6TAC8usDh094u6c9uRENcaHT6v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBH7mAAoJEPo9qoy8lh71aPoP/R7taU+qck1ai7zVBzi2SCh5
Mz4JRUe7JN54wnyl4q4FXOI17+RzuXFA5KYa6z05uJXMYkGjMUT1t5Q2fbteV8FN
QWFv0+zFK0dkuNf/Hy22wVGmbKfvCezimX718kcwnke1uJ6q+SljPRjIS3GTptPe
Zf/0JLv8/LTMQpctF7/ZrL59sN5EaLpIvvnuZb7qgFuxd+AS+DxwRxmsXql0rFrM
i/UM4HbfTIJSmwfJtu45bf2C/RN+0y25FhGolJPTmGhSPBLRu4YxaxOu/C7xqTcB
bj2ZL2HCcjmVsw3HFWjqIQihqMxAfDZzPQg6U2ujvEuD/dUVI5fbVNny42wX/gu4
W+uVuKsXQCTI2SQbQksikxPT9F7jKup+7zLPi+Mdyg6CkgTKrihHVr7Mb2Yrn1kk
DCggabsDtZxndocC1Gfc03hhBBMI/1v3pXojpj0gC0DcH8rxJX98lJKhJu1ypbJn
Xgj+pjbYXHy7w30oFdIY6vT4pP89bYI1V1kDlu8awZsYVwZpVSUYa5bdqlzipMWx
3djcTYSsEdigZdRUhy7xTWt9kot27OWjO29wTNeI/RsmWK00hIWhoLhmbNZ6isch
Lavj76CKvf1IzgkxbsJqRSjbzewGLyO/lYQefxcORS0C8Eqv9QP9hEtTbnWIlgPu
E/tw+I/qajn6G/aWpsV9
=t/RY
-----END PGP SIGNATURE-----

--8CV4ldK6TAC8usDh094u6c9uRENcaHT6v--

--===============1993245879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1993245879==--
