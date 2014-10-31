From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: mt8135: Add Reset Controller for
 MediaTek SoC
Date: Fri, 31 Oct 2014 11:35:55 +0800
Message-ID: <1414726555.25409.38.camel@mtksdaap41>
References: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
	 <1414638733-10080-4-git-send-email-flora.fu@mediatek.com>
	 <1414659745.3069.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414659745.3069.2.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Philipp,

On Thu, 2014-10-30 at 10:02 +0100, Philipp Zabel wrote:
> Since the reset controller driver accesses registers solely through the
> syscon regmap, I'd prefer to keep with the device tree control graph
> concept and make the reset-controller nodes children of the syscon
> nodes. I've brought this up before: https://lkml.org/lkml/2014/5/27/422,
> and I think this is another case where child node support for syscon
> makes sense:
> 
>         infracfg: syscon@10001000 {
>                 compatible = "mediatek,mt8135-infracfg", "syscon";
>                 reg = <0 0x10001000 0 0x1000>;
>                 
>                 infrarst: reset-controller@30 {
>                         #reset-cells = <1>;
>                         compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
>                         reg = <0x30 0x8>;
>                 };
>         };
> 
>         pericfg: syscon@10003000 {
>                 compatible = "mediatek,mt8135-pericfg", "syscon";
>                 reg = <0 0x10003000 0 0x1000>;
> 
>                 perirst: reset-controller@00 {                                                                                               
>                         #reset-cells = <1>;
>                         compatible = "mediatek,mt8135-pericfg-reset", "mediatek,reset";
>                         reg = <0x00 0x8>;
>                 };
>         };
> 
> regards
> Philipp
> 

Yes, such dts arrangement looks better to me. Implementation in this
version is trying to doing the same thing as your proposal. The new
property "mediatek,syscon-reset = <&infracfg 0x30 0x8>;" specifies base
address of reset and byte width for controlling resets.

If https://lkml.org/lkml/2014/5/27/422 is adopt into kernel release, it
will be well organized to configure reset controller as child of regmap
which is compatible to syscon.

In reset driver, it is able to get syscon regmap from parent node and
retrieve the address offset and byte with for controlling resets.
--- 
syscon_np = of_get_parent(np);
data->regmap = syscon_node_to_regmap(syscon_np);
if (IS_ERR(data->regmap)) {
	dev_err(&pdev->dev, "couldn't get syscon-reset regmap\n");
	return PTR_ERR(data->regmap);
}
ret = of_property_read_u32_array(np, "reg", reg, 2);
if (ret) {
	dev_err(&pdev->dev, "couldn't read reset base from syscon!\n");
	return -EINVAL;
}

---


Thanks,
Flora



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
