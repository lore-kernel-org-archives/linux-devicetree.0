From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 07/13] clk: qcom: hfpll: register as clock provider
Date: Wed, 16 Jan 2019 22:28:10 -0800
Message-ID: <20190117062810.GD25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-8-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545039990-19984-8-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:

> Make the output of the high frequency pll a clock provider.
> On the QCS404 this PLL controls cpu frequency scaling.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/clk/qcom/hfpll.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index 87b7f46..0ffed0d 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -53,6 +53,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	struct clk_hfpll *h;
>  	struct clk *pclk;
> +	int ret;
>  	struct clk_init_data init = {
>  		.parent_names = (const char *[]){ "xo" },
>  		.num_parents = 1,
> @@ -87,7 +88,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  	h->clkr.hw.init = &init;
>  	spin_lock_init(&h->lock);
>  
> -	return devm_clk_register_regmap(&pdev->dev, &h->clkr);
> +	ret = devm_clk_register_regmap(dev, &h->clkr);
> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +					   &h->clkr.hw);
>  }
>  
>  static struct platform_driver qcom_hfpll_driver = {
> -- 
> 2.7.4
> 
