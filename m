From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/18] usb: host: xhci-plat: Add support for the
 Armada 38x
Date: Fri, 25 Apr 2014 16:18:49 +0200
Message-ID: <20140425161849.5616821e@skate>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
	<1398434836-18908-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398434836-18908-4-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Gregory CLEMENT,

On Fri, 25 Apr 2014 16:07:01 +0200, Gregory CLEMENT wrote:

> +#define USB3_MAX_WINDOWS	4
> +#define USB3_WIN_CTRL(w)	(0x0 + ((w) * 8))
> +#define USB3_WIN_BASE(w)	(0x4 + ((w) * 8))
> +
> +static void __init mv_usb3_conf_mbus_windows(void __iomem *base,
> +			const struct mbus_dram_target_info *dram)

That's a nitpick, but the name of this function looks like it was
copy/pasted from the Marvell LSP, and isn't very consistent with the
other function name. What about:

	xhci_mvebu_mbus_config()

instead, or something like that?

> +int xhci_mvebu_mbus_init_quirk(struct platform_device *pdev)

I believe this should give you a warning about section mismatch: you
have a non-init function calling an __init function, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
