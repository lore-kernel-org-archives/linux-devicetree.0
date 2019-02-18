From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] gpio: sprd: Change to use SoC compatible string
Date: Mon, 18 Feb 2019 14:07:38 -0600
Message-ID: <20190218200737.GA7091@bogus>
References: <3818909a5d6f956ef30ff25cfc42f7550d062086.1550201284.git.baolin.wang@linaro.org>
 <ad2fbe222ad715b3f7e6e093a7f822743e465f9a.1550201284.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ad2fbe222ad715b3f7e6e093a7f822743e465f9a.1550201284.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, orsonzhai@gmail.com, zhang.lyra@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 12:55:19PM +0800, Baolin Wang wrote:
> Change to use SoC compatible string instead of wildcard string.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v1:
>  - None.
> ---
>  drivers/gpio/gpio-pmic-eic-sprd.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> index ac573da..24228cf 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -364,7 +364,7 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id sprd_pmic_eic_of_match[] = {
> -	{ .compatible = "sprd,sc27xx-eic", },
> +	{ .compatible = "sprd,sc2731-eic", },

You need to keep the old one if you care about backwards compatibility. 
If you don't then state why in the commit message.

>  	{ /* end of list */ }
>  };
>  MODULE_DEVICE_TABLE(of, sprd_pmic_eic_of_match);
> -- 
> 1.7.9.5
> 
