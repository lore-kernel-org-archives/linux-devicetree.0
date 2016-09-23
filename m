From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V3 01/10] Documentation: DT: qcom_hidma: update binding
 for MSI
Date: Fri, 23 Sep 2016 19:02:39 +0100
Message-ID: <20160923180239.GC29830@leverpostej>
References: <1473960166-30155-1-git-send-email-okaya@codeaurora.org>
 <1473960166-30155-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473960166-30155-2-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2016 at 01:22:37PM -0400, Sinan Kaya wrote:
> Adding a new binding for qcom,hidma-1.1 to distinguish HW supporting
> MSI interrupts from the older revision.
> 
> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> index fd5618b..47bfb5a 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> @@ -47,12 +47,23 @@ When the OS is not in control of the management interface (i.e. it's a guest),
>  the channel nodes appear on their own, not under a management node.
>  
>  Required properties:
> -- compatible: must contain "qcom,hidma-1.0"
> +- compatible: must contain "qcom,hidma-1.0" for initial HW or "qcom,hidma-1.1"
> +for MSI capable HW.
>  - reg: Addresses for the transfer and event channel
>  - interrupts: Should contain the event interrupt
>  - desc-count: Number of asynchronous requests this channel can handle
>  - iommus: required a iommu node
>  
> +Optional properties for MSI:
> +- msi-parent: pointer to the MSI controller object with the DeviceID in use.

The format of msi-cells depends on the particular msi-controller, so no
need to mention DeviceID here.

Please refer to
Documentation/devicetree/bindings/interrupt-controller/msi.txt

> +Example:
> + msi_parent: <&msi0 0x80024>

This doesn't match (s/_/-/).

> +msi0 is the MSI controller in the system. Bits 0-5 is the channel ID. 4
> +is the channel ID. Bits 5-8 is the instance number. This is for the HIDMA
> +instance 1.

I don't think you need any of this text, so long as you refer to the
generic MSI binding document, as above.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
