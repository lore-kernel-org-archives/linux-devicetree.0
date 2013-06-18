From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Fix potential merge conflict for dw_apb_timer_of
Date: Tue, 18 Jun 2013 17:38:35 +0200
Message-ID: <201306181738.35671.heiko@sntech.de>
References: <1371514129-22801-1-git-send-email-dinguyen@altera.com>
 <51BFABE8.5090504@linaro.org> <20130618150244.GC18055@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130618150244.GC18055-tWAi6jLit6GreWDznjuHag@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

Am Dienstag, 18. Juni 2013, 17:02:44 schrieb Pavel Machek:
> Hi!
> =

> > >The following 2 patches will eliminate the need for the patch in John
> > >Stultz's tree. If there is to be merge of the 2 trees, then the
> > >patch:
> > >
> > >dw_apb_timer_of.c: Remove parts that were picoxcell-specific
> > >
> > >can be removed from John's tree to avoid a merge-conflict.
> > >
> > >Based on arm-soc/for-next:
> > >
> > >PATCH[1/2] - Rename "dw-apb-timer-osc" and "dw-apb-timer-sp" bindings =
to
> > >just "dw-apb-timer"
> > >PATCH[2/2] - Fix user/system reporting by fixing read_sched_clock()
> > =

> > Pavel/Jamie: Can you take a look at these too and make sure these cover
> > what you were doing.
> =

> [It seems like Heiko St=FCbner was not aware of patches in the clock
> tree, so did pretty much equivalent patch.]

Correct ... I was going after what was in linux-next and the tip.git [which=
 I =

also only saw recently at all] does not seem to be part of it. =


> Dinh's changes look good to me, but
> =

> [PATCH v2 4/4] clocksource: dw_apb_timer_of: use clocksource_of_init
> =

> does not exactly look nice: (I'm sorry I did not see original series,
> before it was merged to -soc.). The function counts number of times it
> was called, and behaves differently in each case. It is not very
> traditional kernel code at the very least.
> =

> +static int num_called;
> +static void __init dw_apb_timer_init(struct device_node *timer)
>  {
> -       struct device_node *event_timer, *source_timer;
> -
> -       event_timer =3D of_find_matching_node(NULL, osctimer_ids);
> -       if (!event_timer)
> -               panic("No timer for clockevent");
> -       add_clockevent(event_timer);
> -
> -       source_timer =3D of_find_matching_node(event_timer,
> osctimer_ids);
> -       if (!source_timer)
> -               panic("No timer for clocksource");
> -       add_clocksource(source_timer);
> -
> -       of_node_put(source_timer);
> +       switch (num_called) {
> +       case 0:
> +               pr_debug("%s: found clockevent timer\n", __func__);
> +               add_clockevent(timer);
> +               of_node_put(timer);
> +               break;
> +       case 1:
> +               pr_debug("%s: found clocksource timer\n", __func__);
> +               add_clocksource(timer);
> +               of_node_put(timer);
> +               init_sched_clock();
> +               break;
> +       default:
> +               break;
> +       }
> =

> -       init_sched_clock();
> +       num_called++;
>  }
> =

> Heiko, can you take a look at John Stultz tree? We modified this area
> already... I understand you only have one timer on your silicon?

nope, my silicon has actually three timers of this type (all of them of the =

"snps,dw-apb-timer-osc" type ... which did change it seems).

But the clocksource also needs to provide the sched_clock on it.

Due to the multiple matching I came up with the numbering, because the of-
clocksource must match the timer ips multiple times and needs to use one as =

clockevent and one as clocksource.


> Would perhaps parameter on dw_apb_timer_init telling it what to do be
> better solution? I don't like the "num_called" variable too much...

The problem I see is, how do you want to distinguish between the timer used=
 as =

clockevent and the one used as clocksource. The ip blocks are the same, so =
the =

dt binding must also be the same, as it only describes the hardware.

And the
CLOCKSOURCE_OF_DECLARE(apb_timer, "snps,dw-apb-timer-osc", dw_apb_timer_ini=
t);
of course also matches against all the timer nodes in the dt.


Heiko
