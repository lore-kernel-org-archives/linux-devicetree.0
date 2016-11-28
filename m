From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: specify the maximum bandwidth for tilcdc
Date: Mon, 28 Nov 2016 09:42:30 +0200
Message-ID: <953743fb-54f9-fa6f-bfdd-43d92271864f@ti.com>
References: <1480088245-8368-1-git-send-email-bgolaszewski@baylibre.com>
 <8829c208-0674-43c0-8449-ef764071583f@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626934730=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8829c208-0674-43c0-8449-ef764071583f@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============1626934730==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="aFlArdT1oK6BTNeWpIsbSr2XA629M7xWp"

--aFlArdT1oK6BTNeWpIsbSr2XA629M7xWp
Content-Type: multipart/mixed; boundary="55DF03eiPiRtXN53exhMi6ntA26p7LfrP";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <953743fb-54f9-fa6f-bfdd-43d92271864f@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: specify the maximum bandwidth for tilcdc
References: <1480088245-8368-1-git-send-email-bgolaszewski@baylibre.com>
 <8829c208-0674-43c0-8449-ef764071583f@ti.com>
In-Reply-To: <8829c208-0674-43c0-8449-ef764071583f@ti.com>

--55DF03eiPiRtXN53exhMi6ntA26p7LfrP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/11/16 07:24, Sekhar Nori wrote:
> On Friday 25 November 2016 09:07 PM, Bartosz Golaszewski wrote:
>> It has been determined that the maximum resolution supported correctly=

>> by tilcdc rev1 on da850 SoCs is 800x600@60. Due to memory throughput
>> constraints we must filter out higher modes.
>>
>> Specify the max-bandwidth property for the display node for
>> da850-based boards.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  arch/arm/boot/dts/da850.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dt=
si
>> index 8e30d9b..9b7c444 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -452,6 +452,7 @@
>>  			compatible =3D "ti,da850-tilcdc";
>>  			reg =3D <0x213000 0x1000>;
>>  			interrupts =3D <52>;
>> +			max-bandwidth =3D <28800000>;
>=20
> If this is effectively the max pixel clock that the device supports,
> then why not use the datasheet specified value of 37.5 MHz (Tc =3D 26.6=
6 ns).

There's a separate property for max-pixelclock. This one is maximum
pixels per second (which does sound almost the same), but the doc says
it's about the particular memory interface + LCDC combination.

But this 'max-bandwidth' does sound quite odd, as the it really should
be bytes, not pixels... Bad bindings again, which we just have to use.

 Tomi


--55DF03eiPiRtXN53exhMi6ntA26p7LfrP--

--aFlArdT1oK6BTNeWpIsbSr2XA629M7xWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYO9/mAAoJEPo9qoy8lh71+tIP/0qlxMzBHQ0HPKZct+9vg+pQ
q7rMegqXHj4ngIXcrOKayt+/VYdzUJvgt7lUZZaqiW+QtS5CNA/IkQOCjPRQUBrD
mjHLKMAt0MinwF4MDjbiQXKjs+g/KGEldw7LNqGD5xeHGTumKvpf/kSzDypilUed
oO18vwVfKxpPSjUcQa0M36sekF3uX4+pr/19ZRg/fK3yz5c7FLcnOChJ0q7V+SHN
3RrVO6rj9Mi0FahY7yufcVskF6EWoSuDpCFiaxcHJcRXq0g8JTKcHYX+REBYl75m
un3FJqu1yU6gM0u1GblD8in8drhAqdqzfr+Km3u1HgYBMoLrIBpVxaOSF3qPDTV9
Fz1DQCf1gFzoNmQvH9PR/M/WvJ2rdHj5Bbbphi8L/yYHdi9lUBUq7awXgX5O9Uxt
wWo/IrbN4xbGfDtZHkGFl6xVSB1Oqh9+rXGA+7jrioBC6GmTCQtZkHlGouNdoxqO
S87PN2NbTDiGKqhbXj+hkc44i30b3x2+ICiXb8UoFragZFnWZVnkt51dCW4Qks7T
4gEul6HhGkqDWqc8TbZT+9s38xd51yQbO3TRreD6yCz1VxF6hlc2swYNHzSkZaJQ
fC5Q1W8esFMJ6QLEHjO40cUgJuHucv4kuQT2iIOu7fap1Jm56wMjekMTns5xYd9y
6kOPWHEu/ggHbG/dP3lW
=GJrJ
-----END PGP SIGNATURE-----

--aFlArdT1oK6BTNeWpIsbSr2XA629M7xWp--

--===============1626934730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1626934730==--
