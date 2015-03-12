From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Export CPU mux clocks for CPU frequency control
Date: Thu, 12 Mar 2015 14:51:30 +0530
Message-ID: <CAKohpomZtg583gwWYYAFBrskaRo4oxk33ThDi2=FEGzT_uKVEw@mail.gmail.com>
References: <1425466152-7867-1-git-send-email-pi-cheng.chen@linaro.org>
	<20150304112109.GB11010@pengutronix.de>
	<CALx668WKKmifhuODsV+Uaoq4ggcmB1=wbpLzXBnjEtxbuB4qig@mail.gmail.com>
	<20150305074207.GC11010@pengutronix.de>
	<CAKohponSqLPcULA9-T8y9b_b44Torti0p6W3sJfRZ1oKUWqtTw@mail.gmail.com>
	<20150305091948.GH11010@pengutronix.de>
	<CALx668X2m0hMVQumGQmhhrKnv4h1hiYp20Q4FcKuECK3mhoJiA@mail.gmail.com>
	<20150305105104.GJ11010@pengutronix.de>
	<CAKohpo=90YH3TLfnMro0AQOM6_uMB_SPS9Q3j6Myz4RqqBdVHg@mail.gmail.com>
	<20150311001328.14952.56422@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311001328.14952.56422@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linaro Kernel Mailman List <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen Fan <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XWGXanvQGlWp@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 March 2015 at 05:43, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Sorry, I am not who you asked for advice but I will chime in anyways ;-)

Always welcome :)

> I really hate this intermediate frequency stuff in cpufreq. As we

I am starting to :)

> Furthermore any intermediate-frequency property in a Devicetree binding
> would suffer the same fate. Trying to neatly encode some weird sequence
> into this generic thing will get very ugly very fast.

Hmm..

> For proof please look at clk-divider.c, clk-gate.c, clk-mux.c or
> clk-composite.c and you'll see the result of the slow accumulation of
> lots and lots of hardware corner cases onto generic code. If I had known
> then what I know now I would not have created those generic clock types
> and I would have tried for an abstraction layer between generic stuff
> (e.g. find the best divider) and the real hardware stuff (write to the
> register). Instead I kept all of it together and now things are super
> ugly.

Yeah.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
