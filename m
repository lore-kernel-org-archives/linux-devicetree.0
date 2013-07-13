From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC 5/8] dma: mpc512x: use symbolic specifiers for DMA
 channels
Date: Sat, 13 Jul 2013 09:17:08 +0200
Message-ID: <201307130917.08904.arnd@arndb.de>
References: <1373642781-32631-1-git-send-email-gsi@denx.de>
 <1373642781-32631-6-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373642781-32631-6-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 12 July 2013, Gerhard Sittig wrote:
> +++ b/include/dt-bindings/dma/mpc512x-dma.h
> @@ -0,0 +1,21 @@
> +/*
> + * This header file provides symbolic specifiers for DMA channels
> + * within the MPC512x SoC's DMA controller.  Since requester lines
> + * directly map to channel numbers and no additional flexibility
> + * is involved, DMA channels can be considered directly associated
> + * with individual peripherals.
> + *
> + * This header file gets shared among DT bindings which provide
> + * hardware specs, and driver code which implements supporting logic.
> + */
> +
> +#ifndef _DT_BINDINGS_DMA_MPC512x_DMA_H
> +#define _DT_BINDINGS_DMA_MPC512x_DMA_H
> +
> +#define MPC512x_DMACHAN_SCLPC          26
> +#define MPC512x_DMACHAN_SDHC           30
> +#define MPC512x_DMACHAN_MDDRC          32
> +
> +#define MPC512x_DMACHAN_MAX            64
> +

I think these should not be in the header and should not bve part of the
binding either. They are specific to an SoC that happens to be using this
DMA controller but would be completely different for any other SoC with
the same DMA engine. These belong into the dma descriptors of the slave
drivers and don't need symbolic names.

	Arnd
