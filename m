From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 03/12] usb: ehci-hcd: notify phy when connect change
Date: Tue, 22 May 2012 06:23:49 +0200
Message-ID: <201205220623.49878.marex@denx.de>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <1337592237-5090-4-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337592237-5090-4-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

> It still has below limitations:
> - it does not work for multi-phy ehci
> - the best place is after debounce, but I can't get
>   phy there

Now, you'll laugh as this would be an obviously stupid question -- but where 
exactly does the debounce happen in the code?

> 
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/host/ehci-hcd.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 5597e60..389252e 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -928,6 +928,15 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>  			pstatus = ehci_readl(ehci,
>  					 &ehci->regs->port_status[i]);
> 
> +			/* FIXME:
> +			 * - it does not work for multi-phy ehci
> +			 * - the best place is after debounce, but I can't get
> +			 *   phy there
> +			 */
> +			if ((pstatus & PORT_CSC) && ehci->transceiver)
> +				usb_phy_notify_connect_change(ehci->transceiver,
> +						i, pstatus & PORT_CONNECT);
> +
>  			if (pstatus & PORT_OWNER)
>  				continue;
>  			if (!(test_bit(i, &ehci->suspended_ports) &&

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
