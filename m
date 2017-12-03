From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH v5 net-next,mips 6/7] netdev: octeon-ethernet: Add
 Cavium Octeon III support.
Date: Sun, 03 Dec 2017 11:26:53 -0500 (EST)
Message-ID: <20171203.112653.224466614263640515.davem@davemloft.net>
References: <20171201231807.25266-1-david.daney@cavium.com>
        <20171201231807.25266-7-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171201231807.25266-7-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, james.hogan-8NJIiSa5LzA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Date: Fri,  1 Dec 2017 15:18:06 -0800

> +static char *mix_port;
> +module_param(mix_port, charp, 0444);
> +MODULE_PARM_DESC(mix_port, "Specifies which ports connect to MIX interfaces.");
> +
> +static char *pki_port;
> +module_param(pki_port, charp, 0444);
> +MODULE_PARM_DESC(pki_port, "Specifies which ports connect to the PKI.");

Please no module parameters.

Please instead find a way to determine or configure these elements
at run time with generic configuration interfaces.
> +
> +static int bgx_probe(struct platform_device *pdev)
> +{
> +	struct mac_platform_data platform_data;
> +	const __be32 *reg;
> +	u32 port;
> +	u64 addr;
> +	struct device_node *child;
> +	struct platform_device *new_dev;
> +	struct platform_device *pki_dev;
> +	int numa_node, interface;
> +	int i;
> +	int r = 0;
> +	char id[64];
> +	u64 data;

Please use reverse-christmas-tree ordering (longest to shortest line) for
local variable declarations.

Please fix this in your entire submission.

> +static int bgx_mix_init_from_fdt(void)
> +{
> +	struct device_node	*node;
> +	struct device_node	*parent = NULL;
> +	int			mix = 0;
> +

Please do not use tabs like this when declaring local variables.
Much worse, some functions use this style whereas others do not,
be consistent otherwise your code is very hard to read.

Please fix this for your entire submission not just this specific
case I am pointing out.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
