From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Export CPU mux clocks for CPU frequency control
Date: Tue, 10 Mar 2015 16:59:12 -0700
Message-ID: <20150310235912.14952.99786@quantum>
References: <1425466152-7867-1-git-send-email-pi-cheng.chen@linaro.org>
 <20150304112109.GB11010@pengutronix.de>
 <CALx668WKKmifhuODsV+Uaoq4ggcmB1=wbpLzXBnjEtxbuB4qig@mail.gmail.com>
 <20150305074207.GC11010@pengutronix.de>
 <CAKohponSqLPcULA9-T8y9b_b44Torti0p6W3sJfRZ1oKUWqtTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKohponSqLPcULA9-T8y9b_b44Torti0p6W3sJfRZ1oKUWqtTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen Fan <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Kernel Mailman List <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Viresh Kumar (2015-03-05 00:59:50)
> On 5 March 2015 at 13:12, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > We have clk_set_parent for changing the parent and clk_set_rate to
> > change the rate. Use the former for changing the parent and the latter
> > for changing the rate. What you are interested in is changing the
> > parent, so use clk_set_parent for this and not abuse a side effect
> > of clk_set_rate.
> 
> clk_set_rate() for CPUs clock is responsible to change clock rate
> of the CPU. Whether it plays with PLLs or muxes, its not that relevant.

Agreed.

> 
> > My suggestion is to take another approach. Implement clk_set_rate for
> > these muxes and in the set_rate hook:
> >
> > - switch mux to intermediate PLL parent
> > - call clk_set_rate() for the real parent PLL
> > - switch mux back to real parent PLL
> >
> > This way the things happening behind the scenes are completely transparent
> > to the cpufreq driver and you can use cpufreq-dt as is without changes.
> 
> CPUFreq wants to change to intermediate frequency by itself against
> some magic change behind the scene. The major requirement for that
> comes from the fact that we want to send PRE/POST freq notifiers on
> which loops-per-jiffie depends.

I assume you are saying that you want to update loops-per-jiffie while
at an intermediate frequency. Why? This operation should not take very
long.

Imagine a (hypothetical?) processor that changes frequency in many small
steps until it converges to the target rate. Would you want to update
lpj for every step?

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
