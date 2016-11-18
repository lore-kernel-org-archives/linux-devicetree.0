From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Fri, 18 Nov 2016 08:13:31 -0600
Message-ID: <20161118141331.pbzrw5dtkkwp7e75@rob-hp-laptop>
References: <cover.1479339900.git.johnyoun@synopsys.com>
 <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 16, 2016 at 03:47:18PM -0800, John Youn wrote:
> Add the "snps,ahb-burst" binding and read it in.
> 
> This property controls which burst type to perform on the AHB bus as a
> master in internal DMA mode. This overrides the legacy param value,
> which we need to keep around for now since several platforms use it.
> 
> Some platforms may see better or worse performance based on this
> value. The HAPS platform is one example where all INCRx have worse
> performance than INCR.
> 
> Other platforms (such as the Canyonlands board) report that the default
> value causes system hangs.
> 
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  2 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/dwc2/core.h                        |  9 +++++
>  drivers/usb/dwc2/params.c                      | 56 ++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
