From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Add USB remote wakeup driver
Date: Fri, 15 Dec 2017 14:55:04 -0600
Message-ID: <20171215205504.r6ol7fbbeyghb73w@rob-hp-laptop>
References: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512809136-2779-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 09, 2017 at 04:45:29PM +0800, Chunfeng Yun wrote:
>     These patches introduce the SSUSB and SPM glue layer driver which is
> used to support usb remote wakeup. Usually the glue layer is put into
> a system controller, such as PERICFG module.
>     The old way to support usb wakeup is put into SSUSB controller drivers,
> including xhci-mtk driver and mtu3 driver, but there are some problems:
>     1. can't disdinguish the relation between glue layer and SSUSB IP
>        when SoCs supports multi SSUSB IPs;
>     2. duplicated code for wakeup are put into both xhci-mtk and mtu3
>        drivers;
>     3. the glue layer may vary on different SoCs with SSUSB IP, and will
>        make SSUSB controller drivers complicated;
>     In order to resolve these problems, it's useful to make the glue layer
> transparent by extracting a seperated driver, meanwhile to reduce the
> duplicated code and simplify SSUSB controller drivers.

Both the driver and binding look overly complicated to me when it looks 
like you just have 2 versions of enable/disable functions which modify 
a single register. The complexity may be justified if this was a common 
binding and driver, but it is not.

You already have a phandle to the system controller. Can't you add cells 
to it to handle any differences between instances? That and SoC specific 
compatible strings should be enough to handle differences.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
