From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC v5 4/5] dma: mpc512x: register for device tree
 channel lookup
Date: Mon, 18 Nov 2013 12:09:57 +0000
Message-ID: <20131118120957.GH30853@e106331-lin.cambridge.arm.com>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com>
 <1383290374-17484-5-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383290374-17484-5-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 01, 2013 at 07:19:33AM +0000, Alexander Popov wrote:
> From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> 
> register the controller for device tree based lookup of DMA channels
> (non-fatal for backwards compatibility with older device trees), provide
> the '#dma-cells' property in the shared mpc5121.dtsi file, and introduce
> a bindings document for the MPC512x DMA controller
> 
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/mpc512x-dma.txt        | 55 ++++++++++++++++++++++
>  arch/powerpc/boot/dts/mpc5121.dtsi                 |  1 +
>  drivers/dma/mpc512x_dma.c                          | 21 +++++++--
>  3 files changed, 74 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/mpc512x-dma.txt b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
> new file mode 100644
> index 0000000..a4867d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
> @@ -0,0 +1,55 @@
> +* Freescale MPC512x DMA Controller
> +
> +The DMA controller in the Freescale MPC512x SoC can move blocks of
> +memory contents between memory and peripherals or memory to memory.
> +
> +Refer to the "Generic DMA Controller and DMA request bindings" description
> +in the dma.txt file for a more detailled discussion of the binding.  The
> +MPC512x DMA engine binding follows the common scheme, but doesn't provide
> +support for the optional channels and requests counters (those values are
> +derived from the detected hardware features) and has a fixed client
> +specifier length of 1 integer cell (the value is the DMA channel, since
> +the DMA controller uses a fixed assignment of request lines per channel).

The fact that #dma-cells must be <1> isn't a difference from the
standard binding, and needs not be described here. The meaning of the
value should be in your description of #dma-cells below.

I'm not sure it's worth mentioning optional channels / request counters.
If anything, it would be better to update dma.txt to move the "Optional
properties" to something like "Suggested properties"...

> +
> +
> +DMA controller node properties:
> +
> +Required properties:
> +- compatible:		should be "fsl,mpc5121-dma"
> +- reg:			address and size of the DMA controller's register set
> +- interrupts:		interrupt spec for the DMA controller
> +
> +Optional properties:
> +- #dma-cells:		must be <1>, describes the number of integer cells
> +			needed to specify the 'dmas' property in client nodes,
> +			strongly recommended since common client helper code
> +			uses this property

Rather than redundantly describing what the standard property means, it
would be better to describe what the cell actually means (i.e. which
value maps to which DMA channel in hardware, how many their are, etc).

> +
> +Example:
> +
> +	dma0: dma@14000 {
> +		compatible = "fsl,mpc5121-dma";
> +		reg = <0x14000 0x1800>;
> +		interrupts = <65 0x8>;
> +		#dma-cells = <1>;
> +	};
> +
> +
> +Client node properties:
> +
> +Required properties:
> +- dmas:			list of DMA specifiers, consisting each of a handle
> +			for the DMA controller and integer cells to specify
> +			the channel used within the DMA controller
> +- dma-names:		list of identifier strings for the DMA specifiers,
> +			client device driver code uses these strings to
> +			have DMA channels looked up at the controller
> +

I don't think its necessary or helpful to describe the client binding
here, it's in dma.txt

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
