From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] Add a generic cpufreq-cpu0 driver
Date: Sun, 5 Aug 2012 23:05:17 +0800
Message-ID: <1344179121-17738-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Shilimkar Santosh <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
* Rebase on v3.6-rc1
* Add a patch introducing regulator_set_voltage_tol()
* Address review comments on v1

Richard Zhao (1):
  ARM: add cpufreq transiton notifier to adjust loops_per_jiffy for smp

Shawn Guo (3):
  PM / OPP: Initialize OPP table from device tree
  regulator: add a new API regulator_set_voltage_tol()
  cpufreq: Add a generic cpufreq-cpu0 driver

 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |   55 ++++
 Documentation/devicetree/bindings/power/opp.txt    |   25 ++
 arch/arm/kernel/smp.c                              |   54 ++++
 drivers/base/power/opp.c                           |   65 +++++
 drivers/cpufreq/Kconfig                            |   11 +
 drivers/cpufreq/Makefile                           |    2 +
 drivers/cpufreq/cpufreq-cpu0.c                     |  271 ++++++++++++++++++++
 include/linux/opp.h                                |    8 +
 include/linux/regulator/consumer.h                 |    7 +
 9 files changed, 498 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
 create mode 100644 Documentation/devicetree/bindings/power/opp.txt
 create mode 100644 drivers/cpufreq/cpufreq-cpu0.c

-- 
1.7.5.4
