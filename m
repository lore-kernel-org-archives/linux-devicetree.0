From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 13 Feb 2017 10:59:50 +0900
Message-ID: <0de1f9be-f095-eb0e-7f5d-eeb32c8167e5@samsung.com>
References: <20170209190558.4784-1-robh@kernel.org>
 <CGME20170210014141epcas1p326c6d360ae3ec231265a9626329d86de@epcas1p3.samsung.com>
 <20170209190558.4784-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170209190558.4784-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al
List-Id: devicetree@vger.kernel.org


> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index a0def0be6d65..93ebb12133e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -228,29 +228,6 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
>   	writel(reg, mic->reg + MIC_OP);
>   }
>
> -static struct device_node *get_remote_node(struct device_node *from, int reg)
> -{
> -	struct device_node *endpoint = NULL, *remote_node = NULL;
> -
> -	endpoint = of_graph_get_endpoint_by_regs(from, reg, -1);
> -	if (!endpoint) {
> -		DRM_ERROR("mic: Failed to find remote port from %s",
> -				from->full_name);
> -		goto exit;
> -	}
> -
> -	remote_node = of_graph_get_remote_port_parent(endpoint);
> -	if (!remote_node) {
> -		DRM_ERROR("mic: Failed to find remote port parent from %s",
> -							from->full_name);
> -		goto exit;
> -	}
> -
> -exit:
> -	of_node_put(endpoint);
> -	return remote_node;
> -}
> -
>   static int parse_dt(struct exynos_mic *mic)
>   {
>   	int ret = 0, i, j;
> @@ -262,7 +239,7 @@ static int parse_dt(struct exynos_mic *mic)
>   	 * The first node must be for decon and the second one must be for dsi.
>   	 */
>   	for (i = 0, j = 0; i < NUM_ENDPOINTS; i++) {
> -		remote_node = get_remote_node(mic->dev->of_node, i);
> +		remote_node = of_graph_get_remote_node(mic->dev->of_node, i, 0);
>   		if (!remote_node) {
>   			ret = -EPIPE;
>   			goto exit;
> @@ -279,7 +256,7 @@ static int parse_dt(struct exynos_mic *mic)
>   			break;
>   		case ENDPOINT_DSI_NODE:

Dear Rob,

I have tested this patch, rebase these patches on samsung soc tree[1]
and drm exynos tree[2]. But 4/6 patch can not be applied. Because
there is a conflict with the already merged [3] patch.

Best Regards,
Hoegeun

[1] https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/ 
(for-next branch)
[2] https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/ 
(exynos_drm_next branch)
[3] drm/exynos: mic: Fix parse_dt function (cc2b0225)

>   			/* panel node */
> -			remote_node = get_remote_node(remote_node, 1);
> +			remote_node = of_graph_get_remote_node(remote_node, 1, 0);
>   			if (!remote_node) {
>   				ret = -EPIPE;
>   				goto exit;
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index ebd5f4fe4c23..18d6570e057d 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -247,34 +247,6 @@ static const struct component_master_ops kirin_drm_ops = {
>   	.unbind = kirin_drm_unbind,
>   };
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
