From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 8/9] irqchip/ls-scfg-msi: add LS1043a v1.1 MSI support
Date: Tue, 3 Jan 2017 11:46:01 -0600
Message-ID: <20170103174601.jbmqo7iataemzyxc@rob-hp-laptop>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
 <1482829985-24421-8-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482829985-24421-8-git-send-email-Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 05:13:04PM +0800, Minghuan Lian wrote:
> A MSI controller of LS1043a v1.0 only includes one MSIR and
> is assigned one GIC interrupt. In order to support affinity,
> LS1043a v1.1 MSI is assigned 4 MSIRs and 4 GIC interrupts.
> But the MSIR has the different offset and only supports 8 MSIs.
> The bits between variable bit_start and bit_end in structure
> ls_scfg_msir are used to show 8 MSI interrupts. msir_irqs and
> msir_base are added to describe the difference of MSI between
> LS1043a v1.1 and other SoCs.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
> ---
>  .../interrupt-controller/fsl,ls-scfg-msi.txt       |  1 +
>  drivers/irqchip/irq-ls-scfg-msi.c                  | 45 +++++++++++++++++++---
>  2 files changed, 40 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
