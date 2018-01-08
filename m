From: Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v3] PCI: imx6: Add PHY reference clock source support
Date: Mon, 8 Jan 2018 03:13:17 +0000
Message-ID: <AM5PR0402MB28504F53E80037167C8B22EE8C130@AM5PR0402MB2850.eurprd04.prod.outlook.com>
References: <CAOMZO5AFC9dxhsQjmRrDA7Z3KMkEemryKOBmQhXm19NXKxHkKQ@mail.gmail.com>
 <1515073977-10153-1-git-send-email-ilya@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515073977-10153-1-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Best Regards
hongxing zhu
Linux BSP team
Office: 86-21-28937189
Email: hongxing.zhu-3arQi8VN3Tc@public.gmane.org


> -----Original Message-----
> From: Ilya Ledvich [mailto:ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org]
> Sent: Thursday, January 04, 2018 9:53 PM
> To: Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>; Lucas Stach
> <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>; Rob Herring
> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> Subject: [PATCH v3] PCI: imx6: Add PHY reference clock source support
>=20
> i.MX7D variant of the IP can use either Crystal Oscillator input or inter=
nal
> clock input as a Reference Clock input for PCIe PHY.
> Add support for an optional property 'fsl,pcie-phy-refclk-internal'.
> If present then an internal clock input is used as PCIe PHY reference clo=
ck
> source. By default an external oscillator input is still used.
>=20
> Verified on Compulab SBC-iMX7 Single Board Computer.
>=20
> Signed-off-by: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Acked-by: Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org >

Thanks.
Best Regards
Richard

> ---
> changes since V2:
> 	add a vendor prefix 'fsl' to a new property
>=20
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 +++++
>  drivers/pci/dwc/pci-imx6.c                               | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index 7b1e48b..1591a6a 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> @@ -50,6 +50,11 @@ Additional required properties for imx7d-pcie:
>  	       - "pciephy"
>  	       - "apps"
>=20
> +Additional optional properties for imx7d-pcie:
> +- fsl,pcie-phy-refclk-internal: If present then an internal PLL input
> +is used
> +  as PCIe PHY reference clock source. By default an external oscillator
> +input
> +  is used.
> +
>  Example:
>=20
>  	pcie@0x01000000 {
> diff --git a/drivers/pci/dwc/pci-imx6.c b/drivers/pci/dwc/pci-imx6.c inde=
x
> b734835..36812d3 100644
> --- a/drivers/pci/dwc/pci-imx6.c
> +++ b/drivers/pci/dwc/pci-imx6.c
> @@ -61,6 +61,7 @@ struct imx6_pcie {
>  	u32			tx_swing_low;
>  	int			link_gen;
>  	struct regulator	*vpcie;
> +	bool			pciephy_refclk_sel;
>  };
>=20
>  /* Parameters for the waiting for PCIe PHY PLL to lock on i.MX7 */ @@ -
> 474,7 +475,9 @@ static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pci=
e)
>  	switch (imx6_pcie->variant) {
>  	case IMX7D:
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr,
> IOMUXC_GPR12,
> -				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
> +				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
> +				   imx6_pcie->pciephy_refclk_sel ?
> +				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL : 0);
>  		break;
>  	case IMX6SX:
>  		regmap_update_bits(imx6_pcie->iomuxc_gpr,
> IOMUXC_GPR12, @@ -840,6 +843,9 @@ static int imx6_pcie_probe(struct
> platform_device *pdev)
>  		imx6_pcie->vpcie =3D NULL;
>  	}
>=20
> +	imx6_pcie->pciephy_refclk_sel =3D
> +		of_property_read_bool(node, "fsl,pcie-phy-refclk-internal");
> +
>  	platform_set_drvdata(pdev, imx6_pcie);
>=20
>  	ret =3D imx6_add_pcie_port(imx6_pcie, pdev);
> --
> 1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
