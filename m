From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dmaengine: vdma: Add 64 bit addressing support to
 the driver
Date: Tue, 29 Mar 2016 13:55:31 -0500
Message-ID: <20160329185531.GA19517@rob-hp-laptop>
References: <1458897378-3852-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458897378-3852-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 25, 2016 at 02:46:18PM +0530, Kedareswara rao Appana wrote:
> This VDMA  is a soft ip, which can be programmed to support
> 32 bit addressing or greater than 32 bit addressing.
> 
> When the VDMA ip is configured for 32 bit address space
> the buffer address is specified by a single register
> (0x5C for MM2S and 0xAC for S2MM channel).
> 
> When the  VDMA core is configured for an address space greater
> than 32 then each buffer address is specified by a combination of
> two registers.
> 
> The first register specifies the LSB 32 bits of address,
> while the next register specifies the MSB 32 bits of address.
> 
> For example, 5Ch will specify the LSB 32 bits while 60h will
> specify the MSB 32 bits of the first start address.
> So we need to program two registers at a time.
> 
> This patch adds the 64 bit addressing support to the vdma driver.
> 
> Signed-off-by: Anurag Kumar Vulisha <anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v3:
> --> Improved commit message as suggested by vinod.
> --> removed unnecessary braces for single line if conditions.
> Changes for v2:
> ---> Added dma-ranges property in device tree as suggested by Arnd Bergmann.
> ---> Added device tree property(xlnx,addrwidth) for an identification of whether
>      the IP block itself is configured in 64-bit or 32-bit mode as suggested by
>      Laurent Pinchart.
> ---> Modified the driver code based on the xlnx,addrwidth.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |  4 ++
>  drivers/dma/Kconfig                                |  2 +-
>  drivers/dma/xilinx/xilinx_vdma.c                   | 73 +++++++++++++++++++---
>  3 files changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index e4c4d47..a86737c 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -8,6 +8,8 @@ Required properties:
>  - #dma-cells: Should be <1>, see "dmas" property below
>  - reg: Should contain VDMA registers location and length.
>  - xlnx,num-fstores: Should be the number of framebuffers as configured in h/w.
> +- xlnx,addrwidth: Should be the vdma addressing size in bits(ex: 32 bits).
> +- dma-ranges: Should be as the following <dma_addr cpu_addr max_len>.

Doesn't the log2 of the dma-ranges size provide you with the address 
width?

>  - dma-channel child node: Should have at least one channel and can have up to
>  	two channels per device. This node specifies the properties of each
>  	DMA channel (see child node properties below).
> @@ -41,8 +43,10 @@ axi_vdma_0: axivdma@40030000 {
>  	compatible = "xlnx,axi-vdma-1.00.a";
>  	#dma_cells = <1>;
>  	reg = < 0x40030000 0x10000 >;
> +	dma-ranges = <0x00000000 0x00000000 0x40000000>;
>  	xlnx,num-fstores = <0x8>;
>  	xlnx,flush-fsync = <0x1>;
> +	xlnx,addrwidth = <0x20>;
>  	dma-channel@40030000 {
>  		compatible = "xlnx,axi-vdma-mm2s-channel";
>  		interrupts = < 0 54 4 >;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
