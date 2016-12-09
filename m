From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] mfd: dt: ranges, #address-cells and #size-cells
 as optional properties
Date: Fri, 9 Dec 2016 16:49:27 -0600
Message-ID: <20161209224927.3indhfdjgyndtjid@rob-hp-laptop>
References: <20161206025321.1792-1-andrew@aj.id.au>
 <20161206025321.1792-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161206025321.1792-3-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 01:53:17PM +1100, Andrew Jeffery wrote:
> Whilst describing a device and not a bus, simple-mfd is modelled on
> simple-bus where child nodes are iterated and registered as platform
> devices. Some complex devices, e.g. the Aspeed LPC controller, can
> benefit from address space mapping such that child nodes can use the
> regs property to describe their resources within the multi-function
> device.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mfd.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

No objections to this, but this is all implied by having a reg property.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
