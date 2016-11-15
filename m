From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/30] usb: dwc2: Deprecate g-use-dma binding
Date: Mon, 14 Nov 2016 18:05:55 -0600
Message-ID: <20161115000555.fqemw7uuvphqpe2b@rob-hp-laptop>
References: <cover.1478748145.git.johnyoun@synopsys.com>
 <966d342a5a7fee9ac3ef8140b60c228c4a87c7d3.1478748145.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <966d342a5a7fee9ac3ef8140b60c228c4a87c7d3.1478748145.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 07:27:40PM -0800, John Youn wrote:
> This is not needed as the gadget now fully supports DMA and it can
> autodetect it. This was initially added because gadget DMA mode was only
> partially implemented so could not be automatically enabled.
> 
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  4 +++-
>  arch/arm/boot/dts/rk3036.dtsi                  |  1 -
>  arch/arm/boot/dts/rk3288.dtsi                  |  1 -
>  arch/arm/boot/dts/rk3xxx.dtsi                  |  1 -
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  1 -
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi       |  1 -
>  drivers/usb/dwc2/core.h                        |  4 +---
>  drivers/usb/dwc2/params.c                      | 17 ++++++++++++++---
>  drivers/usb/dwc2/pci.c                         |  1 -
>  9 files changed, 18 insertions(+), 13 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
