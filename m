From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] irqchip/gic-v3: Support MSIs via aliases and distributor
Date: Tue, 28 Nov 2017 08:04:56 -0600
Message-ID: <20171128140456.mexpe542h24s6ycy@rob-hp-laptop>
References: <20171127102408.6631-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171127102408.6631-1-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 02:24:08AM -0800, Stephen Boyd wrote:
> Some GIC configurations don't have an accessible ITS, but they
> want to support MSIs through the distributor's SETSPI registers
> or through the IMPLEMENTATION DEFINED message-based interrupt
> request register region. This mode of operation is similar to the
> v2m support on gic-400, but we don't necessarily know what
> particular SPIs are supported as MSIs so we need some help from
> firmware to know what to do.
> 
> Introduce an "arm,spi-ranges" property for this, similar to the
> "marvell,spi-ranges" property, that indicates the base and size
> of each MSI range. This property applies equally to the
> distributor and alias registers. In either case, we detect this
> mode of operation by looking for a node with the "msi-controller"
> property and then probe the v2m frame code on top of it. Assume
> these nodes will have the "arm,spi-ranges" property in them so
> that the v2m code works mostly unmodified.
> 
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/arm,gic-v3.txt   |  48 +++++++++-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/irqchip/irq-gic-v2m.c                      | 102 ++++++++++++++++-----
>  drivers/irqchip/irq-gic-v3.c                       |   4 +
>  include/linux/irqchip/arm-gic-common.h             |   3 +
>  4 files changed, 129 insertions(+), 28 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
