From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] USB: add device-tree support for interfaces
Date: Thu, 16 Nov 2017 08:43:21 -0600
Message-ID: <20171116144321.hlp6em77t56e5nly@rob-hp-laptop>
References: <20171109170723.10960-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171109170723.10960-1-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 06:07:15PM +0100, Johan Hovold wrote:
> This series adds support for representing USB interfaces in device tree
> by implementing support for "interface nodes" and "combined nodes" from
> the OF specification.
> 
> This is needed to be able to describe non-discoverable properties of
> permanently attached USB devices and their interfaces such as any
> i2c-clients connected to a USB-i2c bridge (e.g. the dln2 mfd) or,
> eventually, devices connected to usb-serial converters (to be used with
> serdev).

In the original OF binding, the firmware dynamically generated the tree 
for the active configuration AIUI. That doesn't really fit for the 
(mostly) static FDT usage and why we stopped at the device level. So how 
do we handle multiple configs? Or can we assume that if say the I2C bus 
is used, then there's only one config and interface that can use it?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
