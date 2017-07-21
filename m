From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: irq: fix of_irq_to_resource() error check
Date: Fri, 21 Jul 2017 17:07:52 -0500
Message-ID: <20170721220752.3tn622apuetutbor@rob-hp-laptop>
References: <20170721173108.578363976@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170721173108.578363976-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 21, 2017 at 08:30:39PM +0300, Sergei Shtylyov wrote:
> of_irq_to_resource() has recently been fixed to return negative error #'s
> along with 0, however of_irq_to_resource_table() still only regards 0 as
> invalid IRQ -- fix it up.
> 
> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
> The patch is against the 'dt/linus' branch of Rob Herring's 'linux.git' repo.
> 
>  drivers/of/irq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

BTW, all the users of of_irq_to_resource_table outside of the DT 
platform code are erroneous IMO. Either the resources are already 
available when probing or only a single resource is retrieved. These may 
have been working around a problem that some resources couldn't be 
resolved at device creation time which is now fixed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
