From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clocksource: Add support for the Mediatek SoCs
Date: Mon, 12 May 2014 11:37:27 +0200
Message-ID: <4169260.qB0vPmmJCY@wuerfel>
References: <1399772463-859-1-git-send-email-matthias.bgg@gmail.com> <1399772463-859-2-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399772463-859-2-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko.stuebner-K3U4GQvHnyU@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 May 2014 03:41:00 Matthias Brugger wrote:
> +
> +static void __iomem *gpt_base;
> +static u32 ticks_per_jiffy;
> +

This is not wrong, because there will only be one timer, but the
preferred way to express this in general would be to add it to the
clock_event_device pointer:

struct mtk_clock_event_device {
	void __iomem *gpt_base;
	u32 ticks_per_jiffy;
	struct clock_event_device dev;
};

static inline struct mtk_clock_event_device *to_mtk_clock(struct clock_event_device *c)
{
	return container_of(c, struct mtk_clock_event_device, dev);
}

static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
{
       struct mtk_clock_event_device *evt = dev_id;

       /* Acknowledge timer0 irq */
       writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG);
       evt->dev.event_handler(evt);

       return IRQ_HANDLED;
}

static void mtk_clkevt_mode(enum clock_event_mode mode,
                             struct clock_event_device *clk)
{
	struct mtk_clock_event_device *evt = to_mtk_clock(clk);

        mtk_clkevt_time_stop(GPT_CLK_EVT);

        switch (mode) {
        case CLOCK_EVT_MODE_PERIODIC:
               mtk_clkevt_time_setup(evt->ticks_per_jiffy, GPT_CLK_EVT);
               mtk_clkevt_time_start(true, GPT_CLK_EVT);
               break;
        case CLOCK_EVT_MODE_ONESHOT:
               mtk_clkevt_time_start(false, GPT_CLK_EVT);
               break;
        case CLOCK_EVT_MODE_UNUSED:
        case CLOCK_EVT_MODE_SHUTDOWN:
        default:
               /* No more interrupts will occur as source is disabled */
               break;
        }
}

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
