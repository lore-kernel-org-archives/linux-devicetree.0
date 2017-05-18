From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v1 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2
 HW LPM
Date: Thu, 18 May 2017 17:30:26 -0500
Message-ID: <20170518223026.vspw4p3nettjn3kx@rob-hp-laptop>
References: <1494634394-24388-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494634394-24388-1-git-send-email-tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Duc Tran <dxtran-qTEPVZfXA3Y@public.gmane.org>, Quang Han <qhan-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 13, 2017 at 07:13:14AM +0700, Thang Q. Nguyen wrote:
> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
> to always enable hardware USB2 LPM.
> However, the current xHCI driver always enable it by setting HLE=1 when
> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
> HW LPM fail to work as there is no way to disable this feature.
> This patch adds support to control disabling USB2 Hardware LPM via
> DT/ACPI attribute.
> 
> Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>  drivers/usb/host/xhci-plat.c                       |    3 +++
>  drivers/usb/host/xhci.c                            |    7 ++++++-
>  drivers/usb/host/xhci.h                            |    1 +
>  4 files changed, 11 insertions(+), 1 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 2d80b60..b5da569 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -26,6 +26,7 @@ Required properties:
>  
>  Optional properties:
>    - clocks: reference to a clock
> +  - usb2-hle-disable: disable USB2 LPM for hardware does not support it
>    - usb3-lpm-capable: determines if platform is USB3 LPM capable

Can we have some consistency in the naming of these 2 properties? At 
least use 'lpm' rather than 'hle'. I don't recall why the 2nd one is not 
default enabled, but that would make more sense.

>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
