From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [RESEND, PATCH v4 0/2] cpufreq: Add sunxi nvmem based CPU scaling driver
Date: Wed, 12 Jun 2019 12:28:14 -0400
Message-ID: <20190612162816.31713-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, rjw@rjwysocki.net, davem@davemloft.net, mchehab+samsung@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add sunxi nvmem based CPU scaling driver, refers to qcom-cpufreq-kryo.

Yangtao Li (2):
  cpufreq: Add sun50i nvmem based CPU scaling driver
  dt-bindings: cpufreq: Document allwinner,sun50i-h6-operating-points

 .../bindings/opp/sun50i-nvmem-cpufreq.txt     | 167 +++++++++++++
 MAINTAINERS                                   |   7 +
 drivers/cpufreq/Kconfig.arm                   |  12 +
 drivers/cpufreq/Makefile                      |   1 +
 drivers/cpufreq/cpufreq-dt-platdev.c          |   2 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        | 226 ++++++++++++++++++
 6 files changed, 415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/opp/sun50i-nvmem-cpufreq.txt
 create mode 100644 drivers/cpufreq/sun50i-cpufreq-nvmem.c

---
v4:
-Remove sunxi_cpufreq_soc_data structure for now.
-Convert to less generic name.
-Update soc_bin xlate.
v3:
-update changelog and title
-convert compatibles to allwinner,cpu-operating-points-v2
-document the valid names for opp-microvolt-<name>
v2:
-update changelog
-convert to dev_pm_opp_set_prop_name instead of
 dev_pm_opp_set_supported_hw
-some change in OPP Node  
--- 
2.17.0
