From: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dma: Add Xilinx zynqmp dma engine driver support
Date: Mon, 15 Jun 2015 20:35:17 +0530
Message-ID: <CAM=Q2ctpOhxryYqgiHDQry7Q_1noYGEX4pYg+tp+wLgV9=X1hw@mail.gmail.com>
References: <1434378982-30184-1-git-send-email-punnaia@xilinx.com>
	<1434378982-30184-2-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434378982-30184-2-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 15, 2015 at 8:06 PM, Punnaiah Choudary Kalluri
<punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Added the basic driver for zynqmp dma engine used in Zynq
> UltraScale+ MPSoC. The initial release of this driver supports
> only memory to memory transfers.
>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
<snip>

> +/**
> + * zynqmp_dma_chan_is_idle - Provides the channel idle status
> + * @chan: ZynqMP DMA DMA channel pointer
> + *
> + * Return: '1' if the channel is idle otherwise '0'
> + */
> +static int zynqmp_dma_chan_is_idle(struct zynqmp_dma_chan *chan)

maybe this could return bool.

> +{
> +       u32 regval;
> +
> +       regval = readl(chan->regs + STATUS);
> +       if (regval & STATUS_BUSY)
> +               return 0;
> +
> +       return 1;
> +}
> +
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
