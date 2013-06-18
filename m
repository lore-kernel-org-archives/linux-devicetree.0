From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 0/2] Fix potential merge conflict for dw_apb_timer_of
Date: Tue, 18 Jun 2013 17:02:44 +0200
Message-ID: <20130618150244.GC18055@amd.pavel.ucw.cz>
References: <1371514129-22801-1-git-send-email-dinguyen@altera.com>
 <51BFABE8.5090504@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51BFABE8.5090504@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Stultz <john.stultz@linaro.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: dinh.linux@gmail.com, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org

Hi!

> >The following 2 patches will eliminate the need for the patch in John
> >Stultz's tree. If there is to be merge of the 2 trees, then the
> >patch:
> >
> >dw_apb_timer_of.c: Remove parts that were picoxcell-specific
> >
> >can be removed from John's tree to avoid a merge-conflict.
> >
> >Based on arm-soc/for-next:
> >
> >PATCH[1/2] - Rename "dw-apb-timer-osc" and "dw-apb-timer-sp" bindings to=
 just
> >"dw-apb-timer"
> >PATCH[2/2] - Fix user/system reporting by fixing read_sched_clock()
> =

> Pavel/Jamie: Can you take a look at these too and make sure these cover w=
hat you were doing.

[It seems like Heiko St=FCbner was not aware of patches in the clock
tree, so did pretty much equivalent patch.]

Dinh's changes look good to me, but

[PATCH v2 4/4] clocksource: dw_apb_timer_of: use clocksource_of_init

does not exactly look nice: (I'm sorry I did not see original series,
before it was merged to -soc.). The function counts number of times it
was called, and behaves differently in each case. It is not very
traditional kernel code at the very least.

+static int num_called;
+static void __init dw_apb_timer_init(struct device_node *timer)
 {
-       struct device_node *event_timer, *source_timer;
-
-       event_timer =3D of_find_matching_node(NULL, osctimer_ids);
-       if (!event_timer)
-               panic("No timer for clockevent");
-       add_clockevent(event_timer);
-       =

-       source_timer =3D of_find_matching_node(event_timer,
osctimer_ids);
-       if (!source_timer)
-               panic("No timer for clocksource");
-       add_clocksource(source_timer);
-
-       of_node_put(source_timer);
+       switch (num_called) {
+       case 0:
+               pr_debug("%s: found clockevent timer\n", __func__);
+               add_clockevent(timer);
+               of_node_put(timer);
+               break;
+       case 1:
+               pr_debug("%s: found clocksource timer\n", __func__);
+               add_clocksource(timer);
+               of_node_put(timer);
+               init_sched_clock();
+               break;
+       default:
+               break;
+       }

-       init_sched_clock();
+       num_called++;
 }

Heiko, can you take a look at John Stultz tree? We modified this area
already... I understand you only have one timer on your silicon?

Would perhaps parameter on dw_apb_timer_init telling it what to do be
better solution? I don't like the "num_called" variable too much...

Thanks,
									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html
