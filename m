From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 0/4] IIO wrapper drivers, dpot-dac and envelope-detector
Date: Thu, 20 Oct 2016 17:29:16 +0200
Message-ID: <30a4b562-f553-2620-e961-c2904bce9c51@metafoo.de>
References: <1476955562-13673-1-git-send-email-peda@axentia.se>
 <9b8c0789-566d-67a3-b4f5-dbe4c69f6932@metafoo.de>
 <7472292a-a509-c791-4eff-5a5037ead837@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7472292a-a509-c791-4eff-5a5037ead837-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2016 04:53 PM, Peter Rosin wrote:
[...]
> Good idea! Then the "envelope-detector,inverted" bool can go, and be
> implied by the compatible string. If some way to rebind the irq trigger
> is later discovered that can be added as a channel attr without
> deprecating any dt bindings stuff. While at it, the other properties
> ("envelope-detector,dac-max" and "envelope-detector,comp-interval-ms")
> could also be implied from the compatible string. Would that be better?
> I think so.
> 
> But, the compatible string is one thing and the driver name is another.
> "axentia,tse850-envelope-detector" doesn't seem like the best of driver
> names...

The driver name is not that important we can still change that later if we
have to, the DT compatible string on the other hand is fixed.

> 
> Are there any existing examples of drivers for (generic) things built
> with discrete components like this that could perhaps provide guidance?

Not that I'm aware of.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
