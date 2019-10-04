From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/3] mfd: madera: Add support for requesting the
 supply clocks
Date: Fri, 4 Oct 2019 15:34:10 +0100
Message-ID: <20191004143410.GJ18429@dell>
References: <20191001134617.12093-1-ckeepax@opensource.cirrus.com>
 <20191001134617.12093-3-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001134617.12093-3-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Tue, 01 Oct 2019, Charles Keepax wrote:

> Add the ability to get the clock for each clock input pin of the chip
> and enable MCLK2 since that is expected to be a permanently enabled
> 32kHz clock.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v2:
>  - Use new devm_clk_bulk_get_optional API
> 
> Thanks,
> Charles
> 
>  drivers/mfd/madera-core.c       | 27 ++++++++++++++++++++++++++-
>  include/linux/mfd/madera/core.h | 11 +++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/madera-core.c b/drivers/mfd/madera-core.c
> index 29540cbf75934..88d904eb016ea 100644
> --- a/drivers/mfd/madera-core.c
> +++ b/drivers/mfd/madera-core.c
> @@ -450,6 +450,21 @@ int madera_dev_init(struct madera *madera)
>  		       sizeof(madera->pdata));
>  	}
>  
> +	madera->mclk[MADERA_MCLK1].id = "mclk1";
> +	madera->mclk[MADERA_MCLK2].id = "mclk2";
> +	madera->mclk[MADERA_MCLK3].id = "mclk3";
> +
> +	ret = devm_clk_bulk_get_optional(madera->dev, ARRAY_SIZE(madera->mclk),
> +					 madera->mclk);
> +	if (ret) {
> +		dev_err(madera->dev, "Failed to get clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Not using devm_clk_get to prevent breakage of existing DTs */
> +	if (!madera->mclk[MADERA_MCLK2].clk)
> +		dev_warn(madera->dev, "Missing MCLK2, requires 32kHz clock\n");
> +
>  	ret = madera_get_reset_gpio(madera);
>  	if (ret)
>  		return ret;
> @@ -660,13 +675,19 @@ int madera_dev_init(struct madera *madera)
>  	}
>  
>  	/* Init 32k clock sourced from MCLK2 */
> +	ret = clk_prepare_enable(madera->mclk[MADERA_MCLK2].clk);
> +	if (ret != 0) {

Nit: Why is this not 'if (ret)' like in the rest of the file?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
