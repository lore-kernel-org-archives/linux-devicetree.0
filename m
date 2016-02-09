From: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] of/irq: Fix msi-map calculation for nonzero rid-base
Date: Tue, 9 Feb 2016 18:12:24 +0000
Message-ID: <HE1PR04MB16413597FD97D47AFB9880D78DD60@HE1PR04MB1641.eurprd04.prod.outlook.com>
References: <9f6845195d03b0e0b0d187bb510fbf7bd497e836.1455015344.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9f6845195d03b0e0b0d187bb510fbf7bd497e836.1455015344.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Robin Murphy [mailto:robin.murphy-5wv7dgnIgG8@public.gmane.org]
> Sent: Tuesday, February 09, 2016 5:05 AM
> To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org; Stuart Yoder
> <stuart.yoder-3arQi8VN3Tc@public.gmane.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: [PATCH] of/irq: Fix msi-map calculation for nonzero rid-base
> 
> The existing msi-map code is fine for shifting the entire RID space
> upwards, but attempting finer-grained remapping reveals a bug. It turns
> out that we are mistakenly treating the msi-base part as an offset, not
> as a new base to remap onto, so things get squiffy when rid-base is
> nonzero. Fix this, and at the same time add a sanity check against
> having msi-map-mask clash with a nonzero rid-base, as that's another
> thing one can easily get wrong.
> 
> CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/of/irq.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 7ee21ae..e7bfc17 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -635,6 +635,13 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node
> **np,
>  		msi_base = be32_to_cpup(msi_map + 2);
>  		rid_len = be32_to_cpup(msi_map + 3);
> 
> +		if (rid_base & ~map_mask) {
> +			dev_err(parent_dev,
> +				"Invalid msi-map translation - msi-map-mask (0x%x) ignores rid-
> base (0x%x)\n",
> +				map_mask, rid_base);
> +			return rid_out;
> +		}
> +
>  		msi_controller_node = of_find_node_by_phandle(phandle);
> 
>  		matched = (masked_rid >= rid_base &&
> @@ -654,7 +661,7 @@ static u32 __of_msi_map_rid(struct device *dev, struct device_node
> **np,
>  	if (!matched)
>  		return rid_out;
> 
> -	rid_out = masked_rid + msi_base;
> +	rid_out = masked_rid - rid_base + msi_base;
>  	dev_dbg(dev,
>  		"msi-map at: %s, using mask %08x, rid-base: %08x, msi-base: %08x, length:
> %08x, rid: %08x -> %08x\n",
>  		dev_name(parent_dev), map_mask, rid_base, msi_base,
> --
> 2.7.0.25.gfc10eb5.dirty

Tested-by: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
