From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Tue, 17 Jan 2017 10:45:30 +0100
Message-ID: <20170117094529.GC1487@katana>
References: <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana>
 <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170117082118.GA1487@katana>
 <CAMuHMdVW=HORcCA0brX4tZdtG9knqE7D_wnM5VtSrxz2LdBgUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVW=HORcCA0brX4tZdtG9knqE7D_wnM5VtSrxz2LdBgUA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I have no idea if the SDHI driver disables the module clock when it is
> idle, but shouldn't the card detect clock be running all the time when the
> driver is bound to the device?

Yes, it should. And for all instances with just one clock, this means
this main clock must be running. So, en-/disable functions are all about
suspend/resume and bind/unbind. (Huh, looks like the unbind part is
missing, though. Need to look closer).

My take is: either we implement the power saving and handle the cd clock
seperately. Or we ignore the power saving for now and handle both clocks
as virtually one, i.e. en-/disable them at the same time.

Doesn't make sense?


--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYfee5AAoJEBQN5MwUoCm2SCcP/2PPmylLpoZD3Ij4NWichpA7
OULGBzuCle2nWuxB7m/XWaAWMuD3IAJLH5cfiIvmKU3KOIwcw/Bu0qYCbTvvZ/hW
F9+IhdLQt/HbLFEmNc8M/TZ+56y3txAGiVGtFRXgIULP2RPxsgqoQacVBPlh6A4E
na977R2/GQtJtoRDk4PNzppuRHKnezZlUEShUGRR28gq9vfK6I/r2YXzUKWR7vRM
v3rilOK3Idg/sPr+DmwzzBzXm2/0ja0jef7RSMBYhD4ptFJDSxqFFl13YK5tjl95
UxaVLqtt/8yCOuu/1kNt0MHK+8gE3PB1QUFusEANdCrPKxA0a77AA4Vls01kYlBk
WhPZHuLS59TtpC76ZJJO/sSNCU7gFNZzZy0JAKMVu+Ro0mew43CUGW9gvfqM1QWU
6PTlAWpzNllz0Zuk7DN65REvwBtvEXO8Lf0kz5JF8d53D3/HJJzjGlJawPQhAtnf
2g8Hxyq6KCS3EEm35B7dtTOcYyWTipTY7yTmTkydp86KKyXfjdDHU2Bw18A6R0Sf
HdBeC6A75MolhPgZI6FkQiRqAIT4iAiVcGNmC87OnC9Vc3VPFDmICJCstA+TjY4y
100jeNReuJReP1s+8Nj09F8E+1tmEySTiq4I18G+8ohpoE++t1YnZfBNGVFw5juA
WJTx1PiG+1FImnGLsKyG
=2bSE
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
