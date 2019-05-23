Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:28:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190523102838.GG30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:31PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   10 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3807 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3818 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
[...]
> +MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
> +MODULE_AUTHOR("Hui Fu");

Andrew was credited in the commit message, but what about Hui Fu? From
this line it sounds like she was also involved, so perhaps credit her in
the same way in the commit message?

It might also be useful to add yourself as author here to increase the
chances of somebody finding you as contact person if there are any
issues with this driver.

Thierry

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmddYACgkQ3SOs138+
s6FsdQ/7BUwiFERnDiHKMfSHMrfaZx9OxjFEhW6jEc0MwjLCcf8X/723012CZrCV
awalz9xEuHLCG7rvSMcwScykePXXCHri0LXmlP98S4wUxEjX0A5F45uJJ0tsrKWK
F08kmCaW0bGxkLbLhh+tTSKuJ1/jI8B3h7qusAbYY8+J6hOUBj1AHuY6+pul1PiF
Y2oj62J6FeBWpE7llKFQS6eZUCG3zKZormAv34hG4WREktOsa/MLRgijYkFjIkKc
xiKXKqJIHdj9qM273Uat/fbR/4db/Wb0Gh7vWXqJkn0CwgjE/f8JH7J31YGvs1R3
tIkDErUg6NHbnlW0jMzU5bsq5PBe0MinRVkMLWsjBKjTpzW+H5LK89ueeM+l1eSH
rHyGs8sCuvmPFmZQ5ZemOd+TI3YDTCwjp3LZ5sc3wcbhTir186Ku9rKsas/dKeTD
TJ92qocJNNZpZby54TsIVU/yUE9kGvrT2IQmF7capV1PHLx4UHQeBG7NV6I3xAiz
TABLNum30y8Y4Z454b6N7A0en9Di6snqdlS7o0bl7oZbRLFPxgeNMOO15IJjOG5R
jDbUIG8IafQOZSgKmjw73RCaCF0fZ/zcLaHeYyKNzWJ6035y+uN8nRPL6mZbS1j2
ElvKHi6t+1nH30usXxvU4ZW5/CO1dO4OXV/gxpCv5UUjPiKXrsg=
=Kc9c
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--
