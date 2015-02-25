From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH_V2 1/3] dt-bindings: dma: Add binding for jz4780-dma
Date: Wed, 25 Feb 2015 09:52:57 +0000
Message-ID: <54ED9B79.3040501@imgtec.com>
References: <1424801297-18354-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1424801297-18354-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424801297-18354-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex@alex-smith.me.uk
List-Id: devicetree@vger.kernel.org



On 24/02/15 18:08, Zubair Lutfullah Kakakhel wrote:
> From: Alex Smith <alex.smith@imgtec.com>
> 
> Add device tree bindings for the DMA controller on JZ4780 SoCs, used by
> the dma-jz4780 driver.
> 
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> ---
> V1 -> V2 None
> ---
>  .../devicetree/bindings/dma/jz4780-dma.txt         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> new file mode 100644
> index 0000000..ce90011
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> @@ -0,0 +1,61 @@
> +* Ingenic JZ4780 DMA Controller
> +
> +Required properties:
> +
> +- compatible: Should be "ingenic,jz4780-dma"
> +- reg: Should contain the DMA controller registers location and length.
> +- interrupts: Should contain the interrupt specifier of the DMA controller.
> +- interrupt-parent: Should be the phandle of the interrupt controller that
> +- clocks: Should contain a clock specifier for the JZ4780 PDMA clock.
> +- #dma-cells: Must be <3>. Number of integer cells in the dmas property of
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
> +	compatible = "ingenic,jz4780-dma";
> +	reg = <0x13420000 0x10000>;
> +
> +	interrupt-parent = <&intc>;
> +	interrupts = <10>;
> +
> +	clocks = <&cgu JZ4780_CLK_PDMA>;
> +
> +	#dma-cells = <3>;
> +
> +	ingenic,reserved-channels = <0x3>;
> +};
> +
> +DMA clients must use the format described in dma.txt, giving a phandle to the
> +DMA controller plus the following 3 integer cells:
> +
> +1. Transmit request type: The DMA request type for transfers to the device on
> +   the allocated channel, as defined in the SoC documentation. If set to 0,
> +   transfers to the device will not be allowed on the channel.
> +
> +2. Receive request type: The DMA request type for transfers from the device on
> +   the allocated channel, as defined in the SoC documentation. If set to 0,
> +   transfers from the device will not be allowed on the channel.
> +
> +3. Channel: If set to 0xffffffff, any available channel will be allocated for
> +   the client. Otherwise, the exact channel specified will be used. The channel
> +   should be reserved on the DMA controller using the ingenic,reserved-channels
> +   property.

Update. 
I'm taking a look at these bindings again and see if Transmit/Receive request types 'need' to be separate.
mmc driver is the only one using it like that.

Sorry for the spam.

Regards,
ZubairLK

> +
> +Example:
> +
> +uart0: serial@10030000 {
> +	...
> +	dmas = <&dma 0x14 0 0xffffffff
> +		&dma 0 0x15 0xffffffff>;
> +	dma-names = "tx", "rx";
> +	...
> +};
> 
