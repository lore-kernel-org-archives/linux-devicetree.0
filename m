From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/4] of/pci: Add of_pci_parse_bus_range() function
Date: Wed, 13 Feb 2013 22:58:44 +0000
Message-ID: <20130213225844.B79093E3557@localhost>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de> <1360570940-17086-5-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360570940-17086-5-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Rob Herring <rob.herring@calxeda.com>, Andrew Murray <andrew.murray@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 11 Feb 2013 09:22:20 +0100, Thierry Reding <thierry.reding@avionic-design.de> wrote:
> This function can be used to parse a bus-range property as specified by
> device nodes representing PCI bridges.
> 
> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>

Ditto for this one. We can wait on it until there is a user.

> ---
>  drivers/of/of_pci.c    | 25 +++++++++++++++++++++++++
>  include/linux/of_pci.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index d6e6de5..fb92ded 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -85,3 +85,28 @@ int of_pci_get_devfn(struct device_node *np)
>  	return (be32_to_cpup(reg) >> 8) & 0xff;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_devfn);
> +
> +/**
> + * of_pci_parse_bus_range() - parse the bus-range property of a PCI device
> + * @node: device node
> + * @res: address to a struct resource to return the bus-range
> + *
> + * Returns 0 on success or a negative error-code on failure.
> + */
> +int of_pci_parse_bus_range(struct device_node *node, struct resource *res)
> +{
> +	const __be32 *values;
> +	int len;
> +
> +	values = of_get_property(node, "bus-range", &len);
> +	if (!values || len < sizeof(*values) * 2)
> +		return -EINVAL;
> +
> +	res->name = node->name;
> +	res->start = be32_to_cpup(values++);
> +	res->end = be32_to_cpup(values);
> +	res->flags = IORESOURCE_BUS;

Is there precedence for using struct resource for passing around the PCI
bus range values? Who will be the user of this function?

g.
