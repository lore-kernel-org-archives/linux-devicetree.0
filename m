From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0020/1529] Fix typo
Date: Sat, 21 May 2016 12:54:30 +0100
Message-ID: <20160521125430.7372e13c@arm.com>
References: <20160521113800.32313-1-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160521113800.32313-1-andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 21 May 2016 13:38:00 +0200
Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org> wrote:

Andrea,

> Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> index 448273a..512de9d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
> @@ -8,7 +8,7 @@ Required properties:
>  - #interrupt-cells: specifies the number of cells needed to encode an
>    interrupt source. Should be 1.
>  - interrupt-parent: specifies the phandle to the parent interrupt controller
> -  this controller is cacaded from
> +  this controller is cached from

No. The word you're looking for is "cascaded"...

>  - interrupts: specifies the interrupt line in the interrupt-parent irq space
>    to be used for cascading
>  

... as used here.

Frankly, I'd rather have spelling mistakes instead of random words that
make absolutely no sense. So if you don't understand what this document
is about, please do not try to fix it.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
