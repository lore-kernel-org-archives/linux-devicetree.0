From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add amcc,dwc-otg device tree definition
Date: Mon, 14 Nov 2016 10:04:20 -0600
Message-ID: <20161114160420.rmp3y6ypq2wqzjra@rob-hp-laptop>
References: <20161106005608.26386-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161106005608.26386-1-chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 06, 2016 at 01:56:08AM +0100, Christian Lamparter wrote:
> This patch adds support for the "amcc,usb-otg" device
> which is found in the PowerPC Canyonlands' dts.
> 
> The device definition was added by:
> commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands board")'.
> AMCC produced a standalone driver that was sent to the
> linuxppc-dev at the time. However, it was never integrated.
> 
> Signed-off-by: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> For anyone interested: the driver was sent to the ML multiple times back
> in 2012 [0], [1].
> 
> [0] <https://lists.ozlabs.org/pipermail/linuxppc-dev/2012-May/097847.html>
> [1] <https://lists.ozlabs.org/pipermail/linuxppc-dev/2012-May/097938.html>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  1 +

I would say this needs to be more specific, but given it has been there 
for 6 years:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/dwc2/platform.c                    | 33 ++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
