From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 2/6] phy: armada38x: add common phy support
Date: Wed, 06 Feb 2019 11:59:09 -0800 (PST)
Message-ID: <20190206.115909.1678532321505448811.davem@davemloft.net>
References: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
        <E1grLTg-00061F-Hc@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <E1grLTg-00061F-Hc@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: rmk+kernel@armlinux.org.uk
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, jason@lakedaemon.net, kishon@ti.com, sebastian.hesselbarth@gmail.com, thomas.petazzoni@bootlin.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Wed, 06 Feb 2019 11:34:52 +0000

> +static int a38x_comphy_probe(struct platform_device *pdev)
> +{
> +	struct a38x_comphy *priv;
> +	struct phy_provider *provider;
> +	struct device_node *child;
> +	struct resource *res;
> +	void __iomem *base;

Reverse christmas tree here please.

Thanks.
