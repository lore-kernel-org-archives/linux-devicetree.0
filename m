From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small
 fixes
Date: Wed, 28 Nov 2012 10:52:18 +0800
Message-ID: <20121128025217.GC18593@nchen-desktop>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1354033021-10585-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2012 at 05:16:55PM +0100, Michael Grzeschik wrote:
> Nearly every SoC from Freescale has this non-core usb registers. This series
> adds support for more users of this driver.
> 
> This series is based on Peter Chen's work. Its needed to merge his master branch
> before applying this series:
> 
> https://github.com/hzpeterchen/linux-usb.git

I have tested it at i.mx6q sabrelite board, it works good.

I have pushed your commit to my git, please cc me
your coming chipidea patches, thanks.

Alex, please add:

Reviewed-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Tested-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>


> 
> Changes since v3:
> * removed [PATCH v3 5/7] usb: chipidea: usbmisc: add support for ahb, ipg and per clock
> 
> 
> Marc Kleine-Budde (3):
>   usb: chipidea: usbmisc: unset global varibale usbmisc on driver remove
>   usb: chipidea: usbmisc: fix a potential race condition
>   usb: chipidea: usbmisc: prepare driver to handle more than one soc
> 
> Michael Grzeschik (3):
>   usb: chipidea: usbmisc: rename file, struct and functions to usbmisc_imx
>   usb: chipidea: usbmisc: add mx53 support
>   usb: chipidea: usbmisc: add post handling and errata fix for mx25
> 
>  .../devicetree/bindings/usb/ci13xxx-imx.txt        |    2 +
>  drivers/usb/chipidea/Makefile                      |    2 +-
>  drivers/usb/chipidea/ci13xxx_imx.c                 |   12 +
>  drivers/usb/chipidea/ci13xxx_imx.h                 |    3 +
>  drivers/usb/chipidea/usbmisc_imx.c                 |  252 ++++++++++++++++++++
>  drivers/usb/chipidea/usbmisc_imx6q.c               |  162 -------------
>  6 files changed, 270 insertions(+), 163 deletions(-)
>  create mode 100644 drivers/usb/chipidea/usbmisc_imx.c
>  delete mode 100644 drivers/usb/chipidea/usbmisc_imx6q.c
> 
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
