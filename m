From: Alex Smith <alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
Subject: Re: [PATCH_V3 1/3] dt-bindings: dma: Add binding for jz4780-dma
Date: Thu, 26 Feb 2015 20:04:12 +0000
Message-ID: <CAOFt0_CiopFkYECuQUczOtNoo6D8zbCOaE6attP6=KU4zicV7w@mail.gmail.com>
References: <1424954614-12589-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1424954614-12589-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424954614-12589-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Zubair,

On 26 February 2015 at 12:43, Zubair Lutfullah Kakakhel
<Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add device tree bindings for the DMA controller on JZ4780 SoCs, used by
> the dma-jz4780 driver.
>
> Signed-off-by: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> ---
> V3 -> V2
> Changed binding.
> Used to be 3 DMA cells required. <&dma TX_type RX_type Reserved>
> Now 2 DMA cells are required. <&dma Transfer_type Reserved>
>
> This is more common in DMA bindings.
> And I couldn't figure any reason that 3 cells were used.

There are different request type numbers for transfers to/from the
same device (see the JZ4780 programmers manual, page 505). While only
having the option to specify one transfer type is OK when the driver
is using separate channels for read/writes, I recall seeing/writing
some other drivers which use a single channel for both reads and
writes. This would not be possible if we can only specify one transfer
type, you'd have to have them separate.

Thanks,
Alex

>
> V1 -> V2 None
> ---
>  .../devicetree/bindings/dma/jz4780-dma.txt         | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> new file mode 100644
> index 0000000..f25feee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> @@ -0,0 +1,56 @@
> +* Ingenic JZ4780 DMA Controller
> +
> +Required properties:
> +
> +- compatible: Should be "ingenic,jz4780-dma"
> +- reg: Should contain the DMA controller registers location and length.
> +- interrupts: Should contain the interrupt specifier of the DMA controller.
> +- interrupt-parent: Should be the phandle of the interrupt controller that
> +- clocks: Should contain a clock specifier for the JZ4780 PDMA clock.
> +- #dma-cells: Must be <2>. Number of integer cells in the dmas property of
> +  DMA clients (see below).
> +
> +Optional properties:
> +
> +- ingenic,reserved-channels: Bitmask of channels to reserve for devices that
> +  need a specific channel. These channels will only be assigned when explicitly
> +  requested by a client. The primary use for this is channels 0 and 1, which
> +  can be configured to have special behaviour for NAND/BCH when using
> +  programmable firmware.
> +
> +Example:
> +
> +dma: dma@13420000 {
> +       compatible = "ingenic,jz4780-dma";
> +       reg = <0x13420000 0x10000>;
> +
> +       interrupt-parent = <&intc>;
> +       interrupts = <10>;
> +
> +       clocks = <&cgu JZ4780_CLK_PDMA>;
> +
> +       #dma-cells = <2>;
> +
> +       ingenic,reserved-channels = <0x3>;
> +};
> +
> +DMA clients must use the format described in dma.txt, giving a phandle to the
> +DMA controller plus the following 2 integer cells:
> +
> +1. Request type: The DMA request type for transfers to/from the device on
> +   the allocated channel, as defined in the SoC documentation.
> +
> +2. Channel: If set to 0xffffffff, any available channel will be allocated for
> +   the client. Otherwise, the exact channel specified will be used. The channel
> +   should be reserved on the DMA controller using the ingenic,reserved-channels
> +   property.
> +
> +Example:
> +
> +uart0: serial@10030000 {
> +       ...
> +       dmas = <&dma 0x14 0xffffffff
> +               &dma 0x15 0xffffffff>;
> +       dma-names = "tx", "rx";
> +       ...
> +};
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
