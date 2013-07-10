From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] watchdog: dw: Enable OF support for DW watchdog timer.
Date: Wed, 10 Jul 2013 11:41:01 +0100
Message-ID: <20130710104101.GA3552@page>
References: <1373411377-5170-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1373411377-5170-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On Tue, Jul 09, 2013 at 06:09:37PM -0500, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> Add device tree support to the DW watchdog timer.
> 
> Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/dw_wdt.txt        |   16 ++++++++++++++++
>  drivers/watchdog/dw_wdt.c                          |    7 +++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 2037669..f7eec38 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -343,12 +343,19 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct of_device_id dw_wdt_of_match[] = {
> +	{ .compatible = "snps,dw-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dw_wdt_of_match);
> +
>  static struct platform_driver dw_wdt_driver = {
>  	.probe		= dw_wdt_drv_probe,
>  	.remove		= dw_wdt_drv_remove,
>  	.driver		= {
>  		.name	= "dw_wdt",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = dw_wdt_of_match,

I think we want:

		.of_match_table = of_match_ptr(dw_wdt_of_match),

as the module doesn't have an OF dependency.

Otherwise looks good to me.

Acked-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>

Thanks,

Jamie
