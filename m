From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RESEND PATCH v2 1/3] irqchip: irq-dove: Add PMU interrupt
 controller.
Date: Tue, 26 Nov 2013 10:14:06 -0500
Message-ID: <20131126151406.GK2879@titan.lakedaemon.net>
References: <1383820531-4387-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383820531-4387-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 11:35:29AM +0100, Andrew Lunn wrote:
> Dove has a Power Management Unit with its own interrupt
> controller. This is chained on the main interrupt controller.  Add a
> driver, making use of generic chip where possible.
> 
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> cc: pawel.moll-5wv7dgnIgG8@public.gmane.org
> cc: mark.rutland-5wv7dgnIgG8@public.gmane.org
> cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> cc: ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org
> ---
>  .../interrupt-controller/marvell,dove-pmu-intc.txt |  17 +++
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-dove.c                         | 126 +++++++++++++++++++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,dove-pmu-intc.txt
>  create mode 100644 drivers/irqchip/irq-dove.c

Applied to mvebu/irqchip for tglx once it's stewed in -next for a bit.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
