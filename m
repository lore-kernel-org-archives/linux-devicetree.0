From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/7] serial: pxa: add OF support
Date: Mon, 5 Mar 2012 12:55:37 +0000
Message-ID: <201203051255.37311.arnd@arndb.de>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-2-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330950111-30797-2-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 05 March 2012, Haojian Zhuang wrote:

>  
> +#define PXA_NAME_LEN		8
> +
>  struct uart_pxa_port {
>  	struct uart_port        port;
>  	unsigned char           ier;

Why didn't you just add a field here with that length?

> @@ -781,6 +784,39 @@ static const struct dev_pm_ops serial_pxa_pm_ops = {
>  };
>  #endif
>  
> +static struct of_device_id serial_pxa_dt_ids[] = {
> +	{ .compatible = "mrvl,pxa-uart", },
> +	{ .compatible = "mrvl,mmp-uart", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, serial_pxa_dt_ids);

This one should have an #ifdef CONFIG_OF

> +#ifdef CONFIG_OF
> +static int serial_pxa_probe_dt(struct platform_device *pdev,
> +			       struct uart_pxa_port *sport)
> +{

While this one does not need it: it will already compile to nothing
if you check the error value correctly.

> +	sport->name = kzalloc(PXA_NAME_LEN, GFP_KERNEL);
> +	if (!sport->name) {
> +		ret = -ENOMEM;
> +		goto err_clk;
>  	}

No need for this allocation if you put the name into uart_pxa_port
as a member instead of a pointer.

> +		.of_match_table = serial_pxa_dt_ids,
>  	},
>  };

		.of_match_table = of_match_ptr(serial_pxa_dt_ids),

	Arnd
