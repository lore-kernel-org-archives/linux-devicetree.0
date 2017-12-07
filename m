From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] uio: Introduce UIO driver dt-binding documentation
Date: Thu, 7 Dec 2017 17:42:30 -0600
Message-ID: <20171207234230.k62qpsgabqueewwd@rob-hp-laptop>
References: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
 <1512658019-30279-1-git-send-email-andrey.z@gmail.com>
 <1512658019-30279-3-git-send-email-andrey.z@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512658019-30279-3-git-send-email-andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 03:46:59PM +0100, Andrey Zhizhikin wrote:
> Create Documentation portion of UIO driver with Generic Interrupt Handler.
> 
> This patch creates a dt-binding documentation portion of the UIO Driver.
> 
> In addition to definition of standard required properties, new optional
> property defined:
> - no-threaded-irq: when present, request_irq() is called with
>   IRQF_NO_THREAD flag set, effectively skipping threaded interrupt
>   handler and taking bottom-half into irq_handler
> 
> Signed-off-by: Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> diff --git a/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
> new file mode 100644
> index 0000000..dfcc362
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/uio/uio-pdrv-genirq.txt
> @@ -0,0 +1,46 @@
> +* Userspace I/O platform driver with generic IRQ handling code.

No. See prior discussions:

https://lkml.org/lkml/2016/5/18/457
https://lkml.org/lkml/2017/10/8/238
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
