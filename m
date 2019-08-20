Return-Path: <SRS0=UOXp=WQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:60363 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfHTHud (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Aug 2019 03:50:33 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <9bedff0d-afc2-3078-9025-3b6b18ca7b4c@kaa.org.ua>
Date: Tue, 20 Aug 2019 10:50:22 +0300
MIME-Version: 1.0
In-Reply-To: <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ
Content-Type: multipart/mixed; boundary="7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <9bedff0d-afc2-3078-9025-3b6b18ca7b4c@kaa.org.ua>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
In-Reply-To: <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>

--7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,
thanks for your review.

18.08.19 16:41, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Oleh,
>=20
> On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../bindings/leds/leds-el15203000.txt         | 47 ++++++++++++++++++=
+
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el1520=
3000.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.tx=
t b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..4c2245babfdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,47 @@
>> +Crane Merchandising System - el15203000 LED driver
>> +--------------------------------------------------
>> +
>> +This LED Board (aka RED LEDs board) is widely used in
>> +coffee vending machines produced by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible : "crane,el15203000"
>> +- reg :
>> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +- spi-max-frequency : (optional)
>> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Optional LED sub-node properties:
>> +- label :
>> +	see Documentation/devicetree/bindings/leds/common.txt
>=20
> Please change this label description to the below:
>=20
> - function: see Documentation/devicetree/bindings/leds/common.txt.
> - color: See Documentation/devicetree/bindings/leds/common.txt.
> - label: See Documentation/devicetree/bindings/leds/common.txt (depreca=
ted).
>=20
>> +- linux,default-trigger :
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>=20
> #include <dt-bindings/leds/common.h>
>=20
>> +led-controller@0 {
>> +	compatible =3D "crane,el15203000";
>> +	reg =3D <0>;
>> +	spi-max-frequency =3D <50000>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +
>> +	/* water pipe */
>> +	pipe@50 {
>=20
> s/pipe/led/
>=20
>> +		reg =3D <0x50>;
>> +		label =3D "red:pipe";
>=20
> label is now deprecated.
>=20
> Please use function and color:
>=20
> 	function =3D "pipe";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>=20
>> +	};
>> +
>> +	/* screen frame */
>> +	screen@53 {
>=20
> s/screen/led/
>=20
>> +		reg =3D <0x53>;
>> +		label =3D "red:screen";
>=20
> 	function =3D "screen";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>> +	};
>> +
>> +	/* vending area */
>> +	vend@56 {
>=20
> s/vend/led/
>=20
>> +		reg =3D <0x56>;
>> +		label =3D "red:vend";
>=20
> 	function =3D "vend";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>> +	};
>> +};
>>
>=20

--=20
Best regards,
Oleh Kravchenko



--7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7--

--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1bpj4ACgkQ0xNJm20p
l4zizA//f+xOlcTL6wuAms+uDHTIEV7eZvmNi9JQRM8ComiiCMnJPuIk9pBROwFw
skJW8UqYvbnOJWfq8nxW3dOLsV1rS6BxX/m9AtVpRiEUy3GXG/MJfXKmuLb0fueM
jJUS14abb9aAcqk/WUYMrnqyQcUDI0rvrE5AMBKiDGE4YWhYIlgLqRjIZ+B/1BRT
p3uUHoLnAXLe21fkVjYPDc8gQ5qnKkUgwKn6d51tA6R/slP6EoaSmVl2USIt73B4
llbCgOUbdIz63q3o959bKEoPmlYONTQ0B+pQoacuhcG9EAvsCF+7c0Vg/7tcPxN4
WaJptuMv2djrGiclXS+U0BaZ8I9VewvJ4LOaRCSwAvNru3TYgFn7wOYRPC4zwnrV
rD7Oq/WHZjsNCi3+YbkT1DVb+sC904Jm08PhrmkwYE26NgDXtDx1ir2N8zN/ZPer
ELoxSVpKVj0lqW0ACu5SiaFuVMXltDnKnD9A/TbRvci1E5vIpeMm6HGREIvIJfX6
ks69wIKOHVe5qerEJo+S4Di8y8LfOfbYow79Mz5CmnTCWn/wSMr9IzTiWpLsua7m
CYnlsSQzM/JeIWNLeTpPf2T3yYjfZeW5YBeBYctI8NIkegzeP2P8OTNrSrcgEg16
3dgjj7V3zWfEFWQKJ3oGR3KEA5qrFq6asE4m0QlyHUO0hIM3gXg=
=jj1J
-----END PGP SIGNATURE-----

--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ--
