From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add a generic cpufreq-cpu0 driver
Date: Thu, 19 Jul 2012 23:54:38 +0800
Message-ID: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

This is a continuous effort of Richard's work [1].  But that generic
cpufreq driver has been rewritten with taking omap-cpufreq.c as the
reference to adopt OPP library.

Same as Richard's patch, the driver has no intention to support the
multi-core systems that frequency and voltage can be scaled
independently on different CPUs.  Instead, it aims at uniprocessor (UP)
and those symmetric multiprocessor (SMP) systems which share clock and
voltage across all CPUs.

I have seen patch from Mike changing omap-cpufreq driver to scale
regulator from clk notifier.  We can definitely make the same move
for cpufreq-cpu0 later when the patch gets accepted.

Regards,
Shawn

[1] http://thread.gmane.org/gmane.linux.kernel.cpufreq/7688/focus=7688

---

Richard Zhao (1):
  ARM: add cpufreq transiton notifier to adjust loops_per_jiffy for smp

Shawn Guo (2):
  PM / OPP: Initialize OPP table from device tree
  cpufreq: Add a generic cpufreq-cpu0 driver

 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |   58 +++++
 Documentation/devicetree/bindings/power/opp.txt    |   29 +++
 arch/arm/kernel/smp.c                              |   54 +++++
 drivers/base/power/opp.c                           |   66 ++++++
 drivers/cpufreq/Kconfig                            |   11 +
 drivers/cpufreq/Makefile                           |    2 +
 drivers/cpufreq/cpufreq-cpu0.c                     |  235 ++++++++++++++++++++
 include/linux/opp.h                                |    4 +
 8 files changed, 459 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
 create mode 100644 Documentation/devicetree/bindings/power/opp.txt
 create mode 100644 drivers/cpufreq/cpufreq-cpu0.c

-- 
1.7.5.4


