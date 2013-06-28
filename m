From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH -next] pinctrl: st: fix return value check
Date: Fri, 28 Jun 2013 11:49:05 +0100
Message-ID: <51CD6A21.4070201@st.com>
References: <CAPgLHd8-jbXfb95x1Bp7GsMuEJ3mOudUcknRqbxNpNmcdQvg3w@mail.gmail.com>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8-jbXfb95x1Bp7GsMuEJ3mOudUcknRqbxNpNmcdQvg3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 26/06/13 17:30, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> The function syscon_regmap_lookup_by_phandle() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/pinctrl/pinctrl-st.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 7effedf..de8c626 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1299,9 +1299,9 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
>  		return -ENOMEM;
>  
>  	info->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> -	if (!info->regmap) {
> +	if (IS_ERR(info->regmap)) {
>  		dev_err(info->dev, "No syscfg phandle specified\n");
> -		return -ENOMEM;
> +		return PTR_ERR(info->regmap);
>  	}
>  	info->data = of_match_node(st_pctl_of_match, np)->data;
>  
> @@ -1376,9 +1376,9 @@ static int st_pctl_probe(struct platform_device *pdev)
>  	pctl_desc->name		= dev_name(&pdev->dev);
>  
>  	info->pctl = pinctrl_register(pctl_desc, &pdev->dev, info);
> -	if (IS_ERR(info->pctl)) {
> +	if (!info->pctl) {
>  		dev_err(&pdev->dev, "Failed pinctrl registration\n");
> -		return PTR_ERR(info->pctl);
> +		return -EINVAL;
>  	}
>  
>  	for (i = 0; i < info->nbanks; i++)
> 
Thankyou for the patch, It looks OK.
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>

Can you resend it with cc to Mark Brown <broonie@kernel.org>

Thanks,
srini



> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
> 
