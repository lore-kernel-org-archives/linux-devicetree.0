From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/7] serial: pxa: add OF support
Date: Tue, 6 Mar 2012 15:02:07 +0000
Message-ID: <201203061502.08097.arnd@arndb.de>
References: <201203051255.37311.arnd@arndb.de>
 <1331001730-13429-1-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331001730-13429-1-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 06 March 2012, Haojian Zhuang wrote:

> @@ -51,7 +54,7 @@ struct uart_pxa_port {
>  	unsigned char           mcr;
>  	unsigned int            lsr_break_flag;
>  	struct clk		*clk;
> -	char			*name;
> +	char			name[PXA_NAME_LEN];
>  };

This looks better now

>  static inline unsigned int serial_in(struct uart_pxa_port *up, int offset)
> @@ -781,6 +784,33 @@ static const struct dev_pm_ops serial_pxa_pm_ops = {
>  };
>  #endif
>  
> +#ifdef CONFIG_OF
> +static struct of_device_id serial_pxa_dt_ids[] = {
> +	{ .compatible = "mrvl,pxa-uart", },
> +	{ .compatible = "mrvl,mmp-uart", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, serial_pxa_dt_ids);
> +#endif

If you do this, you have to use of_match_ptr for referencing
serial_pxa_dt_ids or you will get a link error when CONFIG_OF is
disabled.

> @@ -850,6 +876,7 @@ static int serial_pxa_remove(struct platform_device *dev)
>  	platform_set_drvdata(dev, NULL);
>  
>  	uart_remove_one_port(&serial_pxa_reg, &sport->port);
> +	kfree(sport->name);
>  	clk_put(sport->clk);
>  	kfree(sport);
>  

And this must be removed now that sport->name is allocated as part of sport.

	Arnd
