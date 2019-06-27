Return-Path: <SRS0=gWt2=U2=gmail.com=thierry.reding@kernel.org>
Date: Thu, 27 Jun 2019 11:21:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V4 2/8] phy: tegra: xusb: t210: add usb3 port fake support
Message-ID: <20190627092126.GA21242@ulmo>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
 <1560161949-26031-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <1560161949-26031-3-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2019 at 03:49:03PM +0530, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral.
>=20
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 65 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  3 files changed, 123 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0UipMACgkQ3SOs138+
s6Hecg/+JCCGEunVOF6lHr9nPIXV42u9d0szF6m1qKtcHCVItNkzqPKrOu4f3UrD
b/tj93rC6g5qp1SWgv/APmLDb5jwi8enZOrXBsffw8wVnxzYgQ6XInIIY2v4Jkvr
3hFEvAfsIZoDVmEMVTSxMqCMxgixKvEvURD8NPw367PSt1+K/OCpFAiFZpADmov9
x8HHQPyD/GjNk4bhrP9XfZYErApF60JKiSq7J8dke/VH/hH97b0Wb8s4k5hCzDsv
cWYClQEvIAzwM0g8NwuRqxAi07qlZsaBoOtX53MysagRjuUbv7yO706qGlcUpsen
SEICZIR68OSx4iCcAcFfFvMPjOy3JwUYZI8PTO05PISKp+jdRzyDO+da2rQrYzkH
X/Wb8TKYUE+otEH+PmQ+Rf/9yks1vTWCdkPN9JbsDVpHYBuoaVCrxel0h5WwRBVk
yXR/t5qKEX0t5IapnISMrZNf+o5kGMl/jDV9OWZyG/Z1XCvNCxss1sQHFu6qffqT
TR02FMqBYbkMnWaPBxgWYk7IgJhHs0/dKakgzRedjLVyrZXC+uV+KXnUdu7oNgy+
6HQJg3ML4OjoXhzdDAxyGkb0dvP8YKckpBhZUdYVBihVglhPAgc26mKxOXmNi1yp
7jLPGQItg2J3Fp1Qb5EIIhjHnrYIkM6kD0uRRj9uvxBpAlpAifw=
=fS/u
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
