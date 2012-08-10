From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/3] Add a generic cpufreq-cpu0 driver
Date: Fri, 10 Aug 2012 13:37:22 +0800
Message-ID: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Patch "cpufreq: Add a generic cpufreq-cpu0 driver" has a dependency
on following branch.

 git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git topic/tol

Changes since v2:
* Drop patch "regulator: add a new API regulator_set_voltage_tol()",
  which has been applied on regulator tree as above.
* Rewrite function of_init_opp_table to make it concise.
  
Regards,
Shawn

Richard Zhao (1):
  ARM: add cpufreq transiton notifier to adjust loops_per_jiffy for smp

Shawn Guo (2):
  PM / OPP: Initialize OPP table from device tree
  cpufreq: Add a generic cpufreq-cpu0 driver

 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |   55 ++++
 Documentation/devicetree/bindings/power/opp.txt    |   25 ++
 arch/arm/kernel/smp.c                              |   54 ++++
 drivers/base/power/opp.c                           |   47 ++++
 drivers/cpufreq/Kconfig                            |   11 +
 drivers/cpufreq/Makefile                           |    2 +
 drivers/cpufreq/cpufreq-cpu0.c                     |  271 ++++++++++++++++++++
 include/linux/opp.h                                |    8 +
 8 files changed, 473 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
 create mode 100644 Documentation/devicetree/bindings/power/opp.txt
 create mode 100644 drivers/cpufreq/cpufreq-cpu0.c

-- 
1.7.5.4


