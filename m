From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: [PATCH 0/5] arm: sun9i: Support AXP808 PMIC and Sunchip CX-A99 board
Date: Thu, 26 Jan 2017 22:22:42 +0100 (CET)
Message-ID: <cover.1485456003.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series add support for the Sunchip CX-A99 board, which is used in
a few media players, making it the third device with an Allwinner A80 SoC
to be supported. The board uses the X-Powers AXP808 PMIC which this patch
series also adds support for.

Patch 1 adds a documentation line which was forgotten when device tree
bindings for the axp20x family were updated for the AXP806 PMIC. A line
immediately below the missing line will be inserted by patch 2, so I'm
including patch 1 in this series to avoid conflicts between patches.

Patch 2 adds the AXP808 to the axp20x device tree bindings.

Patch 3 adds support for the AXP808 to the axp20x MFD driver.

Patch 4 adds support for the AXP808 to the axp20x regulator driver.

Patch 5 add the device tree for the Sunchip CX-A99 board. This patch is v5 of
the only remaining patch from v4 of the patch series posted back in August.
Support for the AXP808 has made major improvements possible, notably Wifi.

Before trying out this patch series, you must also apply the patch
"regulator: axp20x: AXP806: Fix dcdcb being set instead of dcdce" [1]
to avoid damage to the DRAM chips through over-voltage.

[1] https://patchwork.kernel.org/patch/9530319/

Rask Ingemann Lambertsen (5):
  DT: mfd: axp20x: Add AXP806 to list of current AXP20x family members
  DT: mfd: axp20x: Add binding for the AXP808
  mfd: axp20x: Add support for the AXP808 PMIC
  regulator: axp20x: Add support for the AXP808 PMIC
  ARM: dts: sun9i: Initial support for the Sunchip CX-A99 board

 Documentation/devicetree/bindings/mfd/axp20x.txt |   8 +-
 arch/arm/boot/dts/Makefile                       |   3 +-
 arch/arm/boot/dts/sun9i-a80-cx-a99.dts           | 413 +++++++++++++++++++++++
 drivers/mfd/axp20x-rsb.c                         |   1 +
 drivers/mfd/axp20x.c                             |  28 ++
 drivers/regulator/axp20x-regulator.c             |   7 +-
 include/linux/mfd/axp20x.h                       |   1 +
 7 files changed, 455 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun9i-a80-cx-a99.dts

-- 
2.10.2
