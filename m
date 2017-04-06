From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Thu, 6 Apr 2017 16:54:02 +0200
Message-ID: <d461ac7d-4081-4444-6875-de4d8013dec3@gmail.com>
References: <1491470130-6655-1-git-send-email-alexey_firago@mentor.com>
 <1491470130-6655-2-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491470130-6655-2-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alexey Firago <alexey_firago@mentor.com>, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, geert@linux-m68k.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/2017 11:15 AM, Alexey Firago wrote:
> Introduce vc5_chip_info structure to describe features of a particular
> VC5 chip (id, number of FODs, number of outputs, flags).
> For now flags are only used to indicate if chip has internal XTAL.
> vc5_chip_info is set on probe from the matched of_device_id->data.
> 
> Also add defines to specify maximum number of FODs and clock outputs
> supported by the driver.
> 
> With these changes it should be easier to extend driver to support
> more VC5 models.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/clk/clk-versaclock5.c | 65 +++++++++++++++++++++++++++++++------------
>  1 file changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 56741f3..4e81fb1 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -113,12 +113,30 @@
>  #define VC5_MUX_IN_XIN		BIT(0)
>  #define VC5_MUX_IN_CLKIN	BIT(1)
>  
> +/* Maximum number of clk_out supported by this driver */
> +#define VC5_MAX_CLK_OUT_NUM	3
> +
> +/* Maximum number of FODs supported by this driver */
> +#define VC5_MAX_FOD_NUM	2
> +
> +/* flags to describe chip features */
> +/* chip has built-in oscilator */
> +#define VC5_HAS_INTERNAL_XTAL	BIT(0)
> +
>  /* Supported IDT VC5 models. */
>  enum vc5_model {
>  	IDT_VC5_5P49V5923,
>  	IDT_VC5_5P49V5933,
>  };
>  
> +/* Structure to describe features of a particular VC5 model */
> +struct vc5_chip_info {
> +	const enum vc5_model	model;
> +	const unsigned int	clk_fod_cnt;
> +	const unsigned int	clk_out_cnt;
> +	u32			flags;

Shouldn't this also be const ?

> +};

[...]

-- 
Best regards,
Marek Vasut
