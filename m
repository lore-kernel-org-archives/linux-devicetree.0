From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Fri, 16 Nov 2012 14:18:48 +0200
Message-ID: <8739097nbr.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352909950-32555-7-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> This patch makes it possible to configure the PTW and PTS bits inside
> the portsc register for host and device mode before the driver starts
> and the phy can be addressed as hardware implementation is designed.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/chipidea/bits.h        |    3 +++
>  drivers/usb/chipidea/ci.h          |    2 ++
>  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
>  drivers/usb/chipidea/core.c        |   47 ++++++++++++++++++++++++++++++++++++
>  drivers/usb/chipidea/host.c        |    4 +++
>  include/linux/usb/chipidea.h       |    9 +++++++
>  6 files changed, 66 insertions(+)
>
> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
> index 4b6ae3e..3cded5f 100644
> --- a/drivers/usb/chipidea/bits.h
> +++ b/drivers/usb/chipidea/bits.h
> @@ -48,6 +48,9 @@
>  #define PORTSC_SUSP           BIT(7)
>  #define PORTSC_HSP            BIT(9)
>  #define PORTSC_PTC            (0x0FUL << 16)
> +#define PORTSC_PTS            (BIT(31) | BIT(30))
> +#define PORTSC_PTW            BIT(28)
> +#define PORTSC_STS            BIT(29)
>  
>  /* DEVLC */
>  #define DEVLC_PSPD            (0x03UL << 25)
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index cd42b59..1439e51 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -314,6 +314,8 @@ static inline u32 hw_test_and_write(struct ci13xxx *ci, enum ci13xxx_regs reg,
>  	return (val & mask) >> ffs_nr(mask);
>  }
>  
> +void hw_portsc_configure(struct ci13xxx *ci);
> +
>  int hw_device_reset(struct ci13xxx *ci, u32 mode);
>  
>  int hw_port_test_set(struct ci13xxx *ci, u8 mode);
> diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
> index ee4dab0..a8257b8 100644
> --- a/drivers/usb/chipidea/ci13xxx_imx.c
> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
> @@ -133,6 +133,7 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>  		       CI13XXX_PULLUP_ON_VBUS |
>  		       CI13XXX_DISABLE_STREAMING |
>  		       CI13XXX_REGS_SHARED,
> +	ci13xxx_get_dr_flags(pdev->dev.of_node, pdata);

It will be a bit easier to read if this one and ci13xxx_get_dr_mode()
calls are next to one another. Also my comment about get_dr_mode()
probably applies here too.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
