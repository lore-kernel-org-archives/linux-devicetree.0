From: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH v2] stmmac: Add device-tree support
Date: Tue, 13 Mar 2012 14:23:06 +0530
Message-ID: <4F5F0AF2.1070508@st.com>
References: <1331623394-14600-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1331623394-14600-1-git-send-email-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: Stefan Roese <sr@denx.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>, spear-devel <spear-devel@list.st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>
List-Id: devicetree@vger.kernel.org

On 3/13/2012 12:53 PM, Stefan Roese wrote:

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

> +#ifdef CONFIG_OF
> +static int __devinit stmmac_probe_config_dt(struct platform_device *pdev,
> +					    struct plat_stmmacenet_data *plat,
> +					    const char **mac)
> +{

<snip...>

> +}
> +#else
> +static int __devinit stmmac_probe_config_dt(struct platform_device *pdev,
> +					    struct plat_stmmacenet_data *plat,
> +					    const char **mac)
> +{
> +	return ERR_PTR(-ENOSYS);

why ERR_PTR()?

> +}
> +#endif /* CONFIG_OF */
> +
>  /**
>   * stmmac_pltfr_probe
>   * @pdev: platform device pointer

> @@ -58,7 +101,25 @@ static int stmmac_pltfr_probe(struct platform_device *pdev)
>  		ret = -ENOMEM;
>  		goto out_release_region;
>  	}
> -	plat_dat = pdev->dev.platform_data;
> +
> +	if (pdev->dev.of_node) {
> +		plat_dat = devm_kzalloc(&pdev->dev,
> +					sizeof(struct plat_stmmacenet_data),
> +					GFP_KERNEL);
> +		if (!plat_dat) {
> +			pr_err("%s: ERROR: no memory", __func__);

why don't we use dev_err here?

> +			ret = -ENOMEM;
> +			goto out_unmap;
> +		}
> +
> +		ret = stmmac_probe_config_dt(pdev, plat_dat, &mac);
> +		if (ret) {
> +			pr_err("%s: main dt probe failed", __func__);

here too?

-- 
viresh
