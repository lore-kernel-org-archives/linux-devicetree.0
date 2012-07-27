From: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Fri, 27 Jul 2012 10:04:34 +0800
Message-ID: <20120727020433.GA3347@b20223-02.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <CAMQu2gw32LogXJJa+K5ZjmCZzBNK3FY2wYwZXU8fsftsVzEO2Q@mail.gmail.com>
 <20120720123317.GA32263@S2101-09.ap.freescale.net>
 <CAJOA=zMQKLTumW7Nx68+yxHC5Yk4QyiL2mf1+TSZfVOAtnXDWA@mail.gmail.com>
 <CAMQu2gy4p+rL-sDAsGCnqSn_2eXwSqf---OS0BSXuDoacjd6_g@mail.gmail.com>
 <20120721063811.GA619@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120721063811.GA619@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, "Turquette, Mike" <mturquette@ti.com>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 21, 2012 at 02:38:13PM +0800, Shawn Guo wrote:
> On Sat, Jul 21, 2012 at 10:34:29AM +0530, Shilimkar, Santosh wrote:
> > On Fri, Jul 20, 2012 at 9:20 PM, Turquette, Mike <mturquette@ti.com> wrote:
> > > How about cpufreq-single-thread.c and CONFIG_CPUFREQ_SINGLE_THREAD?
> > > That makes sense for both UP and SMP.
> > >
> > Indeed. This sounds more appropriate and also reflects what actually happens
> > with a UP or shared clock SMP case.
> > 
> While I agree with this observation, the suggested naming does not
> reflect the rationale of CPU0 though, which is really important for
> driver to work, and is exactly the thing I like about *_CPU0 naming.
> 
> The driver needs the following stuff around CPU0 to be functional.
> 
> - Device tree node /cpus/cpu@0
> - clk lookup with dev_id being "cpu0"
> - regulator with id being "cpu0"
> 
> I think the *_CPU0 naming does a better job on emphasising those in the
> first place.
Are we going to support the case in the future that cores has
independent freq? If yes, maybe we should have a more common name.

Thanks
Richard
> 
> -- 
> Regards,
> Shawn

