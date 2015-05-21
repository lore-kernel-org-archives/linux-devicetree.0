From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 3/7] clocksource: mips-gic: Split clocksource and
 clockevent initialization
Date: Thu, 21 May 2015 15:24:41 -0700
Message-ID: <CAL1qeaFkzpH+nGqRPOuY-L62jP8NgZWP0WxKTYKXZDpe1sSojg@mail.gmail.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
	<1432244260-14908-4-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432244260-14908-4-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 2:37 PM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> This is preparation work for the introduction of clockevent frequency
> update with a clock notifier. This is only possible when the device
> is passed a clk struct, so let's split the legacy and devicetree
> initialization.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> ---
>  drivers/clocksource/mips-gic-timer.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
> index c4352f0..22a4daf 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -142,11 +142,6 @@ static void __init __gic_clocksource_init(void)
>         ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
>         if (ret < 0)
>                 pr_warn("GIC: Unable to register clocksource\n");
> -
> -       gic_clockevent_init();
> -
> -       /* And finally start the counter */
> -       gic_start_count();
>  }

Instead of duplicating this bit in both the OF and non-OF paths, maybe
it would be better to do the notifier registration in
gic_clockevent_init(), either by passing around the struct clk or
making it a global?
