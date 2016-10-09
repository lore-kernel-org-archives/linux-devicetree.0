From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: xhci: add support for performing fake doorbell
Date: Sat, 8 Oct 2016 20:28:40 -0500
Message-ID: <20161009012840.GE18158@rob-hp-laptop>
References: <20161001215817.25384-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161001215817.25384-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 11:58:10PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Broadcom's Northstar XHCI controllers seem to need a special start
> procedure to work correctly. There isn't any official documentation on
> this, the problem is that controller doesn't detect any connected
> devices with default setup. Moreover connecting USB device to controller
> that doesn't run properly can cause SoC's watchdog issues.
> 
> A workaround that was successfully tested on multiple devices is to
> perform a fake doorbell. This patch adds code for doing that and a DT
> binding enabling it.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  2 +
>  drivers/usb/host/xhci-plat.c                       |  6 +++
>  drivers/usb/host/xhci.c                            | 63 ++++++++++++++++++++--
>  drivers/usb/host/xhci.h                            |  1 +
>  4 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 966885c..ce01b7f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -26,6 +26,8 @@ Required properties:
>  Optional properties:
>    - clocks: reference to a clock
>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> +  - usb3-fake-doorbell: determines if controller requires a fake doorbell when
> +			starting it

You should use Northstar XHCI compatible string to enable this. Then the 
DT doesn't need updating.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
