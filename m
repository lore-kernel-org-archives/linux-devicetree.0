From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv2 usb-next 3/3] usb: host: xhci: plat: integrate the
 platform-roothub
Date: Mon, 17 Jul 2017 12:58:02 -0500
Message-ID: <20170717175802.7khb2uxtg3gs7ndd@rob-hp-laptop>
References: <20170713105939.31566-1-martin.blumenstingl@googlemail.com>
 <20170713105939.31566-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170713105939.31566-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 12:59:39PM +0200, Martin Blumenstingl wrote:
> This enables the platform-roothub for the xhci-plat driver. This allows
> specifying a PHY for each port via devicetree. All PHYs will then be
> enabled/disabled by the platform-roothub driver.
> 
> One example where this is required is the Amlogic GXL and GXM SoCs:
> They are using a dwc3 USB controller with up to three ports enabled on
> the internal roothub. Using only the top-level "phy" properties does not
> work here since one can only specify one "usb2-phy" and one "usb3-phy",
> while actually at least two "usb2-phy" have to be specified.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  7 ++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/host/Kconfig                           |  1 +
>  drivers/usb/host/xhci-plat.c                       | 27 +++++++++++++++++++++-
>  drivers/usb/host/xhci.h                            |  2 ++
>  4 files changed, 36 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
