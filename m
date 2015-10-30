From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 14:50:54 +0000
Message-ID: <20151030145054.GE31073@leverpostej>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <1446174501-8870-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446174501-8870-2-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 11:08:13PM -0400, Sinan Kaya wrote:
> This patch adds support for hidma engine. The driver
> consists of two logical blocks. The DMA engine interface
> and the low-level interface. This version of the driver
> does not support virtualization on this release and only
> memcpy interface support is included.
> 
> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma.txt         |   18 +
>  drivers/dma/Kconfig                                |   11 +
>  drivers/dma/Makefile                               |    4 +
>  drivers/dma/qcom_hidma.c                           | 1717 ++++++++++++++++++++
>  drivers/dma/qcom_hidma.h                           |   44 +
>  drivers/dma/qcom_hidma_ll.c                        | 1132 +++++++++++++
>  6 files changed, 2926 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma.txt
>  create mode 100644 drivers/dma/qcom_hidma.c
>  create mode 100644 drivers/dma/qcom_hidma.h
>  create mode 100644 drivers/dma/qcom_hidma_ll.c
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma.txt b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
> new file mode 100644
> index 0000000..9a01635
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
> @@ -0,0 +1,18 @@
> +Qualcomm Technologies HIDMA Channel driver
> +
> +Required properties:
> +- compatible: must contain "qcom,hidma"
> +- reg: Addresses for the transfer and event channel
> +- interrupts: Should contain the event interrupt
> +- desc-count: Number of asynchronous requests this channel can handle
> +- event-channel: The HW event channel completions will be delivered.
> +Example:
> +
> +	hidma_24: hidma@0x5c050000 {
> +		compatible = "qcom,hidma";
> +		reg = <0 0x5c050000 0x0 0x1000>,
> +		      <0 0x5c0b0000 0x0 0x1000>;
> +		interrupts = <0 389 0>;
> +		desc-count = <10>;
> +		event-channel = /bits/ 8 <4>;

The documentation above didn't state this was an 8-bit quantity, and you
save nothing by doing this (all values in the binary format are padded
to 4-byte alignment).

Have this as a cell, and use of_property_read_u32. That means you may
need a temporary u32, but it's far less surprising and makes things far
easier for dts authors to get right.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
