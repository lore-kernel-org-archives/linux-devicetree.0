From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 0/5] Refactor of ARM64 sunxi pinctrl enabling and add A64
 R_PIO driver
Date: Thu,  2 Mar 2017 02:01:06 +0800
Message-ID: <20170301180111.12365-1-icenowy@aosc.xyz>
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
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Nearly all Allwinner SoCs need a per-SoC pinctrl driver, some will need one
more for the R_PIO pin controller.

This patchset try to refactor the enabling method of pinctrl drivers for
64-bit Allwinner SoCs, to prevent furthur change of Kconfig.platforms when
adding new SoC support.

Thus, the R_PIO pin controller driver for A64 will be added, and use the
new method to get it enabled when building 64-bit sunxi kernel.

The first patch makes the default value of pinctrl drivers about 64-bit
Allwinner SoCs (ARM64 && ARCH_SUNXI), which means 64-bit Allwinner SoCs.

The second patch then clean up Kconfig.platforms. It must be applied after
the first one, otherwise newly built 64-bit Allwinner kernel will have no
pinctrl drivers and become unusable.

The third patch is only a small fix for a typo in H5 generic pinctrl
compatible.

The fourth patch adds compatible for A64 R_PIO pin controller.

The fifth patch really introduces the A64 R_PIO pin controller driver,
it still cannot be enabled in device tree, as we lack the R_CCU driver.

Icenowy Zheng (5):
  pinctrl: sunxi: refactor pinctrl choice selecting for ARM64
  arm64: only select PINCTRL for Allwinner platforms
  dt-bindings: fix for Allwinner H5 pinctrl's compatible
  dt: bindings: add binding for Allwinner A64 R_PIO pinctrl
  pinctrl: sunxi: Add A64 R_PIO controller support

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   3 +-
 arch/arm64/Kconfig.platforms                       |   1 -
 drivers/pinctrl/sunxi/Kconfig                      |  12 +-
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c       | 125 +++++++++++++++++++++
 5 files changed, 136 insertions(+), 6 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c

-- 
2.11.1
