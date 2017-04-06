From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Thu, 6 Apr 2017 16:56:36 +0200
Message-ID: <9b3f8e46-0798-b232-d930-3c1ebefbbcb8@gmail.com>
References: <1491470130-6655-1-git-send-email-alexey_firago@mentor.com>
 <1491470130-6655-4-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491470130-6655-4-git-send-email-alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/06/2017 11:15 AM, Alexey Firago wrote:
> Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
> two clock inputs (internal XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
> 
> Current driver supports up to 2 FODs and up to 3 clock outputs. This
> patch sets max number of supported FODs to 4 and max number of supported
> clock outputs to 5.
> 
> Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I really like how easily this driver could be extended :)

> ---
>  drivers/clk/clk-versaclock5.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 4e81fb1..34c4e5a 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -114,10 +114,10 @@
>  #define VC5_MUX_IN_CLKIN	BIT(1)
>  
>  /* Maximum number of clk_out supported by this driver */
> -#define VC5_MAX_CLK_OUT_NUM	3
> +#define VC5_MAX_CLK_OUT_NUM	5
>  
>  /* Maximum number of FODs supported by this driver */
> -#define VC5_MAX_FOD_NUM	2
> +#define VC5_MAX_FOD_NUM	4
>  
>  /* flags to describe chip features */
>  /* chip has built-in oscilator */
> @@ -127,6 +127,7 @@
>  enum vc5_model {
>  	IDT_VC5_5P49V5923,
>  	IDT_VC5_5P49V5933,
> +	IDT_VC5_5P49V5935,
>  };
>  
>  /* Structure to describe features of a particular VC5 model */
> @@ -594,6 +595,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
>  	case IDT_VC5_5P49V5933:
>  		return (n == 0) ? 0 : 3;
>  	case IDT_VC5_5P49V5923:
> +	case IDT_VC5_5P49V5935:
>  	default:
>  		return n;
>  	}
> @@ -790,9 +792,17 @@ static const struct vc5_chip_info idt_5p49v5933_info = {
>  	.flags = VC5_HAS_INTERNAL_XTAL,
>  };
>  
> +static const struct vc5_chip_info idt_5p49v5935_info = {
> +	.model = IDT_VC5_5P49V5935,
> +	.clk_fod_cnt = 4,
> +	.clk_out_cnt = 5,
> +	.flags = VC5_HAS_INTERNAL_XTAL,
> +};
> +
>  static const struct i2c_device_id vc5_id[] = {
>  	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
>  	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
> +	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, vc5_id);
> @@ -800,6 +810,7 @@ MODULE_DEVICE_TABLE(i2c, vc5_id);
>  static const struct of_device_id clk_vc5_of_match[] = {
>  	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
>  	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
> +	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
