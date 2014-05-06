From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 17/20] phy: Add support for USB cluster on the Armada
 375 SoC
Date: Tue, 6 May 2014 17:53:30 -0300
Message-ID: <20140506205330.GA27308@arch.cereza>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
 <1399335255-589-18-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399335255-589-18-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

On 06 May 02:14 AM, Gregory CLEMENT wrote:
> +
> +#define USB2_PHY_CONFIG_ENABLE BIT(0) /* active low */
> +

I still think it's more readable to use USB2_PHY_CONFIG_DISABLE.
It's just a nitpick, though.

> +static int armada375_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct phy *phy;
> +	struct device_node *np =3D dev->of_node;
> +	struct phy_provider *phy_provider;
> +	void __iomem *usb_cluster_base;
> +	struct device_node *xhci_node;
> +	int i;
> +
> +	usb_cluster_base =3D of_iomap(np, 0);
> +	BUG_ON(!usb_cluster_base);
> +

Isn't a bit extreme to call BUG_ON (and thus bring down the whole syste=
m)
in a phy driver?

> +	for (i =3D 0; i < NB_PHY; i++) {
> +		phy =3D devm_phy_create(dev, &armada375_usb_phy_ops, NULL);
> +		if (IS_ERR(phy))
> +			dev_err(dev, "failed to create PHY n%d\n", i);
> +

I think you're missing a continue/break here.

> +		usb_cluster_phy[i].phy =3D phy;
> +		usb_cluster_phy[i].reg =3D usb_cluster_base;
> +		usb_cluster_phy[i].enable =3D false;
> +		phy_set_drvdata(phy, &usb_cluster_phy[i]);
> +	}
> +
> +	usb_cluster_phy[PHY_USB2].use_usb3 =3D false;
> +	usb_cluster_phy[PHY_USB3].use_usb3 =3D true;
> +
[..]
> +
> +MODULE_DESCRIPTION("Armada 375 USB cluster driver");
> +MODULE_AUTHOR("Gregory CLEMENT <gregory.clement@free-electrons.com>"=
);
> +MODULE_LICENSE("GPL");

GPL v2 ?

--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
