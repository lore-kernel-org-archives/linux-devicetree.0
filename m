From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2] irqchip: add keystone irq controller ip driver
Date: Sun, 17 Aug 2014 15:39:02 -0400
Message-ID: <20140817193902.GK12769@titan.lakedaemon.net>
References: <1406126430-9978-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406126430-9978-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 23, 2014 at 05:40:30PM +0300, Grygorii Strashko wrote:
> On Keystone SOCs, DSP cores can send interrupts to ARM
> host using the IRQ controller IP. It provides 28 IRQ
> signals to ARM. The IRQ handler running on HOST OS can
> identify DSP signal source by analyzing SRCCx bits in
> IPCARx registers. This is one of the component used by
> the IPC mechanism used on Keystone SOCs.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
> Changes in v2:
> - minor comments and fixes applied
> 
> v1:
>  https://lkml.org/lkml/2014/7/14/549
> 
>  .../interrupt-controller/ti,keystone-irq.txt       |   36 +++
>  drivers/irqchip/Kconfig                            |    7 +
>  drivers/irqchip/Makefile                           |    1 +
>  drivers/irqchip/irq-keystone.c                     |  232 ++++++++++++++++++++
>  4 files changed, 276 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
>  create mode 100644 drivers/irqchip/irq-keystone.c

I've applied this to the topic branch irqchip/keystone.  I'll let it
cook in -next for a few days (keep in mind Stephen is at KS this week).
Then I'll merge it into irqchip/core and you can use /keystone as a
stable base for other work this cycle.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
