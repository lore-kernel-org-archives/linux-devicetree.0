From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 1/2] usb: chipidea: fix mistake in device tree binding
 of nspire-usb to use vendor name 'lsi' instead of SoC name 'zevio'
Date: Wed, 4 Dec 2013 21:44:34 +0800
Message-ID: <20131204134433.GD1573@shlinux1.ap.freescale.net>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dt.tangr@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 04, 2013 at 08:20:07PM +1100, dt.tangr@gmail.com wrote:
> From: Daniel Tang <dt.tangr@gmail.com>
> 
> The SoC name was mistakenly used instead of the vendor name in the
> device tree binding for nspire-usb.
> 
> This patch fixes this before the driver becomes widely adopted.
> 
> Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt |    4 ++--
>  drivers/usb/chipidea/ci_hdrc_nspire.c                    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> index 5ba8e90..ef1fcbf 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> @@ -1,7 +1,7 @@
>  * TI-Nspire USB OTG Controller
>  
>  Required properties:
> -- compatible: Should be "zevio,nspire-usb"
> +- compatible: Should be "lsi,nspire-usb"

lsi is vendor name, what are zevio and nspire?
Usually, the compatible string should be "vendor_name,soc_name-module_name"

>  - reg: Should contain registers location and length
>  - interrupts: Should contain controller interrupt
>  
> @@ -11,7 +11,7 @@ Recommended properies:
>  Examples:
>  		usb0: usb@B0000000 {
>  			reg = <0xB0000000 0x1000>;
> -			compatible = "zevio,nspire-usb";
> +			compatible = "lsi,nspire-usb";
>  			interrupts = <8>;
>  			vbus-supply = <&vbus_reg>;
>  		};
> diff --git a/drivers/usb/chipidea/ci_hdrc_nspire.c b/drivers/usb/chipidea/ci_hdrc_nspire.c
> index 517ce41..c5c2dde 100644
> --- a/drivers/usb/chipidea/ci_hdrc_nspire.c
> +++ b/drivers/usb/chipidea/ci_hdrc_nspire.c
> @@ -52,7 +52,7 @@ static int ci_hdrc_nspire_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id ci_hdrc_nspire_dt_ids[] = {
> -	{ .compatible = "zevio,nspire-usb", },
> +	{ .compatible = "lsi,nspire-usb", },
>  	{ /* sentinel */ }
>  };
>  
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Best Regards,
Peter Chen
