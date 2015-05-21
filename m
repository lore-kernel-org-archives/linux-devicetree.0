From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/7] clocksource: mips-gic: Update clockevent frequency on
 clock rate changes
Date: Thu, 21 May 2015 15:32:29 -0700
Message-ID: <CAL1qeaEzKh6H8HBCULJWM4yMnSQGexWmV0rrnYMViMpuzKWyLg@mail.gmail.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
	<1432244260-14908-5-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432244260-14908-5-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 2:37 PM, Ezequiel Garcia
<ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> This commit introduces the clockevent frequency update, using
> a clock notifier. It will be used to support CPUFreq on platforms
> using MIPS GIC based clockevents.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clocksource/mips-gic-timer.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
> index 22a4daf..71bbd42 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -79,6 +79,13 @@ static void gic_clockevent_cpu_exit(struct clock_event_device *cd)
>         disable_percpu_irq(gic_timer_irq);
>  }
>
> +static void gic_update_frequency(void *data)
> +{
> +       unsigned long rate = (unsigned long)data;
> +
> +       clockevents_update_freq(this_cpu_ptr(&gic_clockevent_device), rate);
> +}
> +
>  static int gic_cpu_notifier(struct notifier_block *nb, unsigned long action,
>                                 void *data)
>  {
> @@ -94,10 +101,26 @@ static int gic_cpu_notifier(struct notifier_block *nb, unsigned long action,
>         return NOTIFY_OK;
>  }
>
> +static int gic_clk_notifier(struct notifier_block *nb, unsigned long action,
> +                           void *data)
> +{
> +       struct clk_notifier_data *cnd = data;
> +
> +       if (action == POST_RATE_CHANGE)
> +               on_each_cpu(gic_update_frequency, (void *)cnd->new_rate, 1);
> +
> +       return NOTIFY_OK;
> +}
> +
> +
>  static struct notifier_block gic_cpu_nb = {
>         .notifier_call = gic_cpu_notifier,
>  };
>
> +static struct notifier_block gic_clk_nb = {
> +       .notifier_call = gic_clk_notifier,
> +};
> +
>  static int gic_clockevent_init(void)
>  {
>         int ret;
> @@ -160,6 +183,7 @@ void __init gic_clocksource_init(unsigned int frequency)
>  static void __init gic_clocksource_of_init(struct device_node *node)
>  {
>         struct clk *clk;
> +       int ret;
>
>         if (WARN_ON(!gic_present || !node->parent ||
>                     !of_device_is_compatible(node->parent, "mti,gic")))
> @@ -186,7 +210,12 @@ static void __init gic_clocksource_of_init(struct device_node *node)
>         }
>
>         __gic_clocksource_init();
> -       gic_clockevent_init();
> +
> +       ret = gic_clockevent_init();
> +       if (ret < 0 && !IS_ERR(clk)) {

I think you mean ret == 0 here?

> +               if (clk_notifier_register(clk, &gic_clk_nb) < 0)
> +                       pr_warn("GIC: Unable to register clock notifier\n");
> +       }
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
