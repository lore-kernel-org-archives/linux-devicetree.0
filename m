From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/8] gpio: dt-bindings: Add documentation for Aspeed
 GPIO controllers
Date: Fri, 19 Aug 2016 09:36:42 -0500
Message-ID: <20160819143641.GA19513@rob-hp-laptop>
References: <20160819124414.24242-1-andrew@aj.id.au>
 <20160819124414.24242-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160819124414.24242-5-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 10:14:10PM +0930, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
> 
> Since v1:
> 
> Rob: I haven't added your Acked-by here as I've made the following changes and
> wanted to get your input:
> 
> * Remove interrupt-controller as an optional property
> * Defer to interrupt-controller bindings document for sub-node properties
> 
> I had a discussion with Joel about whether the interrupt-controller capability
> should be optional and the conclusion was that it should always be configured
> by the driver. This makes an optional interrupt-controller property feel
> redundant (and possibly inaccurate if left out) so I've removed it.

I don't follow. What do you mean byt "configured by the driver". If the 
block supports interrupts, then it should be marked as an 
interrupt-controller. It never should have been optional. The OS can 
ignore the interrupt properties if it chooses. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
