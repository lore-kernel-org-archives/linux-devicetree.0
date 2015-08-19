From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] dmaengine: st_fdma: Add STMicroelectronics FDMA DT
 binding documentation
Date: Wed, 19 Aug 2015 20:36:05 +0530
Message-ID: <20150819150605.GA13546@localhost>
References: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
 <1436371888-27863-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436371888-27863-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 08, 2015 at 05:11:22PM +0100, Peter Griffin wrote:
> This patch adds the DT binding documentation for the FDMA constroller
> found on STi based chipsets from STMicroelectronics.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/st_fdma.txt | 76 +++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/st_fdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/st_fdma.txt b/Documentation/devicetree/bindings/dma/st_fdma.txt
> new file mode 100644
> index 0000000..1ec7470
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/st_fdma.txt
> @@ -0,0 +1,76 @@
> +* STMicroelectronics Flexible Direct Memory Access Device Tree bindings
> +
> +The FDMA is a general-purpose direct memory access controller capable of
> +supporting 16 independent DMA channels. It accepts up to 32 DMA requests.
> +The FDMA is based on a Slim processor which require a firmware.
> +
> +* FDMA Controller
> +
> +Required properties:
> +- compatible	: Should be "st,fdma_mpe31"
> +- reg		: Should contain DMA registers location and length
> +- interrupts	: Should contain one interrupt shared by all channel

s/channel/channels

> +- dma-channels	: Number of channels supported by the controller
> +- #dma-cells	: Must be <3>.

any reason three?

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
