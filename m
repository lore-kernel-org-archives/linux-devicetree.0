From: Jian Hu <jian.hu@amlogic.com>
Subject: [PATCH v5 0/2] clk: meson-g12a: Add EE clock controller driver
Date: Thu, 29 Nov 2018 21:41:55 +0800
Message-ID: <1543498917-98605-1-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes since v4 at[5]
-add bypass clock "g12a_ee_core" from DT
-fix Kconfig description
-change g12a_mpll0_div/g12a_mpll1_div/g12a_mpll2_div/g12a_mpll3_div 
 clock's parent name as fixed_pll_dco
-drop CLK_SET_RATE_PARENT flag for pll clock
-drop CLK_GET_RATE_NOCACHE flag for pll_dco clock
-delete usless note
-enable G12A clock driver

Changes since v3 at[4]
-add fixed clocks clk_regmap definition

Changes since v2 at[2]
-fix fixed clocks's descriptions
-fix alignment
-add enable bit for plls base on [3] patches
-add fixed clock gate bit

Changes since v1 at[1]
-fix typo of 'Everything'.
-change the word 'AmLogic' to 'Amlogic'
-squash patch 1 and 2.
-delete usless message of "Trying obsolete regs".
-delete the empty line in include/dt-bindings/clock/g12a-clkc.h.
-rebase on top of the "next/drivers" branch, and add g12a clock patch.
-add CLK_MUX_ROUND_CLOSEST for g12a_sd_emmc_b_clk0_sel and
 g12a_sd_emmc_c_clk0_sel.

[1]https://lkml.kernel.org/r/1531133549-25806-2-git-send-email-jian.hu@amlogic.com
[2]https://lkml.kernel.org/r/1531728707-192230-2-git-send-email-jian.hu@amlogic.com
[3]https://lkml.kernel.org/r/20180717095617.12240-1-jbrunet@baylibre.com
[4]https://lkml.kernel.org/r/1533890858-113020-1-git-send-email-jian.hu@amlogic.com
[5]https://lkml.kernel.org/r/1541511349-121152-1-git-send-email-jian.hu@amlogic.com

Jian Hu (2):
  dt-bindings: clk: meson-g12a: Add G12A EE Clock Bindings
  clk: meson-g12a: Add EE Clock controller driver

 .../bindings/clock/amlogic,gxbb-clkc.txt           |    1 +
 arch/arm64/Kconfig.platforms                       |    1 +
 drivers/clk/meson/Kconfig                          |    8 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/g12a.c                           | 1185 ++++++++++++++++++++
 drivers/clk/meson/g12a.h                           |  130 +++
 include/dt-bindings/clock/g12a-clkc.h              |   93 ++
 7 files changed, 1419 insertions(+)
 create mode 100644 drivers/clk/meson/g12a.c
 create mode 100644 drivers/clk/meson/g12a.h
 create mode 100644 include/dt-bindings/clock/g12a-clkc.h

-- 
1.9.1
