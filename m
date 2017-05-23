From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] irqchip: aspeed: Add AST2500 compatible string
Date: Mon, 22 May 2017 19:06:32 -0500
Message-ID: <20170523000632.ojdfqpyn5bklcrni@rob-hp-laptop>
References: <20170516075747.23067-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170516075747.23067-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 03:57:47PM +0800, Andrew Jeffery wrote:
> In addition to introducing the new compatible string the bindings
> description is reworked to be more generic.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/aspeed,ast2400-vic.txt         | 9 +++++----
>  drivers/irqchip/irq-aspeed-vic.c                                 | 3 ++-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
