From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v4] usb: ehci-hcd: notify phy when connect change
Date: Wed, 6 Jun 2012 10:19:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1206061017210.1788-100000@iolanthe.rowland.org>
References: <1338946190-19105-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1338946190-19105-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 6 Jun 2012, Richard Zhao wrote:

> It still has below limitations:
> - it does not work for multi-phy ehci
> - the best place is after debounce, but I can't get
>   phy there

> +			/* FIXME:
> +			 * - it does not work for multi-phy ehci
> +			 * - the best place is after debounce, but I can't get
> +			 *   phy there
> +			 */
> +			if (unlikely(ehci->transceiver &&
> +					(pstatus & PORT_CSC))) {

A new thought...  If you move the transceiver pointer from struct 
ehci_hcd to struct usb_hcd, then you _will_ be able to get at it from 
within the debouncing routine.

Or if you prefer, leave the pointer where it is and add a method to 
struct hc_driver for retrieving the pointer.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
