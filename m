From: Richard Zhao <richard.zhao@linaro.org>
Subject: [PATCH V2 0/4] add arm soc generic cpufreq driver
Date: Fri, 16 Dec 2011 18:30:58 +0800
Message-ID: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, kernel@pengutronix.de, shawn.guo@linaro.org, eric.miao@linaro.org, mark.langsdorf@calxeda.com, linaro-dev@lists.linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The driver support single core and multi core ARM SoCs. For multi core,
it assume all cores share the same clock and voltage.

Changes in v2:
 - add volatage change support
 - change '_' in property name to '-'
 - use initial value to calculate loops_per_jiffy
 - fix reading cpu_volts property bug 
 - let cpufreq_frequency_table_cpuinfo routines handle cpu_freq_khz_max/min
 - don't change freq in arm_cpufreq_exit, because every core share the same freq.
 - use unsigned long describe frequency as much as possible. Because clk use
   unsigned long, but cpufreq use unsigned int.

[PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
[PATCH V2 2/4] dts/imx6q: add cpufreq property
[PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev
[PATCH V2 4/4] arm/imx6q: select ARCH_HAS_CPUFREQ

Thanks
Richard

