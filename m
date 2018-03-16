Return-Path: <SRS0=C/sM=GG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:34317 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750826AbeCPVjn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 16 Mar 2018 17:39:43 -0400
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua> <20180316211424.GB6069@amd>
 <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua> <20180316213338.GA5116@amd>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
Date: Fri, 16 Mar 2018 23:40:36 +0200
MIME-Version: 1.0
In-Reply-To: <20180316213338.GA5116@amd>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R7BCHjHOzNbQKGUQr9psRavHrnQQyUW1I"
Sender: devicetree-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R7BCHjHOzNbQKGUQr9psRavHrnQQyUW1I
Content-Type: multipart/mixed; boundary="NzI6uHYIAdBRPOzYEw0bjn71PgoQMW9OD";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua> <20180316211424.GB6069@amd>
 <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua> <20180316213338.GA5116@amd>
In-Reply-To: <20180316213338.GA5116@amd>

--NzI6uHYIAdBRPOzYEw0bjn71PgoQMW9OD
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Did you mean to do "recount" every 1000 brightness changes?

On 16.03.18 23:33, Pavel Machek wrote:
> On Fri 2018-03-16 23:29:22, Oleh Kravchenko wrote:
>> I can track state of recount stuff inside private struct,
>> it will allow to drop work and timer fields.
>>
>> You will agree with it?
>=20
> That will not help much. Would it be possible to get away without the
> timer, for example? Just schedule work for the future?
>=20
> 									Pavel
> 								=09
>=20

--=20
Best regards,
Oleh Kravchenko



--NzI6uHYIAdBRPOzYEw0bjn71PgoQMW9OD--

--R7BCHjHOzNbQKGUQr9psRavHrnQQyUW1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlqsOdQACgkQ0xNJm20p
l4yPcxAApE8UiDiOKtOToGt0K5+mAOKcnzDzqqb+aSJPwjwKQuIIX35rq2he1cRp
PbY7oA1nDpNfF6ZfT/5Ml94qZcdVaKqD70RQM7xfOlFh7qHHoK0n3ocOOWRX3CBY
sSMtoslYvTlNOYwh5YemkVR5SjgsibiHR4AMbnFH5KJrmNhs5PFPXXh8YhOt7iSy
B6ec7nk7QmFERaahoO2AUjhAFxd5yRc2DDEDggfDypkttmn6+iw04ZRnLbepTzrG
Xfd1ZZYhiYL4M1FtdeueuGHNax+3Ae6CBh2ejIeqETIipFptZjZDNUbUuyHrjKr6
Hdy8jACYUuR34JKg4HcTuQgjic4xluwgY030MQxHRjsTE0IUai21Iz7vqo+2B3g7
LYIpspAlCMswDqdpBcAoL3n+FhXvT0ns07XE4VWQKNyqAxq5lbirRHqp1GJKe1Q5
TC2Aevhb9XtopNccVXctNoah34SEwQydttlmTLN9UDARr82uUXPm3S5wQnPVVka/
GhrSPaeVmqWHBriGYcRRCCLpQdER8y2wLlepY27HD9HtzyRqyLSHXGOzNCPeeuh7
5xwgJhjEGGDSdxVhkuNRMa3PYCSzd+bElQfVOrXVXvqxL0t/TFiGMaEHShM/RZAf
utFHy1DJlk3Ijs9u+W3mtM99biH1V7VMAbUOmT++KlNLhMTAQtM=
=abDX
-----END PGP SIGNATURE-----

--R7BCHjHOzNbQKGUQr9psRavHrnQQyUW1I--
