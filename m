From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 02/10] usb: chipidea: define stream mode disable for both
 roles
Date: Wed, 29 Jul 2015 07:51:55 +0200
Message-ID: <20150729055155.GD18700@pengutronix.de>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
 <1438137734-27311-3-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438137734-27311-3-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Wed, Jul 29, 2015 at 10:42:06AM +0800, Peter Chen wrote:
> The system bus and chipidea IP have different limitations for
> both host and device mode.
> For example, with below errata, we need to enable SDIS(Stream Disable Mode)
> at host mode. But we don't want it for device mode at the same system.
> 
> TAR 9000378958
> Title: Non-Double Word Aligned Buffer Address Sometimes Causes Host to Hang on OUT Retry
> Impacted Configuration: Host mode, all transfer types
> Description:
> The host core operating in streaming mode may under run while sending the data packet of an OUT transaction. This under run can occur if there are unexpected system delays in fetching the remaining packet data from memory. The host forces a bad CRC on the packet, the device detects the error and discards the packet. The host then retries a Bulk, Interrupt, or Control transfer if an under run occurs according to the USB specification.

Please add linebreaks at 75 characters or so.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
