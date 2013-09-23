From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Mon, 23 Sep 2013 11:04:39 -0600
Message-ID: <524074A7.7000001@wwwdotorg.org>
References: <1379499333-4745-1-git-send-email-hongbo.zhang@freescale.com> <1379499333-4745-3-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379499333-4745-3-git-send-email-hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/18/2013 04:15 AM, hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch adds
> the device tree nodes for them.

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt

> +Required properties:
> +
> +- compatible        : must include "fsl,elo3-dma"
> +- reg               : DMA General Status Registers, i.e. DGSR0 which contains
> +                      status for channel 1~4, and DGSR1 for channel 5~8

Is that a single entry, which is large enough to cover both registers,
or a pair of entries, one per register? Reading the text, I might assume
the former, but looking at the examples, it's the latter.

...
 +Example:
> +dma@100300 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "fsl,elo3-dma";
> +	reg = <0x100300 0x4>,
> +	      <0x100600 0x4>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
