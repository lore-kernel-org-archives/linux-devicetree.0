Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:48869 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729640AbfFGUx1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Jun 2019 16:53:27 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
Date: Fri, 7 Jun 2019 23:53:17 +0300
MIME-Version: 1.0
In-Reply-To: <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x47xpvXRYgTrvWFIouXPI01exi4FRbBMw"
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x47xpvXRYgTrvWFIouXPI01exi4FRbBMw
Content-Type: multipart/mixed; boundary="z4Z0fNgufLNfNbqIK65fpDmfSFeDxvedR";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-ID: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
In-Reply-To: <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>

--z4Z0fNgufLNfNbqIK65fpDmfSFeDxvedR
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable



07.06.19 23:14, Dan Murphy =D0=BF=D0=B8=D1=88=D0=B5:
> Oleh
>=20
> On 6/7/19 1:40 PM, Oleh Kravchenko wrote:
>> +LED sub-node properties:
>> +- label :
>> +=C2=A0=C2=A0=C2=A0 see Documentation/devicetree/bindings/leds/common.=
txt
>=20
> Add this
>=20
> Optional LED sub-node properties:
>=20
> And remove (optional) from the below.
>=20

Done

>> +- linux,default-trigger : (optional)
>> +=C2=A0=C2=A0=C2=A0 see Documentation/devicetree/bindings/leds/common.=
txt
>> +- max-brightness : (optional)
>> +=C2=A0=C2=A0=C2=A0 Specify here 2 if LED has special effect. Effects =
by LED type:
>=20
> s/Specify here 2/Specify 2
>=20

Done

> But this is not really max_brightness now this is a feature and now doe=
s not make sense in this context
>=20
> You may need to use something different for this property or expose a f=
ile in the driver.
>=20
>=20

Protocol for this board define 0x32 as brightness level.
This behaviur needed to keep backward compatibity.


--=20
Best regards,
Oleh Kravchenko



--z4Z0fNgufLNfNbqIK65fpDmfSFeDxvedR--

--x47xpvXRYgTrvWFIouXPI01exi4FRbBMw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz6zr0ACgkQ0xNJm20p
l4yOAg/+PPoO+K/KLYzmNq7ln8erm14tuzEj6bSoadEmR626ogk2RMHstEKVuHVn
bWLQI8jOntTxH+HjLyL+OFtnB5UVzufOXxsYnq0IS2L1CWvhB66Y/SowG9unH31s
pBpTp7FcXm4FWx5EnJ1Eq8OaE/JdV2LNyoHz9EIqdxDitIrdn5A+xO4/AOG4vGhp
H8JhUZgIiupWWQ9DStBcCobrAYgZstuawOReIni1OrEmpE0G7fDSfHkYA9MS+qV8
clKVLMGdyy9gN/eNuvBDhlNLTDcb+di+AZS1AbKW4WOeFkLWMHbIopnJAgNYm0j7
i/LAtQWs1/ngTFDInJ/UpxiwGQLL0Z1nMDyhWz0HMoJjh25Z0Rc35XazhNl5LGVz
XoWH7onySZmirRcP0y9rLs3YpQ7UbjuLNdSd+Kp/6hENFDbjE2t/1oZREzoqjm7H
5lNnIzFA82miykHIWhLgFpW1c4kTHQz/2ohBdBaHaL54sMTm5gNTudkqyzDEBGe9
4hyPA/yYhp29kOCWVaXYPg6RNrqF0bUfEiMUKOGeA2pPDWM0Ul5kPfVBR0h9n5Ps
OQCXHCW4aoWPcFPsUsKlv9gNQnZKsSBtCGSfbDLyOSImwdbYWmYHmQ0ZqZNZr/fQ
2mneJZWXpkPFPOtRgOkSlk1t6MhuYWulI+bxaRFLXZJ42DeY2H4=
=A/Na
-----END PGP SIGNATURE-----

--x47xpvXRYgTrvWFIouXPI01exi4FRbBMw--
