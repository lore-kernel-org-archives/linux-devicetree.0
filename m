From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 4/4] usb: musb: jz4740: Drop dependency on
 USB_OTG_BLACKLIST_HUB
Date: Mon, 7 Jan 2019 14:11:19 -0600
Message-ID: <20190107201119.GD25910@uda0271908>
References: <20181213144555.24031-1-paul@crapouillou.net>
 <20181213144555.24031-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213144555.24031-4-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Hi,

Please use the following subject instead.

	usb: musb: Kconfig: Drop dependency on USB_OTG_BLACKLIST_HUB for jz4740

Regards,
-Bin.

On Thu, Dec 13, 2018 at 03:45:55PM +0100, Paul Cercueil wrote:
> The USB IP in the JZ4740 SoC does not support host mode, only gadget
> mode.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/usb/musb/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
> index 6f5b0ed6a507..a884179bc3c0 100644
> --- a/drivers/usb/musb/Kconfig
> +++ b/drivers/usb/musb/Kconfig
> @@ -113,7 +113,6 @@ config USB_MUSB_JZ4740
>  	depends on NOP_USB_XCEIV
>  	depends on MIPS || COMPILE_TEST
>  	depends on USB_MUSB_GADGET
> -	depends on USB_OTG_BLACKLIST_HUB
>  
>  config USB_MUSB_AM335X_CHILD
>  	tristate
> -- 
> 2.11.0
> 
