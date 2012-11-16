From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 5/7] usb: chipidea: usbmisc: add support for ahb, ipg and per clock
Date: Fri, 16 Nov 2012 15:17:47 +0200
Message-ID: <87r4nt6610.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352981028-14312-1-git-send-email-m.grzeschik@pengutronix.de> <1352981028-14312-6-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352981028-14312-6-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> This patch adds support for a second and third clock to the usbmisc driver. On
> modern freescale ARM cores like the imx51, imx53 and imx6q three clocks ("ahb",
> "ipg" and "per") must be enabled in order to access the USB core.
>
> ahb - AMBA High-Performance Bus clock domain
> ipg - IP-Bus Gate clock domain
> per - Peripheral clock domain

Looks like usbmisc_imx and ci13xxx_imx are growing more and more common
code.
Btw, shouldn't there be a way to specify platform's clock tree
configuration via devicetree or whatnot so that each platform driver
didn't have to request platform specific clocks?

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
