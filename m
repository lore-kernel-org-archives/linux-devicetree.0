From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 3/3] usb: dwc3: Enable USB 3.0 phy driver
Date: Tue, 07 Nov 2017 10:24:56 +0200
Message-ID: <87k1z2sdgn.fsf@linux.intel.com>
References: <20171107072055.26945-1-ran.wang_1@nxp.com> <20171107072055.26945-3-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107072055.26945-3-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, stern@rowland.harvard.edu, pku.leo@gmail.com, mathias.nyman@intel.com, gregkh@linuxfoundation.org, suresh.gupta@nxp.com, Shawn Guo <shawnguo@kernel.org>, Sriram Dash <sriram.dash@nxp.com>, Li Yang <leoyang.li@nxp.com>, Hongtao Jia <hongtao.jia@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Ran Wang <ran.wang_1@nxp.com> writes:
> Adds entry point at dwc3 core init function to enable
> USB 3.0 PHY driver.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v2:
> 	- New file
>
>  drivers/usb/dwc3/core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 03474d3575ab..a9df03c64a7b 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -746,6 +746,8 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  {
>  	u32			reg;
>  	int			ret;
> +	int			retval;
> +	struct phy *phy;
>=20=20
>  	if (!dwc3_core_is_valid(dwc)) {
>  		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
> @@ -770,6 +772,19 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  	if (ret)
>  		goto err0;
>=20=20
> +	phy =3D phy_get(dwc->dev, "usb-phy");
> +	if (IS_ERR(phy)) {
> +		retval =3D PTR_ERR(phy);
> +		if (retval =3D=3D -EPROBE_DEFER)
> +			dev_dbg(dwc->dev, "usb-phy no found\n");
> +	} else {
> +		retval =3D phy_init(phy);
> +		if (retval) {
> +			phy_put(phy);
> +		    dev_dbg(dwc->dev, "phy_init() error!\n");
> +		}
> +	}
> +

what???? We already do this. See dwc3_core_get_phy().

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAloBbdoACgkQzL64meEa
mQZitg/9GnyE4elCfc41RrF2oZZsb3CfNuz/FLkFUBH/rLUU1JtW90uLW/SI7Wrm
jjBHFQ/ZYZZvH54tyoxGYOo0cGFTh0GjteyYspR0Pg72DwovEghV/ngPsSn/hqnX
Nu61WkM8D1CwpECF+NAtUzLV2VB69jA+u7o3InOJAM3M6Q25pJ2eskL4DpCwga+P
68HTSdxBuoECw6zx/GQXeHZwEsPgb/GLq5zFAJE7lBXhHq0AHoMcAy1pL7MAYcfX
HJeoAEaxp3nwh6k3bmFvVaVJRiOYI62Y6Bf7FwJE+N+rHzXU8svAJjuuJms9fy0B
PaQEmiNmHH2ueMAs/K8ay0FVaJGHi6GUGIiZqmQ+3T93o10qvMr73VYXpfcajyc9
uiMK/H/KyXyvm+6ztJXxl+KQ82FkzmrChxdqG3wl3xoqOA5L0Ph9zCb8zgTW3vpF
w2fam2aQeLzF9x75aRQH7wWWgUmVkdwiZKQDycrdmfDquDXdmQCJ/E0yY5R7cE/U
KEKvZSrfhlg218fdo+Gy+xFhf+K+wzksgZuvioMAyE9vuIp5wArATxPR9Gd0BbTp
/HtdCWW4r1lZg0Tku7n9YsifgnTTy5w6yW8yUJXsD7DvFbYQCe6FnYzsHHYEHpEC
e10ya6aBhyPsVmFxiJKdjVyC55xIb9LWWp249RWnwlDciZ+1VUc=
=GZRQ
-----END PGP SIGNATURE-----
--=-=-=--
