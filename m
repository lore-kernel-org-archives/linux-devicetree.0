From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] usb: xhci: allow imod-interval to be configurable
Date: Wed, 6 Dec 2017 15:21:02 -0600
Message-ID: <20171206212102.w7joyecp25v6nw5v@rob-hp-laptop>
References: <1512397671-28733-1-git-send-email-awallis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512397671-28733-1-git-send-email-awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 04, 2017 at 09:27:51AM -0500, Adam Wallis wrote:
> The xHCI driver currently has the IMOD set to 160, which
> translates to an IMOD interval of 40,000ns (160 * 250)ns
> 
> Commit 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
> introduced a QUIRK for the MTK platform to adjust this interval to 20,
> which translates to an IMOD interval of 5,000ns (20 * 250)ns. This is
> due to the fact that the MTK controller IMOD interval is 8 times
> as much as defined in xHCI spec.
> 
> Instead of adding more quirk bits for additional platforms, this patch
> introduces the ability for vendors to set the IMOD_INTERVAL as is
> optimal for their platform. By using device_property_read_u32() on
> "imod-interval-ns", the IMOD INTERVAL can be specified in nano seconds.
> If no interval is specified, the default of 40,000ns (IMOD=160) will be
> used.
> 
> No bounds checking has been implemented due to the fact that a vendor
> may have violated the spec and would need to specify a value outside of
> the max 8,000 IRQs/second limit specified in the xHCI spec.
> 
> Tested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> changes from v3:
>   * Changed imod-interval to imod-interval-ns [Rob Herring/Chunfeng]
>   * Changed "modulation" to "moderation" throughout patch [Mathias]
> changes from v2:
>   * Added PCI default value [Mathias]
>   * Removed xhci-mtk.h from xhci-plat.c [Chunfeng Yun]
>   * Removed MTK quirk from xhci-plat and moved logic to xhci-mtk [Chunfeng]
>   * Updated bindings Documentation to use proper units [Rob Herring]
>   * Added imod-interval description and example to MTK binding documentation
> changes from v1:
>   * Removed device_property_read_u32() per suggestion from greg k-h
>   * Used ER_IRQ_INTERVAL_MASK in place of (u16) cast
> 
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 2 ++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt          | 1 +
>  drivers/usb/host/xhci-mtk.c                                 | 9 +++++++++
>  drivers/usb/host/xhci-pci.c                                 | 3 +++
>  drivers/usb/host/xhci-plat.c                                | 5 +++++
>  drivers/usb/host/xhci.c                                     | 7 ++-----
>  drivers/usb/host/xhci.h                                     | 2 ++
>  7 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
