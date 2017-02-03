From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC PATCH] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Fri, 3 Feb 2017 10:03:27 +0100
Message-ID: <20170203090327.GA27160@kroah.com>
References: <1486043069-1575-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486043069-1575-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 02:44:29PM +0100, Richard Leitner wrote:
> This patch adds a driver for configuration of the Microchip USB251xB/xBi
> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
> configuration interface and two to four USB 2.0 downstream ports.
> 
> Furthermore add myself as a maintainer for this driver.
> 
> The datasheet can be found at the manufacturers website, see [1]. All
> device-tree exposed configuration features have been tested on a i.MX6
> platform with a USB2512B hub.
> 
> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
> 
> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>

What is "RFC" about this?  If you don't think it's ready to be merged,
I'll agree with that and so I've deleted it from my review queue :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
