From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH] imx2_wdt: expose module alias for loading from device-tree
Date: Tue, 29 Oct 2013 08:36:03 +0100
Message-ID: <20131029073603.GB19569@spo001.leaseweb.com>
References: <1375083498-14822-1-git-send-email-ndevos@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1375083498-14822-1-git-send-email-ndevos@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niels de Vos <ndevos@redhat.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Niels,

> Enable auto loading by udev when imx2_wdt is compiled as a module.
> 
> Signed-off-by: Niels de Vos <ndevos@redhat.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/watchdog/imx2_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 693ac3f..17680aa 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -322,6 +322,7 @@ static const struct of_device_id imx2_wdt_dt_ids[] = {
>  	{ .compatible = "fsl,imx21-wdt", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx2_wdt_dt_ids);
>  
>  static struct platform_driver imx2_wdt_driver = {
>  	.remove		= __exit_p(imx2_wdt_remove),

This has been added to linux-watchdog-next.

Kind regards,
Wim.
