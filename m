From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 12:49:01 +0200
Message-ID: <7133995.DH7aRmliCR@wuerfel>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com> <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431478424-29230-9-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 12 May 2015 17:53:41 Brian Norris wrote:
> +static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
> +{
> +       struct bcm63138_nand_soc_priv *priv = soc->priv;
> +       void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
> +       u32 val = brcmnand_readl(mmio);
> +
> +       if (val & BCM63138_CTLRDY) {
> +               brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
> +               return true;
> +       }
> +
> +       return false;
> +}
...
> +static int bcm63138_nand_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct bcm63138_nand_soc_priv *priv;
> +       struct brcmnand_soc *soc;
> +       struct resource *res;
> +
> +       soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
> +       if (!soc)
> +               return -ENOMEM;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +

This is a slightly unconventional method of doing the abstraction.
For consistency with a lot of other drivers, I'd do it like this:

struct bcm63138_controller {
	void __iomem *base;
	brcmnand_controller parent;
};

static bool bcm63138_nand_intc_ack(struct brcmnand_controller *parent)
{
	struct bcm63138_controller *controller;
	controller = container_of(parent, struct brcmnand_controller, parent);

	...
}

static int bcm63138_nand_probe(...)
{
	struct bcm63138_controller *controller;

	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
	...
	return brcmnand_probe(pdev, &controller->parent);
}

This also simplifies the probe() functions and means less pointer chasing.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
