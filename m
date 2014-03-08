From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt: platform driver: Fill the resources before probe and defer if needed
Date: Sat, 08 Mar 2014 07:37:58 +0000
Message-ID: <20140308073758.DA63FC408EC@trevor.secretlab.ca>
References: <20140220153042.DF053C4050F@trevor.secretlab.ca> < 1392988720-20976-1-git-send-email-jjhiblot@traphandler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392988720-20976-1-git-send-email-jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Feb 2014 14:18:40 +0100, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:
> The goal of this patch is to allow drivers to be probed even if at the time of
> the DT parsing some of their ressources are not available yet.

Hi Jean-Jacques

[...]
> +int of_platform_device_prepare(struct platform_device *dev)
> +{
> +	struct device_node *np;
> +	int i, irq_index;
> +	struct resource *res;
> +
> +	/*
> +	 * This function applies only devices described in the DT.
> +	 * Other platform devices have their ressources already populated.
> +	 */
> +	np = dev->dev.of_node;
> +	if (!np)
> +		return 0;

I believe we already talked about the above test. This function must
only process devices created by of_platform_populate(). Merely checking
the of_node pointer is not a sufficient test because there are other
paths in the kernel for creating platform_devices that might get a node
pointer attached to it.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
