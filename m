From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v2 3/4] usb: musb: Kconfig: Drop dependency on
 MACH_JZ4740 for jz4740
Date: Tue, 15 Jan 2019 10:26:03 -0600
Message-ID: <20190115162603.GB18026@uda0271908>
References: <20190110133700.4471-1-paul@crapouillou.net>
 <20190110133700.4471-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110133700.4471-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Thu, Jan 10, 2019 at 10:36:59AM -0300, Paul Cercueil wrote:
> Depending on MACH_INGENIC prevent us from creating a generic kernel that

Again, did you mean MACH_JZ4740 instead?

> works on more than one MIPS board. Instead, we just depend on MIPS being
> set.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> v2: Remove info about adding COMPILE_TEST in commit message, as it was
>     there before
> 
>  drivers/usb/musb/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
> index ad08895e78f9..6f5b0ed6a507 100644
> --- a/drivers/usb/musb/Kconfig
> +++ b/drivers/usb/musb/Kconfig
> @@ -111,7 +111,7 @@ config USB_MUSB_UX500
>  config USB_MUSB_JZ4740
>  	tristate "JZ4740"
>  	depends on NOP_USB_XCEIV
> -	depends on MACH_JZ4740 || COMPILE_TEST
> +	depends on MIPS || COMPILE_TEST
>  	depends on USB_MUSB_GADGET
>  	depends on USB_OTG_BLACKLIST_HUB
  
Regards,
-Bin.
