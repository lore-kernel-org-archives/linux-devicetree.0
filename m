From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dma: Add Xilinx Central DMA DT Binding Documentation
Date: Tue, 05 Aug 2014 17:29:10 +0530
Message-ID: <53E0C70E.2010603@gmail.com>
References: <1407238791-3370-1-git-send-email-sthokal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407238791-3370-1-git-send-email-sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, levex-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/05/2014 05:09 PM, Srikanth Thokala wrote:
> Device-tree binding documentation of Xilinx Central DMA Engine
>
> Signed-off-by: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - Change property 'xlnx,data-width' to 'xlnx,datawidth' in the description
>    to match the implementation.
>
> ---
>   .../devicetree/bindings/dma/xilinx/xilinx_cdma.txt |   54 ++++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
> new file mode 100644
> index 0000000..b04f76b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
> @@ -0,0 +1,54 @@
> +Xilinx AXI CDMA engine, it does transfers between memory-mapped source
> +address and a memory-mapped destination address.
> +
> +Required properties:
> +- compatible: Should be "xlnx,axi-cdma-1.00.a"
> +- #dma-cells: Should be <1>, see "dmas" property below
> +- reg: Should contain cdma registers location and length.
> +- dma-channel child node: Should have only one channel
> +
> +

proper alignment for all the properties...
Required properties:
- compatible	: Should be "xlnx,axi-cdma-1.00.a"
- #dma-cells	: Should be <1>, see "dmas" property below
- reg		: Should contain cdma registers location and length.
.....



-- 
Regards,
Varka Bhadram.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
