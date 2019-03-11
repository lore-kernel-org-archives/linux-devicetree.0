From: Eric Nelson <eric@nelint.com>
Subject: [V2 0/2] ARM: imx6qdl: remove PLL4_AUDIO_DIV clock
Date: Mon, 11 Mar 2019 08:59:55 -0700
Message-ID: <1552319997-24622-1-git-send-email-eric@nelint.com>
References: <1552304271.2453.12.camel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552304271.2453.12.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com, Eric Nelson <eric@nelint.com>
List-Id: devicetree@vger.kernel.org

This series removes the unsupported PLL4_AUDIO_DIV clock which appeared
in early versions of the i.MX6DQ reference manual, but doesn't function
as described in the current clock driver (i.e., it's a divide-by-1).

Since the clock node is also used to control the topology of the clock
tree, the PLL4_POST_DIV node is used to control parenting of downstream
SSI, CKO1, and ESAI/ASRC/SPDIF peripherals.

The first patch removes the clock, and the second updates several
device tree files to use PLL4_POST_DIV to select proper parents.

Eric Nelson (2):
  clk: imx6q: remove unsupported pll4_audio_div
  ARM: dts: imx6q: remove references to PLL4_AUDIO_DIV

 arch/arm/boot/dts/imx6q-cm-fx6.dts        |  4 ++--
 arch/arm/boot/dts/imx6q-novena.dts        |  2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi  |  2 +-
 drivers/clk/imx/clk-imx6q.c               |  7 +++----
 include/dt-bindings/clock/imx6qdl-clock.h | 10 +++++++++-
 5 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.7.4
