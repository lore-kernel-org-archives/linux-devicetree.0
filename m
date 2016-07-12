From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Tue, 12 Jul 2016 10:26:28 +0200
Message-ID: <5434334.4rKzx80y6W@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <1761342.TGgYi16yul@wuerfel> <5784968A.7080007@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5784968A.7080007-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 12, 2016 3:04:42 PM CEST Wan Zongshun wrote:
> >
> > Ideally, this should just go away once we use SPARSE_IRQ.
> 
> This platform also can use SPARSE_IRQ? this just a simple irq map and no 
> more irq number in this Soc.
> 

SPARSE_IRQ is implied by ARCH_MULTIPLATFORM, so we will have to
use it once that gets enabled.

Your new irqchip driver already handles IRQ domains, so it will
work out of the box with SPARSE_IRQ, but you have to change the
reference to "NR_IRQS" into something else.

I've prototyped a patch series to enable ARCH_MULTIPLATFORM,
I hope you can start working from what I have and get it to run.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
