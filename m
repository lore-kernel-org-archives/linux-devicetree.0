From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v3 0/5] power: supply: MAX17040: Add IRQ for low level and alert SOC changes
Date: Sun, 26 May 2019 23:22:53 -0300
Message-ID: <20190527022258.32748-1-matheus@castello.eng.br>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org, krzk@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, cw00.choi@samsung.com, b.zolnierkie@samsung.com, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

This series add IRQ handler for low level SOC alert, define a devicetree
binding attribute to configure the alert level threshold and check for
changes in SOC and power supply status for send uevents.

Max17040 have a pin for alert host about low level state of charge and
this alert can be configured in a threshold from 1% up to 32% of SOC.

Tested on Toradex Colibri iMX7D, with a SparkFun Lipo Fuel Gauge module
based on MAXIM MAX17043.

Thanks Krzysztof and Rob for yours time reviewing it. Let me know what
you think about the fixes.

Krzysztof I added a new patch to the series to check the battery charge up
and clear ALRT bit when the SOC is above alert threshold, so not generating
duplicate interrupts.

Changes since v1:
(Suggested by Krzysztof Kozlowski)
- Put common code from max17040_work and max17040_thread_handler in a function
- Code style fixes
- Define mask and low level threshold alert default
- Check return value from max17040_set_soc_threshold
- Set low level state of charge threshold before IRQ
- CC maintainers from drivers/mfd/max14577
- Use flags from FDT client->flags instead hard coded it
- Mention interrupts on DT Documentation
- Fix "maxim,max77836-battery" missed from DT Documentation
- Fix commit description

Changes since v2:
(Suggested by Krzysztof Kozlowski)
- Fix ebusy exception
- Remove device_init_wakeup from probe, let wakeup-source from DT decide that
- Fix the use of "charger" to fuel-gauge on device tree description
- Clear ALRT bit while setting the SOC threshold
- Check SOC and clear ALRT bit when the SOC are above alert threshold
- Fix unnecessary uevent when SOC is an ERRNO
- Notify user space when power supply status change

(Suggested by Rob Herring)
- Fix the use of "charger" to fuel-gauge on device tree description
- Add the (%) units on the description of property
- Drop interrupt-parent
- Fix name of property to let clear that is a low level SOC alert

Matheus Castello (5):
  power: supply: max17040: Add IRQ handler for low SOC alert
  dt-bindings: power: supply: Max17040: Add low level SOC alert
    threshold
  power: supply: max17040: Config alert SOC low level threshold from FDT
  power: supply: max17040: Clear ALRT bit when the SOC are above
    threshold
  power: supply: max17040: Send uevent in SOC and status change

 .../power/supply/max17040_battery.txt         |  28 ++++
 drivers/power/supply/max17040_battery.c       | 134 +++++++++++++++++-
 2 files changed, 158 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/max17040_battery.txt

--
2.20.1
