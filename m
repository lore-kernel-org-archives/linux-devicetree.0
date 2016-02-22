From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dma: mv_xor_v2: new driver
Date: Sun, 21 Feb 2016 20:53:49 -0600
Message-ID: <20160222025349.GC15973@rob-hp-laptop>
References: <1455523083-25506-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455523083-25506-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 08:58:03AM +0100, Thomas Petazzoni wrote:
> The new mv_xor_v2 driver supports the XOR engines found in the 64-bits
> ARM from Marvell of the Armada 7K and Armada 8K family. This XOR
> engine is a completely new hardware block, entirely different from the
> one used on previous Marvell Armada platforms, which use the existing
> mv_xor driver.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/mv-xor-v2.txt          |  19 +
>  drivers/dma/Kconfig                                |  13 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/mv_xor_v2.c                            | 880 +++++++++++++++++++++
>  4 files changed, 913 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mv-xor-v2.txt
>  create mode 100644 drivers/dma/mv_xor_v2.c
> 
> diff --git a/Documentation/devicetree/bindings/dma/mv-xor-v2.txt b/Documentation/devicetree/bindings/dma/mv-xor-v2.txt
> new file mode 100644
> index 0000000..0a03dcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mv-xor-v2.txt
> @@ -0,0 +1,19 @@
> +* Marvell XOR v2 engines
> +
> +Required properties:
> +- compatible: Should be "marvell,mv-xor-v2"

and an SoC specific compatible please.

"marvell,mv" is a bit redundant.

> +- reg: Should contain registers location and length (two sets)
> +    the first set is the DMA registers
> +    the second set is the global registers
> +- msi-parent: Phandle to the MSI-capable interrupt controller used for
> +  interrupts.
> +
> +Example:
> +
> +	xor0@400000 {
> +		compatible = "marvell,mv-xor-v2";
> +		reg = <0x400000 0x1000>,
> +		      <0x410000 0x1000>;
> +		msi-parent = <&gic_v2m0>;
> +		dma-coherent;
> +	};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
