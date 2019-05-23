Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:30:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 8/8] arm64: defconfig: Enable tegra XUDC driver
Message-ID: <20190523103042.GH30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:32PM +0530, Nagarjuna Kristam wrote:
> Enable support for Nvidia XUSB device mode controller driver.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b605b7f..bf1437c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -575,6 +575,7 @@ CONFIG_USB_ULPI=3Dy
>  CONFIG_USB_GADGET=3Dy
>  CONFIG_USB_RENESAS_USBHS_UDC=3Dm
>  CONFIG_USB_RENESAS_USB3=3Dm
> +CONFIG_USB_TEGRA_XUDC=3Dy

This driver is fairly large, do we really want to make it built-in by
default? Are there any downsides to making this a loadable module?

Thierry

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmdlIACgkQ3SOs138+
s6Hjig//a8Z5vwgiC76NnBHuHQKcalA6kpCMsG8UH90QVcUGJBWlvniGczTopMKL
EVqkTE+myEuiE6fVErzhkpbQix41hUf7I68pL/bxvX29N+3KcKH9VlY+vv0iWnL0
rQB9D+KhWe0gBeaufIBqKcuPvzz2OuQ1uRcpubfW9cE9hqgkRJ/wH28uWSmqk1+n
pDdO5iL+DUq7Wj2UW/R7o+T0xy455AoG3RIgV0sn8E9wPhXDj7sg3z1fudQBnoh8
CqmEVvS7ruWeQhIShLJIEzvQFsKFHzEs0DAZ1gyma4JdprSr4s5cdmBNoi69jbvs
0BVFcVTH1V9uaGT5mgHaBHQry7cGBm0VQPGOS4FNQJ3YFdg8CBwdbHHG13MzCYLx
FpwU9UGUJ+YRwWXQzpd03+YCBl/KdG5fdvr77KqQLHY+SzDrLTBoKb4E5oX1nNw2
wjiHXuz+8vHMG0QJWaAoQz7GcZzCfpfSNfgEc4uJpZD7K5RtK4JW7Urr2XKs0xyY
xTs4oRhSyJ+2t74NLiDYe3Oxjd5BWQzJGA6L/Z8LxZi6JXchQbzE8+0I5Dx0IlHV
Ra75Zs4La2Qx7zOnQwqukccqIL8Hn3bvorl/XLZ+ExRlb/lRVc9+nEz8ekO/wyaG
xOCuIWJ/un8VDWJRQpp3I6aq6BpQhPlwZJJSc4kXD3mXlWKvOac=
=YWPc
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--
