From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/3] ARM: add cpufreq transiton notifier to adjust
 loops_per_jiffy for smp
Date: Fri, 20 Jul 2012 15:56:54 +0800
Message-ID: <20120720075652.GA31866@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-2-git-send-email-shawn.guo@linaro.org>
 <CAMQu2gz3XXQdG3T=jSboZ8cW-gKO33k7+OUPaQpjpUcnitk_RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMQu2gz3XXQdG3T=jSboZ8cW-gKO33k7+OUPaQpjpUcnitk_RA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2012 at 12:06:50PM +0530, Shilimkar, Santosh wrote:
> On Thu, Jul 19, 2012 at 9:24 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > From: Richard Zhao <richard.zhao@linaro.org>
> >
> > If CONFIG_SMP, cpufreq skips loops_per_jiffy update, because different
> > arch has different per-cpu loops_per_jiffy definition.
> >
> > Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> > Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> Nice. Avoids other driver duplicating this code.
> May be you can keep Richard's credit in commit too.
> 
It's all Richard's credit in the commit.

> FWIW, Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>

Thanks.

-- 
Regards,
Shawn

