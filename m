Return-Path: <SRS0=4Bew=MI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41743 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbeIZVnd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Sep 2018 17:43:33 -0400
Date: Wed, 26 Sep 2018 17:30:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: dts: paz00: fix wakeup gpio keycode
Message-ID: <20180926153001.GM12980@ulmo>
References: <92555b9110d94f5689a3ab59c1b31387635e7178.1533199116.git.marvin24@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EE8jvUPYYQjJtG7J"
Content-Disposition: inline
In-Reply-To: <92555b9110d94f5689a3ab59c1b31387635e7178.1533199116.git.marvin24@gmx.de>
Sender: devicetree-owner@vger.kernel.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--EE8jvUPYYQjJtG7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2018 at 10:45:40AM +0200, Marc Dietrich wrote:
> The power key is controlled solely by the EC, which only tiggeres this
> gpio after wakeup.
> Fixes immediately return to suspend after wake from LP1.
>=20
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--EE8jvUPYYQjJtG7J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurpfkACgkQ3SOs138+
s6GeHBAAsGO13xKd/O9YNlpNXIIBvN/T996vW9Kb0HyCN/GWR2xaAR6unejm7Fbm
EPQMuqWgS/A2vIb2mRVVLsWzYtw7q4j62YOZ7eR3LBg1oqjNY9tL6wdT1zS0giqf
k5a6y5CYrmFYWpRmtmcpCky3NLwmYHhoXtaBaLEwZVVZXbUvbbWMmgDTNCdDpWxu
gD7FLgIfspfMQun9vpZXDAcGQOqKDDCWSfdeD77E/17adIJn7u3f7xW8i3+bNgX9
iNasdLVae7Vjih5aTC2CVOy7pFMLBBhFE8leR13zGYEu5hhZhi43dxU5HrJEQ2Ea
HK6yRFmRbe3Gy51DSpLI/AwzWFd+3+B18hHnO1DLbjaXOUBG7dHEUANKuwB09Ygy
Sy2f2tYw1MuwLvpQjQ0IWswVEFWB0KqZCbvgNTKwTsVOim45dIwt3/HkvgXqHEmK
Flpx07SF41ry8VmT9KPTPOE+1+drxgzY8B6HM/yUxazE0q6XfbDRwRFpzLP8flVu
U1rgp7WpWx6yKcc4I0+TdpRTmoqAHmfAKSDlMljw/N/vxEgbEk7i8mGBvx3t7CCx
zew1ZntXEM51THBXb45I5KoyzNZEPLrVA8lzwgOFG57GMixbnF2G9TEAKq5czNg1
+jMo/UfYnmVgLduyhORB3PZwzVEwjS5lgxVc4DX1KanNahjOGUE=
=IeJ7
-----END PGP SIGNATURE-----

--EE8jvUPYYQjJtG7J--
