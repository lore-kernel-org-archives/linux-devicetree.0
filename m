From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Wed, 4 Jan 2017 09:26:13 -0600
Message-ID: <20170104152613.hhdptwsyg73ev3dz@rob-hp-laptop>
References: <1483536954-27203-1-git-send-email-appanad@xilinx.com>
 <1483536954-27203-3-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483536954-27203-3-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 04, 2017 at 07:05:53PM +0530, Kedareswara rao Appana wrote:
> When VDMA is configured for more than one frame in the h/w
> for example h/w is configured for n number of frames and user
> Submits n number of frames and triggered the DMA using issue_pending API.
> In the current driver flow we are submitting one frame at a time
> but we should submit all the n number of frames at one time as the h/w
> Is configured for n number of frames.

Please fix run-on sentences, capitalization, and word wrapping.

> 
> This patch fixes this issue.
> 
> Reviewed-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v4:
> ---> Add Check for framestore configuration on Transmit case as well
>      as suggested by Jose Abreu.
> ---> Modified the dev_dbg checks to dev_warn checks as suggested
>      by Jose Abreu. 
> Changes for v3:
> ---> Added Checks for frame store configuration. If frame store
>      Configuration is not present at the h/w level and user
>      Submits less frames added debug prints in the driver as relevant.
> Changes for v2:
> ---> Fixed race conditions in the driver as suggested by Jose Abreu
> ---> Fixed unnecessray if else checks in the vdma_start_transfer
>      as suggested by Laurent Pinchart.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |  2 +
>  drivers/dma/xilinx/xilinx_dma.c                    | 79 +++++++++++++++-------
>  2 files changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> index a2b8bfa..1f65e09 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> @@ -66,6 +66,8 @@ Optional child node properties:
>  Optional child node properties for VDMA:
>  - xlnx,genlock-mode: Tells Genlock synchronization is
>  	enabled/disabled in hardware.
> +- xlnx,fstore-config: Tells Whether Frame Store Configuration is
> +	enabled/disabled in hardware.

What's the default (when not present)? That should be the most 
common case. Looks like the code treats this as bool, but that's 
not clear here. The name is not clear what it is doing. Enabling or 
disabling the feature?


>  Optional child node properties for AXI DMA:
>  -dma-channels: Number of dma channels in child node.
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
