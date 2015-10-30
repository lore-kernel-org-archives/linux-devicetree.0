From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 15:00:25 +0000
Message-ID: <20151030150025.GF31073@leverpostej>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446174501-8870-1-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 11:08:12PM -0400, Sinan Kaya wrote:
> The Qualcomm Technologies HIDMA device has been designed
> to support virtualization technology. The driver has been
> divided into two to follow the hardware design. The management
> driver is executed in hypervisor context and is the main
> managment for all channels provided by the device. The
> channel driver is exected in the guest OS context.
> 
> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  42 +
>  drivers/dma/Kconfig                                |  11 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/qcom_hidma_mgmt.c                      | 868 +++++++++++++++++++++
>  4 files changed, 922 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>  create mode 100644 drivers/dma/qcom_hidma_mgmt.c
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> new file mode 100644
> index 0000000..81674ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> @@ -0,0 +1,42 @@
> +Qualcomm Technologies HIDMA Management interface
> +
> +Required properties:
> +- compatible: must contain "qcom,hidma_mgmt"

s/_/-/ in property names and compatible strings.

Per your rationale for splitting the device nodes, surely the
relationship between the two needs to be described?

The GIC has a similar split, yet we use a single node, with the
hypervisor portions being optional.

What if there were multiple instances?

> +- reg: Address range for DMA device
> +- interrupts: Should contain the one interrupt shared by all channels
> +- nr-channels: Number of channels supported by this DMA controller.
> +- max-write: Maximum write burst in bytes. A memcpy requested is
> +  fragmented to multiples of this amount.
> +- max-read: Maximum read burst in bytes. A memcpy request is
> +  fragmented to multiples of this amount.

Thse would be better named as max-read-burst-bytes and
min-read-burst-bytes.

> +- max-wxactions: Maximum write transactions to perform in a burst
> +- max-rdactions: Maximum read transactions to perform in a burst

max-{write,read}-transactions

> +- max-memset-limit: Maximum memset limit

I have no idea what this is meant to mean.

> +- ch-priority-#n: Priority of the channel
> +- ch-weight-#n: Round robin weight of the channel

These need better descriptions. They sound like configuration options.

[...]

> +#if IS_ENABLED(CONFIG_ACPI)
> +static const struct acpi_device_id qcom_hidma_mgmt_acpi_ids[] = {
> +	{"QCOM8060"},
> +	{},
> +};
> +#endif

How do DMA engines work with ACPI?

How are client relationships defined?

THanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
