Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46846 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757226Ab3IAMsu (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 1 Sep 2013 08:48:50 -0400
Date: Sun, 1 Sep 2013 13:48:42 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130901124842.GF3084@sirena.org.uk>
References: <CAPgLHd90UyPGVLUdMV2domFKKDG5inKsXKxcOpvCDbVt-A_t-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline
In-Reply-To: <CAPgLHd90UyPGVLUdMV2domFKKDG5inKsXKxcOpvCDbVt-A_t-w@mail.gmail.com>
Subject: Re: [PATCH -next] spi/qspi: fix missing unlock on error in
 ti_qspi_start_transfer_one()
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 01, 2013 at 09:01:00AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> Add the missing unlock before return from function ti_qspi_start_transfer=
_one()
> in the error handling case.

Applied, thanks.  There's no need to send this to the devicetree people,
there is no DT change in this patch.

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSIzenAAoJELSic+t+oim90KQP/RZzanX1skzWbJeBDeh+wFDu
hoCb9Imh/0O/GxcD673eBw7VdpaSzm8zbxZ3A7H6vINCxYgK1Z7xqueA+ThficCL
2ounrwFc+OvdeurziNMiVn/UZipGezvh16rTpRdMT5StOP5/Q9sHeIvOGITYVjfo
ew3/DGuutFX2VnTuiQsNWpi3ZC5/Dgtlm/y1ahnefeQHN1EdThnHMwh8OF8U7jYU
NOATQ6W9rgiwrKKSFCEzNH/PkcKlXxLQdwq563ycPd82A2z031vybkk1RQv9wDPA
N3QnU07w4mJk7S/+q5CCmds4VfiAs7ueejLqaTKc7PdcsfEh698Uw4qIWR88XwnQ
7wyA0STSsQg+vM/uu2sslMSLfKlG7bg2Jjyn+yldzlU1pePjLV+oYmlJ9FtHzyC1
7rXU66GOcBXzAJHoDps7KnWGhYuxmdgkKNONc1GzQokHVNrE4dcT4TFwMQNEGWgE
KIlJWcwuIclGNdPNwphuXNix8pw4dYMuXx74s5877tdIeqvY5atfpcIeTjs5s1m+
kQqffCOFUyZehjZGeMzHV3XtWVNtXogLKMAtYsfTtYiTPmT4Yuy9SsRQVIOGtt8U
TDGqogf5H+/L6/+Sb9EHmWdjtigpbdxbSQBTaCKUTMhr3juWNhvCEjaWWruf9wbe
R+s7PVW8RpZ5cYSbF6Qo
=NY+C
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--
