From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH v2 0/5] Introduce Power domain based warming device driver
Date: Tue, 10 Sep 2019 13:14:31 -0400
Message-ID: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org, daniel.lezcano@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Certain resources modeled as a generic power domain in linux kernel 
can be used to warm up the SoC (mx power domain on sdm845)
if the temperature falls below certain threshold. These power domains
can be considered as thermal warming devices.
(opposite of thermal cooling devices).

In kernel, these warming devices can be modeled as a 
thermal cooling device. In fact, since linux kernel today has
no instance of a resource modeled as a power domain acting as a
thermal warming device, a generic power domain based thermal warming device
driver that can be used pan-Socs is the approach taken in this
patch series. Since thermal warming devices can be thought of as the
mirror opposite of thermal cooling devices, this patch series re-uses
thermal cooling device framework. To use these power domains as warming
devices require further tweaks in the thermal framework which are out of
scope of this patch series.

The first patch in this series extends the genpd framework to export out
the performance states of a power domain so that when a power
domain is modeled as a cooling device, the number of possible states and
current state of the cooling device can be retrieved from the genpd
framework.

The second patch implements the newly added genpd callback for Qualcomm
RPMH power domain driver which hosts the mx power domain.

The third patch describes the dt binding required for a generic
power domain based warming device

The fourth patch introduces the generic power domain warming device driver

The fifth patch introduces the DT entreis for sdm845 to register mx power
domain as a thermal warming device

v1->v2:
	- Rename the patch series from
	"qcom: Model RPMH power domains as thermal cooling devices" to
	"Introduce Power domain based thermal warming devices" as it is
	more appropriate.
	- Introduce a new patch(patch 3) describing the dt-bindings for generic power
	domain warming device.
	- Patch specific changes mentioned in respective patches.

Thara Gopinath (5):
  PM/Domains: Add support for retrieving genpd performance states
    information
  soc: qcom: rpmhpd: Introduce function to retrieve power domain
    performance state count
  dt-bindings: thermal: Add generic power domain warming device binding
  thermal: Add generic power domain warming device driver.
  arm64: dts: qcom: Add node for RPMH power domain warming device on
    sdm845.

 .../bindings/thermal/pwr-domain-warming.txt        |  32 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   7 +
 drivers/base/power/domain.c                        |  37 +++++
 drivers/soc/qcom/rpmhpd.c                          |   9 ++
 drivers/thermal/Kconfig                            |  11 ++
 drivers/thermal/Makefile                           |   2 +
 drivers/thermal/pwr_domain_warming.c               | 174 +++++++++++++++++++++
 include/linux/pm_domain.h                          |  13 ++
 8 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
 create mode 100644 drivers/thermal/pwr_domain_warming.c

-- 
2.1.4
