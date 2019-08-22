Return-Path: <SRS0=wUgT=WS=gmail.com=thierry.reding@kernel.org>
Date: Thu, 22 Aug 2019 11:04:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V6 3/8] phy: tegra: xusb: Add vbus override support on
 Tegra210
Message-ID: <20190822090405.GA23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-4-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:21PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 57 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  include/linux/phy/tegra/xusb.h    |  4 ++-
>  4 files changed, 84 insertions(+), 1 deletion(-)

Looks good to me now:

Acked-by: Thierry Reding <treding@nvidia.com>

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eWmsACgkQ3SOs138+
s6GMXA//Skz6gnJmtE8Ur8PyRUzhgnGTgTmOxKB2Eqph9x640DbHwX3XjzU0DbR7
1gpiy1bwIoeqsfelBbpAXOV6Tuvj6xv83MRJcrTvp8yeg870jhVvF4XuUVs54d7X
ptM/hOpLapZg0AQ9YwKN77j7F1/8JzXymtpAHfUyB78CCM5RjXg3tQXxBjGGQ+z1
niHWBdGHp9xD7yBU/AWrgu4SKPuN1yQrpYImDq2bkY8aAjf2m/yD8gsEPTzrLi21
K4/KwUnrabUs5hFrNx0k+mXQhazvmWo1g/+/6akL5Rk1Weaoll9ArW0UKiOluqDq
JsVVnv0+KUHZamAET9u9zQwKPRIHcC+6q0GvGWp43Ffbr+3zuxbAPT3hxWOfxD9P
c3yHB6FqchaCyDDH3CufuxB6c7yemd95JpSFvMtafFn3szFzt89RYLKLWo6divwD
CrOPfPDC2O8rj/ZYAy/mEYMw7qaFxpDBdkRAYyj95tZmAFBKcbdc9/v1XD4XUYjN
FHSthiL9Q68WBwb3fHh6NMfr/ewCuRKI6bRWP84S3Mwo/hEwDhlmOwrs/23bhStJ
Ll7fhBhV6Ur/FpPRmyhcp+IyxwAJiQfz4zmG0ekcNjthsl/BAnw/j/U74dhpO1D/
kMtQLvtCzWB/NAUMfWD+PVsV2e72IoQ238cEpo6HotLdUeuAvM4=
=IEah
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
