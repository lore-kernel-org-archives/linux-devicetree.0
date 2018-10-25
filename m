From: <jiada_wang@mentor.com>
Subject: [PATCH linux-next v1 0/4] Add AVB Counter Clock
Date: Thu, 25 Oct 2018 16:23:45 +0900
Message-ID: <20181025072349.15173-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

From: Jiada Wang <jiada_wang@mentor.com>

on R-Car SoCs there are AVB Counter Clocks, each clock has 12bits integral
and 8 bits fractional dividers which operates with S0D1ϕ clock.

This patch set adds avb clock provider, which registers all 8 AVB
Counter Clocks, and provide them via clock provider.

AVB Clock node are added to R-Car ULCB and Salvator boards,
so that like Audio Clock Generator (ADG) can use avb counter clocks
via common clock framework.


Jiada Wang (4):
  clk: renesas: clk-avb: add AVB Clock driver
  clk: renesas: Add binding document for AVB Counter Clock
  arm64: ulcb: Add avb counter clock
  arm64: salvator-common: Add avb counter clock

 .../bindings/clock/renesas,avb-clk.txt        |  19 ++
 .../boot/dts/renesas/salvator-common.dtsi     |   6 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   6 +
 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-avb.c                 | 257 ++++++++++++++++++
 6 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
 create mode 100644 drivers/clk/renesas/clk-avb.c

-- 
2.17.0
