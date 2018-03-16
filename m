Return-Path: <SRS0=C/sM=GG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:32859 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750806AbeCPV2b (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 16 Mar 2018 17:28:31 -0400
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua> <20180316211424.GB6069@amd>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua>
Date: Fri, 16 Mar 2018 23:29:22 +0200
MIME-Version: 1.0
In-Reply-To: <20180316211424.GB6069@amd>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UsDv6r0VVWpUlOTuVqkRC6rvzCrH1xg8l"
Sender: devicetree-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UsDv6r0VVWpUlOTuVqkRC6rvzCrH1xg8l
Content-Type: multipart/mixed; boundary="z0trMsfJwpk5kCA49ra8jsAc9I6cFgL1w";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <5e8476ed-fce8-5ff3-6a98-9f1eb244adcd@kaa.org.ua>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua> <20180316211424.GB6069@amd>
In-Reply-To: <20180316211424.GB6069@amd>

--z0trMsfJwpk5kCA49ra8jsAc9I6cFgL1w
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

I can track state of recount stuff inside private struct,
it will allow to drop work and timer fields.

You will agree with it?

On 16.03.18 23:14, Pavel Machek wrote:
> On Tue 2018-03-13 14:45:48, Oleh Kravchenko wrote:
>> This patch adds a LED class driver for the RGB LEDs found on
>> the Crane Merchandising System CR0014114 LEDs board.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
> I just wonder if the recount stuff... could be somehow simplified.
>=20
> 									Pavel
>=20

--=20
Best regards,
Oleh Kravchenko
Phone: +380972763224 | oleg@kaa.org.ua | Skype: oleg_krava


--z0trMsfJwpk5kCA49ra8jsAc9I6cFgL1w--

--UsDv6r0VVWpUlOTuVqkRC6rvzCrH1xg8l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlqsNzUACgkQ0xNJm20p
l4wiLRAAxoZ6Pp3gqKxxuPSAMOvHozUYndTce3dmM1SM0ql5GySYNFWa/juS8yIb
URntdU2opK0mEF62kD3mzwipjN439Dpc2w7EELPzPwGYFn67AqKho1JRElHBf58t
4a4j+CG87GeRTYFTvx6ZobiIc0OYaBxWKWDLluVN9W4ar52hhjQhGYXb4ZRRoYbV
kHsnRtgLQ/2/AgjkS3K/kyxeLVmomZYWUC0ghDcxLl5/8HbvrjaAC/ULxQoeWMap
ZXHndhHqhzXcE8FgVe/5oYQc6rar9rhbrQHyUqmxxVXcyyfshWD6si2Yc6UiQsi2
1I7CZx1bODd6smLIEJb0NEuK0jc1JKSAgXh2sfVVQLngboWgVaCvwSxFLmdwDO62
4CIzpgzkmOOl6QlDMW0BNQ+flsa+yhLCGuE565mJEXmhf5pvejH49gPX1a8FO1o7
FzmrEX4/NhkAEbJEslDisAu+A/oySFVauPwlk7wCpchU3j8gyOW7ixRBkCkL/iTH
qHgSEt5AW3JGusTrNFk/U99aNjkfsqTxOW6IqeHT8jPO7alstkwNsKM+dxbiKmsl
/vqkM8X2dmdmVxxYPT/KApCUNjzsRMsaKxMKsVKp+/hegSiMuQCP8WujEUGrvp9g
5v9sGFN6qple2YzhnGATNUQlxkUsL832/Xb5lji5rF2kT06gL9w=
=/VHs
-----END PGP SIGNATURE-----

--UsDv6r0VVWpUlOTuVqkRC6rvzCrH1xg8l--
