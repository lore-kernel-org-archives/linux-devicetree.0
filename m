From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] phy: miphy365x: Convert to devm_kcalloc and fix
 wrong sizof
Date: Thu, 5 Mar 2015 07:53:19 +0000
Message-ID: <20150305075319.GA29183@x1>
References: <1425520379.1637.7.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425520379.1637.7.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 05 Mar 2015, Axel Lin wrote:

> Prefer devm_kcalloc over devm_kzalloc with multiply.
> In additional, use sizeof(phy) is incorrect, fix it.
>=20
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/phy/phy-miphy365x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/phy/phy-miphy365x.c b/drivers/phy/phy-miphy365x.=
c
> index 61177a6..51b459d 100644
> --- a/drivers/phy/phy-miphy365x.c
> +++ b/drivers/phy/phy-miphy365x.c
> @@ -549,9 +549,8 @@ static int miphy365x_probe(struct platform_device=
 *pdev)
>  		return -ENOMEM;
> =20
>  	miphy_dev->nphys =3D of_get_child_count(np);
> -	miphy_dev->phys =3D devm_kzalloc(&pdev->dev,
> -				       sizeof(phy) * miphy_dev->nphys,
> -				       GFP_KERNEL);
> +	miphy_dev->phys =3D devm_kcalloc(&pdev->dev, miphy_dev->nphys,
> +				       sizeof(*miphy_dev->phys), GFP_KERNEL);
>  	if (!miphy_dev->phys)
>  		return -ENOMEM;
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
