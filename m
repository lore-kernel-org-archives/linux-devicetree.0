From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 15:29:23 +0300
Message-ID: <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
 <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com> <4975084.EGQPv58AK6@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1530075966=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4975084.EGQPv58AK6@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan@gmail.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============1530075966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="l6bSklRD2LiOxRSLtCQjIH3TSIMxR933q"

--l6bSklRD2LiOxRSLtCQjIH3TSIMxR933q
Content-Type: multipart/mixed; boundary="qJh569mBsJEcvuhkT5OprdgUlUGd5FrL9";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Karl Beldan <kbeldan@baylibre.com>
Message-ID: <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
 <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com> <4975084.EGQPv58AK6@avalon>
In-Reply-To: <4975084.EGQPv58AK6@avalon>

--qJh569mBsJEcvuhkT5OprdgUlUGd5FrL9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/10/16 14:40, Laurent Pinchart wrote:
> Hello,
>=20
> On Monday 17 Oct 2016 10:33:58 Tomi Valkeinen wrote:
>> On 17/10/16 10:12, Sekhar Nori wrote:
>>> On Monday 17 October 2016 11:26 AM, Tomi Valkeinen wrote:
>>>> On 15/10/16 20:42, Sekhar Nori wrote:
>>>>>> diff --git a/arch/arm/boot/dts/da850.dtsi
>>>>>> b/arch/arm/boot/dts/da850.dtsi
>>>>>> index f79e1b9..32908ae 100644
>>>>>> --- a/arch/arm/boot/dts/da850.dtsi
>>>>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>>>>> @@ -399,6 +420,14 @@
>>>>>>  				<&edma0 0 1>;
>>>>>>  			dma-names =3D "tx", "rx";
>>>>>>  		};
>>>>>> +
>>>>>> +		display: display@213000 {
>>>>>> +			compatible =3D "ti,am33xx-tilcdc", "ti,da850-tilcdc";
>>>>>
>>>>> This should instead be:
>>>>>
>>>>> compatible =3D "ti,da850-tilcdc", "ti,am33xx-tilcdc";
>>>>>
>>>>> as the closest match should appear first in the list.
>>>>
>>>> Actually I don't think that's correct. The LCDC on da850 is not
>>>> compatible with the LCDC on AM335x. I think it should be just
>>>> "ti,da850-tilcdc".
>>>
>>> So if "ti,am33xx-tilcdc" is used, the display wont work at all? If th=
ats
>>> the case, I wonder how the patch passed testing. Bartosz?
>>
>> AM3 has "version 2" of LCDC, whereas DA850 is v1. They are quite
>> similar, but different.
>>
>> The driver gets the version number from LCDC's register, and acts base=
d
>> on that, so afaik the compatible string doesn't really affect the
>> functionality (as long as it matches).
>>
>> But even if it works with the current driver, I don't think
>> "ti,am33xx-tilcdc" and "ti,da850-tilcdc" are compatible in the HW leve=
l.
>=20
> If the hardware provides IP revision information, how about just "ti,lc=
dc" ?

Maybe, and I agree that's the "correct" way, but looking at the history,
it's not just once or twice when we've suddenly found out some
difference or bug or such in an IP revision, or the integration to a
SoC, that can't be found based on the IP revision.

That's why I feel it's usually safer to have the SoC revision there in
the compatible string.

That said, we have only a few different old SoCs with LCDC (compared to,
say, OMAP DSS) so in this case perhaps just "ti,lcdc" would be fine.

 Tomi


--qJh569mBsJEcvuhkT5OprdgUlUGd5FrL9--

--l6bSklRD2LiOxRSLtCQjIH3TSIMxR933q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBMQjAAoJEPo9qoy8lh71X2AP+gPWYfHK5yATUCODohFwpTeZ
9b2bm4rcvetJkd4AMK+kz5dxOtpGbvbICxlWRYiWiydaISUEQs4uZusR9bXiFdvy
U8tbsyxP2/D9VdLQiEJi8Yn+X74H56VgPji1Ar6Sm1daNvqNW9ESKev0lINSUs0H
tg34+txYm1YFr0fbBPoWQGZyROEafmRIDBDhSpIbxCa9uh6nwvHTXaftBZngLhH4
PEUzThaaORK0aXU9cUa5XKpkD0wTq9kE5IRwDkxPh+vF3TY4EpodnsPLIRMjjK7L
9lnwJZma/N1FQ2X7q+/y+QnnOdbm3cl2jxDAzZTpV7qaKOKArq9462yX7wncfX6Z
vV3J6j3FJxwliHYsB3vY55INeiIKBIVYOjMmt0rv12S9WvHinIL6JfTEn29fXKpg
scPMN4jM+9EW+IJ//jJcIx77hopmutBdsgOqRlYcN/Pc0f3z6+9jNveCp2kuUml4
WCNk3bW8mDAaanFU+K9Ev9DH19tXE0eRiv/PjKCUWKPRDB1694Yt6fE5T6lGvEBx
X4EBpoZX8RaiN9M7FYmbvG5uy37pnB2tc8tEYN2lUQQaL7lVk4BV1fM0xm5VI2TP
2ttvREugavWkezF/7x4Ga2ri+cNdvTrSOJyLmXrFTzR0Y1EiQUUOCWUwT6Voa+lq
Mu+bL3bP7QH++BOTmj8T
=YCm/
-----END PGP SIGNATURE-----

--l6bSklRD2LiOxRSLtCQjIH3TSIMxR933q--

--===============1530075966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1530075966==--
