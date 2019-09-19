From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 0/4] thermal: Introduce support for monitoring falling temperatures.
Date: Wed, 18 Sep 2019 22:18:19 -0400
Message-ID: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thermal framework today supports monitoring for rising temperatures and
subsequently initiating cooling action in case of a trip point being 
crossed. There are scenarios where a SoC needs some warming action to be
activated if the temperature falls below a cetain allowable limit.
Since warming action can be considered mirror opposite of cooling action,
most of the thermal framework can be re-used to achieve this.

To enable thermal framework to monitor falling temperature, a new parameter
is added to the thermal trip point binding in the device tree to indicate
the direction(rising/falling) of temperature monitoring. Thermal DT
driver is extended to capture this information from the device tree 
entries and to reflect it in the thermal framework as a new enum
variable in the thermal trip point structure.
As an initial attempt, step-wise governor is extended to support
bi-directional monitoring of temprature if a trip point is hit, depending
on the newly introduced enum variable. Finally thermal sysfs entries are
extended to indicate the trip point monitor direction.

Patch series introducing various resources that are used as warming devices
on Qualcomm sdm845:
https://lkml.org/lkml/2019/7/29/749 (already merged)

https://lkml.org/lkml/2019/9/10/727 (under review)


Thara Gopinath (4):
  dt-bindings: thermal: Introduce monitor-falling binding to thermal
    trip point description
  thermal: Thermal core and sysfs changes needed to support
    bi-directional monitoring of trip points.
  thermal: of-thermal: Extend thermal dt driver to support
    bi-directional monitoring of a thermal trip point.
  thermal: step_wise: Extend thermal step-wise governor to monitor
    falling temperature.

 .../devicetree/bindings/thermal/thermal.txt        |  8 +++
 drivers/thermal/of-thermal.c                       | 22 ++++++++
 drivers/thermal/step_wise.c                        | 59 +++++++++++++++------
 drivers/thermal/thermal_sysfs.c                    | 60 ++++++++++++++++++++--
 include/linux/thermal.h                            | 10 ++++
 include/uapi/linux/thermal.h                       |  2 +-
 6 files changed, 141 insertions(+), 20 deletions(-)

-- 
2.1.4
