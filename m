From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 1/4] soc: mediatek: Refine scpsys to support multiple
 platform
Date: Tue, 25 Oct 2016 16:04:05 +0200
Message-ID: <1d5cda95-467a-4f95-1cc9-b8f156271a54@gmail.com>
References: <1476953798-23263-1-git-send-email-jamesjj.liao@mediatek.com>
 <1476953798-23263-2-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476953798-23263-2-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi James,

On 10/20/2016 10:56 AM, James Liao wrote:
> -static int scpsys_probe(struct platform_device *pdev)
> +static void init_clks(struct platform_device *pdev, struct clk *clk[CLK_MAX])

I prefer struct clk **clk.

> +{
> +	int i;
> +
> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++)
> +		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> +}
> +
> +static struct scp *init_scp(struct platform_device *pdev,
> +			const struct scp_domain_data *scp_domain_data, int num)
>  {
>  	struct genpd_onecell_data *pd_data;
>  	struct resource *res;
> -	int i, j, ret;
> +	int i, j;
>  	struct scp *scp;
> -	struct clk *clk[MT8173_CLK_MAX];
> +	struct clk *clk[CLK_MAX];

should be *[CLK_MAX - 1] but I would prefer to define in the enum:
CLK_MAX = CLK_VENC_LT,

If you are ok with it, I can fix both of my comments when applying.

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
