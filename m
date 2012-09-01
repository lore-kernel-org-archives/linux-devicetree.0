From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH v3 0/3] Add a generic cpufreq-cpu0 driver
Date: Sat, 1 Sep 2012 07:53:26 +0200
Message-ID: <201209010753.27095.rjw@sisk.pl>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <20120831064236.GB3271@r65073-Latitude-D630>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120831064236.GB3271@r65073-Latitude-D630>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday, August 31, 2012, Shawn Guo wrote:
> Ping, Rafael.

Yeah, sorry for the delay.

I'll get to it when I get back from LinuxCon/Plumbers Conf. (early next week).

Thanks,
Rafael


> On Fri, Aug 10, 2012 at 01:37:22PM +0800, Shawn Guo wrote:
> > Patch "cpufreq: Add a generic cpufreq-cpu0 driver" has a dependency
> > on following branch.
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git topic/tol
> > 
> > Changes since v2:
> > * Drop patch "regulator: add a new API regulator_set_voltage_tol()",
> >   which has been applied on regulator tree as above.
> > * Rewrite function of_init_opp_table to make it concise.
> >   
> > Regards,
> > Shawn
> > 
> > Richard Zhao (1):
> >   ARM: add cpufreq transiton notifier to adjust loops_per_jiffy for smp
> > 
> > Shawn Guo (2):
> >   PM / OPP: Initialize OPP table from device tree
> >   cpufreq: Add a generic cpufreq-cpu0 driver
> > 
> >  .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |   55 ++++
> >  Documentation/devicetree/bindings/power/opp.txt    |   25 ++
> >  arch/arm/kernel/smp.c                              |   54 ++++
> >  drivers/base/power/opp.c                           |   47 ++++
> >  drivers/cpufreq/Kconfig                            |   11 +
> >  drivers/cpufreq/Makefile                           |    2 +
> >  drivers/cpufreq/cpufreq-cpu0.c                     |  271 ++++++++++++++++++++
> >  include/linux/opp.h                                |    8 +
> >  8 files changed, 473 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
> >  create mode 100644 Documentation/devicetree/bindings/power/opp.txt
> >  create mode 100644 drivers/cpufreq/cpufreq-cpu0.c
> > 
> 
> 
> 

