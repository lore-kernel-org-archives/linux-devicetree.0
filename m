From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: gadget: pxa27x_udc device-tree documentation
Date: Mon, 22 Sep 2014 09:11:02 +0200
Message-ID: <3258784.43juqYcFKU@wuerfel>
References: <1411155986-14895-1-git-send-email-robert.jarzmik@free.fr> <1411155986-14895-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411155986-14895-3-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 19 September 2014 21:46:24 Robert Jarzmik wrote:
> Add documentation for device-tree binding of arm PXA 27x udc (usb
> device) driver.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> ---
> Since V1: change OF id mrvl,pxa27x_udc -> marvell,pxa27x-udc
>           This is a consequence of other DT reviews on the marvell
>           namings.
> Since V2: Mark's review
>           - described standard properties
>           - use standard gpio bindings for pullup gpio
> Since V3: Arnd's review
>           - removed clock-names
> 

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
