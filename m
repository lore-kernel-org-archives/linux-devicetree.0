From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/7] clocksource: mediatek: Don't run event_handler if
 it is NULL
Date: Mon, 4 May 2015 23:13:59 +0800
Message-ID: <1430752439.24965.2.camel@mtksdaap41>
References: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
 <1430466210-22963-2-git-send-email-yingjoe.chen@mediatek.com>
 <55472A80.9020904@linaro.org>
 <CABuKBeKBcg+zCDSx8PNCsRC3A8Lo9ripw5ZYCC0c+GjJN8dp6Q@mail.gmail.com>
 <55473162.5010608@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <55473162.5010608-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-05-04 at 10:44 +0200, Daniel Lezcano wrote:
> On 05/04/2015 10:34 AM, Matthias Brugger wrote:
> > 2015-05-04 10:14 GMT+02:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >> On 05/01/2015 09:43 AM, Yingjoe Chen wrote:
> >>>
> >>> Spurious timer interrupt is noticed in mtk timer and cause kernel
> >>> crash. In mtk_timer_interrupt(), only run event_handler if it is
> >>> not NULL.
> >>>
> >>> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>> ---
> >>>    drivers/clocksource/mtk_timer.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/clocksource/mtk_timer.c
> >>> b/drivers/clocksource/mtk_timer.c
> >>> index 68ab423..85e0ab5 100644
> >>> --- a/drivers/clocksource/mtk_timer.c
> >>> +++ b/drivers/clocksource/mtk_timer.c
> >>> @@ -143,7 +143,8 @@ static irqreturn_t mtk_timer_interrupt(int irq, void
> >>> *dev_id)
> >>>
> >>>          /* Acknowledge timer0 irq */
> >>>          writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG);
> >>> -       evt->dev.event_handler(&evt->dev);
> >>> +       if (evt->dev.event_handler)
> >>> +               evt->dev.event_handler(&evt->dev);
> >>>
> >>>          return IRQ_HANDLED;
> >>>    }
> >>>
> >>
> >> This fix does not look good.
> >>
> >> Could you try by requesting the irq *after* clockevents_config_and_register
> >> in the init sequence [1] ?
> >>
> >
> >  From my understanding [1] should already fix this.
> >
> > [1] https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/drivers/clocksource/mtk_timer.c?id=d4a19eb3b15a4ba98f627182f48d5bc0cffae670
> 
> Indeed it seems to fix it. But I think request_irq should be done after 
> clockevents_config_and_register in any case.
> 
> Yingjoe, are the spurious interrupts occurring with the fix Matthias 
> mentions ?
> 

Hi Daniel, Matthias,

Thanks for your review.

Unfortunately, I still saw the spurious interrupts with both fixes.

After some experiments, it seems the HW will latch irq status even when 
IRQ is disabled. I can fix this issue by either ack irq before enable
irq(like patch below), or not enable clock event before enable irq.

I'll come up a fix base on this next time.

diff --git a/drivers/clocksource/mtk_timer.c
b/drivers/clocksource/mtk_timer.c
index 9a90c7b..c5f804a 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -184,6 +183,7 @@ static void mtk_timer_enable_irq(struct
mtk_clock_event_device *evt, u8 timer)
 {
 	u32 val;
 
+	writel(GPT_IRQ_ENABLE(timer), evt->gpt_base + GPT_IRQ_ACK_REG);
 	val = readl(evt->gpt_base + GPT_IRQ_EN_REG);
 	writel(val | GPT_IRQ_ENABLE(timer),
 			evt->gpt_base + GPT_IRQ_EN_REG);


Joe.C
