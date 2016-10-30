From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dmaengine: nbpfaxi: add optional max-burst property for
 memory reads/writes
Date: Sun, 30 Oct 2016 15:41:48 -0500
Message-ID: <20161030204147.ysm6vsubfclae57y@rob-hp-laptop>
References: <1477315755-4783-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477315755-4783-1-git-send-email-niklass-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 03:29:15PM +0200, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
> 
> Due to a hardware bug, reading memory (from the Accelerator Coherency Port)
> with a burst size equal to the maximum burst size allowed by the DMA
> hardware's buffer size will cause a hardware hang on the ARTPEC-6 SoC,
> where the only solution is a manual power cycle.
> On ARTPEC-6, this hardware bug does not trigger when writing memory (to the
> Accelerator Coherency Port) with a burst size equal to the maximum burst
> size allowed by the DMA hardware's buffer size.
> 
> To avoid this hardware hang, introduce a new optional max-burst property
> for memory reads. For completeness, also introduce a max-burst property for
> memory writes.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/nbpfaxi.txt |  8 +++++
>  drivers/dma/nbpfaxi.c                             | 38 ++++++++++++++++++++---
>  2 files changed, 42 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
