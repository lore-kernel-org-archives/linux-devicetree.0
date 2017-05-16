From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: irq: use of_irq_get() in of_irq_to_resource()
Date: Tue, 16 May 2017 09:15:32 -0500
Message-ID: <20170516141532.zjbseynfkpuxkcme@rob-hp-laptop>
References: <1494936544-27541-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494936544-27541-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 02:09:04PM +0200, Thomas Petazzoni wrote:
> of_irq_to_resource() currently uses irq_of_parse_and_map() to
> translate a DT interrupt specification into a Linux virtual interrupt
> number. While this works in most cases, irq_of_parse_and_map() doesn't
> properly handle the case where the interrupt controller is not yet
> available (due to deferred probing for example).
> 
> So instead, use of_irq_get(), which is implemented exactly like
> irq_of_parse_and_map(), with the exception that if the interrupt
> controller is not yet available, it returns -EPROBE_DEFER. Obviously,
> we also handle this error and bail out from of_irq_to_resource() when
> of_irq_get() returns an error.
> 
> This allows to avoid silly error messages at boot time caused by
> irq_create_of_mapping() when the interrupt controller is not
> available:
> 
> [    0.153168] irq: no irq domain found for /ap806/config-space@f0000000/interrupt-controller@3f0100 !
> [    0.154041] irq: no irq domain found for /cp110-master/config-space@f2000000/interrupt-controller@1e0000 !
> [    0.154124] irq: no irq domain found for /cp110-master/config-space@f2000000/interrupt-controller@1e0000 !
> [    0.154207] irq: no irq domain found for /cp110-master/config-space@f2000000/interrupt-controller@1e0000 !
> [    0.154437] irq: no irq domain found for /cp110-master/config-space@f2000000/interrupt-controller@1e0000 !
> [    0.154518] irq: no irq domain found for /cp110-master/config-space@f2000000/interrupt-controller@1e0000 !
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/of/irq.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied.

BTW, the reason we have both irq_of_parse_and_map and of_irq_get is 
irq_of_parse_and_map returns NO_IRQ or an irq. Adding an errno may not 
get handled correctly and it's not as simple as auditing the call sites.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
