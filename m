From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Sat, 21 Jul 2012 14:38:13 +0800
Message-ID: <20120721063811.GA619@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <CAMQu2gw32LogXJJa+K5ZjmCZzBNK3FY2wYwZXU8fsftsVzEO2Q@mail.gmail.com>
 <20120720123317.GA32263@S2101-09.ap.freescale.net>
 <CAJOA=zMQKLTumW7Nx68+yxHC5Yk4QyiL2mf1+TSZfVOAtnXDWA@mail.gmail.com>
 <CAMQu2gy4p+rL-sDAsGCnqSn_2eXwSqf---OS0BSXuDoacjd6_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMQu2gy4p+rL-sDAsGCnqSn_2eXwSqf---OS0BSXuDoacjd6_g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Cc: "Turquette, Mike" <mturquette@ti.com>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 21, 2012 at 10:34:29AM +0530, Shilimkar, Santosh wrote:
> On Fri, Jul 20, 2012 at 9:20 PM, Turquette, Mike <mturquette@ti.com> wrote:
> > How about cpufreq-single-thread.c and CONFIG_CPUFREQ_SINGLE_THREAD?
> > That makes sense for both UP and SMP.
> >
> Indeed. This sounds more appropriate and also reflects what actually happens
> with a UP or shared clock SMP case.
> 
While I agree with this observation, the suggested naming does not
reflect the rationale of CPU0 though, which is really important for
driver to work, and is exactly the thing I like about *_CPU0 naming.

The driver needs the following stuff around CPU0 to be functional.

- Device tree node /cpus/cpu@0
- clk lookup with dev_id being "cpu0"
- regulator with id being "cpu0"

I think the *_CPU0 naming does a better job on emphasising those in the
first place.

-- 
Regards,
Shawn

