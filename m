From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v5 0/5] regulator: add Ricoh RN5T567 PMIC support
Date: Tue, 28 Jun 2016 22:53:17 -0700
Message-ID: <20160629055322.23038-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org
Cc: b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

This patchset adds RN5T567 PMIC support which is used on the 
Toradex Colibri iMX7S/iMX7D modules. The existing RN5T618 is from
the same family, hence this patchset uses the same driver and adds
variant support.

The Colibris currently do not use the PMIC's power off capabilities,
as do the current users of that PMIC driver. Therefore this patchset
also makes the use of the system-power-controller property mandatory
if the power off capabilties are required.

Changes since v4:
- Spell check in patch 5 and added Acks

Changes since v3:
- Use RN5T618_REPCNT_REPWRON macro when writing RN5T618_REPCNT register

Changes since v2:
- Elevate restart priority to 192 to make sure PMIC takes presedence
  over SoC level restart capabilities (e.g. watchdog)
- Print a warning if poweroff callback is already assigned
- Reorder of_id and variant assignment
- Lower delay to 1ms and justify why it is required
- Fix DCDC count and a typos in device tree bindings

Changes since v1:
- Removed obsolete include <asm/system_misc.h>

Stefan Agner (5):
  ARM: dts: meson: minix-neo-x8: define PMIC as power controller
  mfd: add Ricoh RN5T567 PMIC support
  regulator: rn5t618: add RN5T567 PMIC support
  mfd: rn5t618: register power off callback optionally
  mfd: rn5t618: register restart handler

 Documentation/devicetree/bindings/mfd/rn5t618.txt | 19 +++---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts         |  1 +
 drivers/mfd/Kconfig                               |  7 ++-
 drivers/mfd/rn5t618.c                             | 70 +++++++++++++++++++----
 drivers/regulator/Kconfig                         |  5 +-
 drivers/regulator/rn5t618-regulator.c             | 40 +++++++++++--
 include/linux/mfd/rn5t618.h                       | 13 +++++
 7 files changed, 126 insertions(+), 29 deletions(-)

-- 
2.9.0
