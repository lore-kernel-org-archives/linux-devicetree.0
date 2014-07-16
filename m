From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 05/12] phy: add the Berlin USB PHY driver
Date: Wed, 16 Jul 2014 11:25:41 +0200
Message-ID: <20140716092541.GC28151@kwain>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1405499166-6726-6-git-send-email-antoine.tenart@free-electrons.com>
 <53C64389.3050705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53C64389.3050705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Varka,

On Wed, Jul 16, 2014 at 02:49:05PM +0530, Varka Bhadram wrote:
> On 07/16/2014 01:55 PM, Antoine T=E9nart wrote:
> >+static const struct of_device_id phy_berlin_sata_of_match[] =3D {
> >+	{
> >+		.compatible =3D "marvell,berlin2-usb-phy",
> >+		.data =3D &phy_berlin_pll_dividers[0],
> >+	},
> >+	{
> >+		.compatible =3D "marvell,berlin2cd-usb-phy",
> >+		.data =3D &phy_berlin_pll_dividers[1],
> >+	},
> >+	{ },
> >+};
> >+MODULE_DEVICE_TABLE(of, phy_berlin_sata_of_match);
> >+
>=20
> It looks good if we move this after probe().. So that we can see of_m=
atch_table directly...

We use the of match table in the probe, when calling of_match_device().

> >+static int phy_berlin_usb_probe(struct platform_device *pdev)
> >+{
> >+	const struct of_device_id *match =3D
> >+		of_match_device(phy_berlin_sata_of_match, &pdev->dev);

Here.

Antoine

> >+	struct phy_berlin_usb_priv *priv;
> >+	struct resource *res;
> >+	struct phy_provider *phy_provider;
> >+
> >+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >+	if (!priv)
> >+		return -ENOMEM;
> >+
> >+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >+	priv->base =3D devm_ioremap_resource(&pdev->dev, res);
> >+	if (IS_ERR(priv->base))
> >+		return PTR_ERR(priv->base);
> >+
> >+	priv->rst_ctrl =3D devm_reset_control_get(&pdev->dev, NULL);
> >+	if (IS_ERR(priv->rst_ctrl))
> >+		return PTR_ERR(priv->rst_ctrl);
> >+
> >+	priv->pll_divider =3D *((u32 *)match->data);
> >+
> >+	priv->phy =3D devm_phy_create(&pdev->dev, &phy_berlin_usb_ops, NUL=
L);
> >+	if (IS_ERR(priv->phy)) {
> >+		dev_err(&pdev->dev, "failed to create PHY\n");
> >+		return PTR_ERR(priv->phy);
> >+	}
> >+
> >+	platform_set_drvdata(pdev, priv);
> >+
> >+	phy_provider =3D
> >+		devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
> >+	if (IS_ERR(phy_provider))
> >+		return PTR_ERR(phy_provider);
> >+
> >+	return 0;
> >+}

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
