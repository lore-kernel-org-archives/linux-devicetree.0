From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH RESEND 2/4] regulator: tps65090: add DT support
Date: Mon, 28 Jan 2013 08:58:26 -0700
Message-ID: <5106A022.9040909@wwwdotorg.org>
References: <1359277035-16854-1-git-send-email-ldewangan@nvidia.com> <1359277035-16854-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359277035-16854-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 01/27/2013 01:57 AM, Laxman Dewangan wrote:
> Add DT support for TI PMIC tps65090 regulator driver. The DT of this
> device have node regulator and all regulator's node of this device is
> added under this node.
> 
> The device tree binding document has the required information for
> adding this device on DTS file.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

> diff --git a/drivers/regulator/tps65090-regulator.c b/drivers/regulator/tps65090-regulator.c

> @@ -147,15 +228,20 @@ static int tps65090_regulator_probe(struct platform_device *pdev)
>  	struct tps65090_regulator_plat_data *tps_pdata;
>  	struct tps65090_regulator *pmic;
>  	struct tps65090_platform_data *tps65090_pdata;
> +	struct of_regulator_match *tps65090_reg_matches = NULL;
>  	int num;
>  	int ret;
>  
>  	dev_dbg(&pdev->dev, "Probing regulator\n");
>  
>  	tps65090_pdata = dev_get_platdata(pdev->dev.parent);
> -	if (!tps65090_pdata) {
> +	if (!tps65090_pdata && tps65090_mfd->pdata &&
> +			tps65090_mfd->dev->of_node)
> +		tps65090_pdata = tps65090_parse_dt_reg_data(pdev,
> +					&tps65090_reg_matches);

Why check "&& tps65090_mfd->pdata" here; why not always parse DT if
(!tps65090_pdata && tps65090_mfd->dev->of_node)? In that condition, the
parent MFD driver will always have allocated tps65090_mfd->pdata.


> +	if (IS_ERR_OR_NULL(tps65090_pdata)) {
>  		dev_err(&pdev->dev, "Platform data missing\n");
> -		return -EINVAL;
> +		return (tps65090_pdata) ? PTR_ERR(tps65090_pdata) : -EINVAL;

No need for () there.
