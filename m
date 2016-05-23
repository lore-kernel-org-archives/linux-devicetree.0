From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC v2 2/5] drm/mediatke: add support for Mediatek SoC MT2701
Date: Mon, 23 May 2016 17:09:50 +0800
Message-ID: <1463994590.31921.14.camel@mtksdaap41>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
	 <1463756736-46573-3-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463756736-46573-3-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, YT:

Some comments below.

On Fri, 2016-05-20 at 23:05 +0800, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This patch add support for the Mediatek MT2701 DISP subsystem.
> There is only one OVL engine in MT2701.
> 
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>  
> +static void mtk_ddp_mux_sel(void __iomem *config_regs,
> +			    enum mtk_ddp_comp_id cur, enum mtk_ddp_comp_id next)
> +{
> +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> +	}
> +}
> +

The function name 'mux' looks strange. The register written here
controls the single output selection. I prefer to rename it as
mtk_ddp_sout_sel().

>  
> -static const enum mtk_ddp_comp_id mtk_ddp_main[] = {
> +static const enum mtk_ddp_comp_id mtk_ddp_main_2701[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_BLS,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mtk_ddp_ext_2701[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_DSI0,
> +};
> +

These two pipelines has the same component such as OVL0 and DSI0. I
think user program could not enable both crtc at the same time. Maybe
MT2701 has only one crtc, so you should modify initial flow to create
only one crtc for main display. Or it's typo for external display pipe,
please correct it.


Regards,
CK

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
