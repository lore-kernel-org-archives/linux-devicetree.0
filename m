From: Richard Zhao <richard.zhao@linaro.org>
Subject: [PATCH V3 0/7] add a generic cpufreq driver
Date: Mon, 19 Dec 2011 11:21:36 +0800
Message-ID: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, kernel@pengutronix.de, shawn.guo@linaro.org, catalin.marinas@arm.com, eric.miao@linaro.org, mark.langsdorf@calxeda.com, davidb@codeaurora.org, arnd@arndb.de, bryanh@codeaurora.org, jamie@jamieiles.com, marc.zyngier@arm.com, linaro-dev@lists.linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The driver support single core and multi core ARM SoCs. For multi core,
it assume all cores share the same clock and voltage.

TODO:
 - Add each core seperate freq/volt support (MSM).

Changes in v3:
 - move adjusting smp loops_per_jiffy to arm common code,
   and also adjust global loops_per_jiffy.
 - remove adjusting loops_per_jiffy in imx and omap cpufreq drivers.
 - check compatible "generic-cpufreq" when module_init
 - change printk to pr_xxx
 - add generic-cpufreq DT binding doc

Changes in v2:
 - add volatage change support
 - change '_' in property name to '-'
 - use initial value to calculate loops_per_jiffy
 - fix reading cpu_volts property bug 
 - let cpufreq_frequency_table_cpuinfo routines handle cpu_freq_khz_max/min
 - don't change freq in arm_cpufreq_exit, because every core share the same freq.
 - use unsigned long describe frequency as much as possible. Because clk use
   unsigned long, but cpufreq use unsigned int.
[PATCH V3 1/7] ARM: add cpufreq transiton notifier to adjust
[PATCH V3 2/7] arm/imx: cpufreq: remove loops_per_jiffy recalculate
[PATCH V3 3/7] cpufreq: OMAP: remove loops_per_jiffy recalculate for
[PATCH V3 4/7] cpufreq: add generic cpufreq driver
[PATCH V3 5/7] dts/imx6q: add cpufreq property
[PATCH V3 6/7] arm/imx6q: register arm_clk as cpu to clkdev
[PATCH V3 7/7] arm/imx6q: select ARCH_HAS_CPUFREQ

