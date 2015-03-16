From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Mon, 16 Mar 2015 11:55:16 -0700
Message-ID: <55072714.9080104@gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com> <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/03/15 17:18, Brian Norris wrote:
> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, and
> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict it
> to those architectures.
> 
> There are multiple revisions of this core throughout the years, and
> almost every version broke register compatibility in some small way, but
> with some effort, this driver is able to support v4.0, v5.0, v6.x, v7.0,
> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, so
> there hopefully are no more lurking inconsistencies.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Looks good to me, just one nitpick below:

[snip]

> +static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
> +{
> +	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
> +	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
> +	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
> +
> +	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
> +
> +	/* Only support v4.0+? */
> +	if (ctrl->nand_version < 0x0400)
> +		return -ENODEV;

It could be nice to have an informative error message here that this is
either:

- an unknown controller revision (> 7.1)
- an older controller revision
- a check against the compatible property, just in case?

[snip]

> +		ctrl->cs_offsets = brcmnand_cs_offsets_v71;
> +	} else {
> +		ctrl->cs_offsets = brcmnand_cs_offsets;
> +
> +		/* pre-v5.0 has a different CS0 offset layout */
> +		if (ctrl->nand_version <= 0x0500)
> +			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;

Based on this check, should the comment should be "pre-v5.0 and v5.0
have a different CS0 offset layout"?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
