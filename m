From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: DT: vdma: Add clock support for vdma
Date: Wed, 20 Apr 2016 13:29:32 +0530
Message-ID: <CAKfKVtEkfnDqU476troXmCw20ATvQvj-JdPX-BCuPDR-9ZxKHQ@mail.gmail.com>
References: <1461136800-20334-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461136800-20334-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 12:49 PM, Kedareswara rao Appana
<appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This patch updates the binding doc with clock description
> for vdma.
>
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index fcc2b65..e1c9019 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -21,6 +21,10 @@ Required properties:
>  - dma-channel child node: Should have at least one channel and can have up to
>         two channels per device. This node specifies the properties of each
>         DMA channel (see child node properties below).
> +- clocks: Input clock specifier. Refer to common clock bindings.
> +- clock-names: List of input clocks "axi_clk", "tx_clk", "txs_clk" (list of input
> +              cloks may vary based on the ip configuration. see clock bindings
> +              for more info).
>
>  Required properties for VDMA:
>  - xlnx,num-fstores: Should be the number of framebuffers as configured in h/w.
> @@ -60,6 +64,8 @@ axi_vdma_0: axivdma@40030000 {
>         xlnx,num-fstores = <0x8>;
>         xlnx,flush-fsync = <0x1>;
>         xlnx,addrwidth = <0x20>;
> +       clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> +       clock-names = "axi_clk", "tx_clk", "txs_clk";

the module has
s_axi_lite_aclk Clock I AXI VDMA AXI4-Lite interface clock
 m_axi_mm2s_aclk Clock I AXI VDMA MM2S clock
 m_axi_s2mm_aclk Clock I AXI VDMA S2MM clock
 m_axis_mm2s_aclk Clock I AXI VDMA MM2S AXIS clock
 s_axis_s2mm_aclk Clock I AXI VDMA S2MM AXIS clock

I think a partial support is not wrong.
however  we should keep the names same as the TRM.


>         dma-channel@40030000 {
>                 compatible = "xlnx,axi-vdma-mm2s-channel";
>                 interrupts = < 0 54 4 >;
> --
> 2.1.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
