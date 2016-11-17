From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Thu, 17 Nov 2016 16:35:10 +0100
Message-ID: <633e5a10-1ea0-48c7-a5b7-a5ff2625e759@i2se.com>
References: <cover.1479339900.git.johnyoun@synopsys.com>
 <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi John,

Am 17.11.2016 um 00:47 schrieb John Youn:
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
>  drivers/usb/dwc2/core.h                        |  9 +++++
>  drivers/usb/dwc2/params.c                      | 56 ++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 6c7c2bce..9e7b4b4 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt

according to Documentation/devicetree/bindings/submitting-patches.txt
this change should be a separate patch.

> @@ -26,6 +26,8 @@ Optional properties:
>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>    Refer to usb/generic.txt
> +- snps,ahb-burst: specifies the ahb burst length. Valid arguments are:
> +  "SINGLE", "INCR", "INCR4", "INCR8", "INCR16". Defaults to "INCR4".

This doesn't apply in case of the bcm2835. I would prefer this option is
ignored in that case with a dev_warn("snps,ahb-burst is not supported on
this platform").

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
