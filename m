From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 6/7] usb: chipidea: usbmisc: add mx53 support
Date: Wed, 21 Nov 2012 23:28:36 +0300
Message-ID: <50AD3974.4000608@mvista.com>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de> <1353506793-8354-7-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353506793-8354-7-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/21/2012 05:06 PM, Michael Grzeschik wrote:

> This adds mx53 as the next user of the usbmisc driver and makes it
> possible to disable the overcurrent-detection of the internal phy.

> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v2:
> * added defines for register offsets and bitmasks
> * fixed disable_oc option for all ports

>  drivers/usb/chipidea/usbmisc_imx.c |   51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index e090e0f..b1811df 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -19,6 +19,13 @@
>  
>  #define USB_DEV_MAX 4
>  
> +#define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08;
> +#define MX53_USB_UH2_CTRL_OFFSET	0x14;
> +#define MX53_USB_UH3_CTRL_OFFSET	0x18;

   Semicolons here? This can't be right.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
