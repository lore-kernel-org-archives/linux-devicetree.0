From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 RESEND 0/9] mfd: rk808: Add RK805 support
Date: Mon, 21 Aug 2017 03:28:33 +0200
Message-ID: <20170821012842.17875-1-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Hi Lee,

as we talked about on IRC on friday, here are the patches enabling
rk805 support in the common rk808 driver. As we agreed I've dropped
the cosmetic patches for clk and rtc adding the rk805 to the Kconfig
helptext and I've also dropped the input driver patch, which Dmitry
already applied.

I've also checked that the patches apply to your mfd-next branch.


Thanks for considering these
Heiko


old changelog from Joseph

change in v9:
PATCH V9 1/12: (1) fix spelling issue: s/Chip/chip/
	       (2) apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 2/12: apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 3/12: None
PATCH V9 4/12: apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 5/12: None
PATCH V9 6/12: None
PATCH V9 7/12: apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 8/12: apply tag: Acked-by: Linus Walleij <linus.walleij@linaro.org>
PATCH V9 9/12: None (Actually, something directly updated by Dmitry Torokhov and applied on PATCH V7.
	       Link: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
PATCH V9 10/12: apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 11/12: apply tag: Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
PATCH V9 12/12: None

change in v8:
PATCH V8 1/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 2/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 3/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 4/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 5/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 6/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 7/12: add: Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
PATCH V8 8/12: (1) Kconfig: update coding style
	       (2) pinctrl-rk805.c: using #include <linux/gpio/driver.h>
	       (3) pinctrl-rk805.c: inline data and open code it; remove FUNCTION_GROUP and PINGROUP macros definition 
PATCH V8 9/12: NO change in V8
PATCH V8 10/12: apply tag: Acked-by: Linus Walleij <linus.walleij@linaro.org>	
PATCH V8 11/12: NO change in V8
PATCH V8 12/12: (1) using semicolon after "output-high"
		(2) apply tag: Acked-by: Linus Walleij <linus.walleij@linaro.org>

change in v7:
PATCH V7 1/12: NO change in V7
PATCH V7 2/12: NO change in V7
PATCH V7 3/12: fix missing: Acked-by: Mark Brown <broonie@kernel.org>
PATCH V7 4/12: NO change in V7
PATCH V7 5/12: NO change in V7
PATCH V7 6/12: NO change in V7
PATCH V7 7/12: fix missing: Acked-by: Rob Herring <robh@kernel.org>
PATCH V7 8/12: abandon drivers/gpio/gpio-rk805.c and add drivers/pinctrl/pinctrl-rk805.c
PATCH V7 9/12: reset author and signed off with my english name
	       reset MODULE_AUTHOR() with my english name
	       replace devm_request_threaded_irq() with devm_request_any_context_irq()
PATCH V7 10/12: replace 'gpio-rk805' with 'pinctrl-rk805' in struct mfd_cell rk805s[]
PATCH V7 11/12: NO change in V7
PATCH V7 12/12: dt-bindings: abandon gpio-rk805.txt and add pinctrl-rk805.txt

change in v6:
patch1~7 no changed in V6.
add patch 8~12 for gpio and powerkey func for rk805.

change in v5:
PATCH V5 1/7: NO change in V5
PATCH V5 2/7: fix the rk805 reg addr in numerical order
PATCH V5 3/7: NO change in V5
PATCH V5 4/7: fix up the rk805_device_shutdown func
PATCH V5 5/7: NO change in V5
PATCH V5 6/7: NO change in V5
PATCH V5 7/7: fix up the description of the rk805

change in v4:
PATCH V4 1/7: NO change in V4
PATCH V4 2/7: rename the commit message
PATCH V4 3/7: NO change in V4
PATCH V4 4/7: Split this patch up into subsystems patch 5/7 6/7
PATCH V4 5/7: new added
PATCH V4 6/7: new added
PATCH V4 7/7: NO change in V4


change in V3:
PATCH V3 1/5: NO change in V3
PATCH V3 2/5: add rk805 RTC INT MASK define
PATCH V3 3/5: RK805 set suspend enable and disable is different from rk808
              use rk805_regs_ops and rk805_switch_ops
PATCH V3 4/5: fix up the shutdown func
              use pm_shutdown_prepare_fn to prepare shutdown
              and pm_pwroff_fn pull down gpio to shut down rk805
              it will update in the future(after rk808 support gpio func)
PATCH V3 5/5: NO change in V3

change in V2:
PATCH V2 1/5: NO change in V2
PATCH V2 2/5: add rk805 BUCK ILMAX define
PATCH V2 3/5: NO change in V2
PATCH V2 4/5: setting RK805 BUCK ILMAX in pre init
PATCH V2 5/5: Add RK805 device tree bindings document


Elaine Zhang (5):
  mfd: rk808: fix up the chip id get failed
  mfd: rk808: add rk805 regs addr and ID
  regulator: rk808: Add regulator driver for RK805
  mfd: dt-bindings: Add RK805 device tree bindings document
  mfd: rk808: Add RK805 support

Joseph Chen (4):
  pinctrl: dt-bindings: add bindings for Rockchip RK805 PMIC
  pinctrl: Add pinctrl driver for the RK805 PMIC
  mfd: rk808: Add RK805 pinctrl support
  mfd: rk808: Add RK805 power key support

 Documentation/devicetree/bindings/mfd/rk808.txt    |  22 +-
 .../devicetree/bindings/pinctrl/pinctrl-rk805.txt  |  63 +++
 drivers/mfd/Kconfig                                |   4 +-
 drivers/mfd/rk808.c                                | 147 +++++-
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rk805.c                    | 493 +++++++++++++++++++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/rk808-regulator.c                | 130 ++++++
 include/linux/mfd/rk808.h                          | 121 +++++
 10 files changed, 983 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
 create mode 100644 drivers/pinctrl/pinctrl-rk805.c

-- 
2.14.1
