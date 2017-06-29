From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: aspeed: g4: Add USB functions to pinctrl
 bindings
Date: Thu, 29 Jun 2017 15:12:25 -0500
Message-ID: <20170629201225.exf4ax6az3m6zeb4@rob-hp-laptop>
References: <20170627021214.23323-1-andrew@aj.id.au>
 <20170627021214.23323-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170627021214.23323-2-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 11:42:11AM +0930, Andrew Jeffery wrote:
> The AST2400 contains several USB controllers:
> 
> * USB 1.1 Host Controller
> * USB 2.0 Host Controller
> * Combined USB 2.0 Virtual Hub and USB 1.1 HID Controller
> 
> Pins for three ports are routed to the three controllers such that:
> 
> * Port 1 is a dedicated USB 1.1 host port
> * Port 2 is shared between the USB 1.1 host and HID controllers
> * Port 3 is shared between the USB 2.0 host and Hub controllers
> 
> As the pins for port 1 are fixed function there is no associated mux
> function or group described in the bindings. Ports 2 and 3 are muxed as
> above, and the table below describes the mapping between pinmux function
> names and ports:
> 
> Port  | USB Version  | USB Mode  | Mux Function
> ------|--------------|-----------|-------------
> 1     | 1.1          | Host      | -
> 2     | 1.1          | Host      | USB11H2
> 2     | 1.1          | Device    | USB11D1
> 3     | 2.0          | Host      | USB2H1
> 3     | 2.0          | Device    | USB2D1
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
