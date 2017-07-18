From: Adriana Reus <adriana.reus@nxp.com>
Subject: [PATCH 0/2] clk: imx: imx7d: Fixes for imx7d-ccm clock driver
Date: Tue, 18 Jul 2017 10:44:50 +0300
Message-ID: <1500363892-1173-1-git-send-email-adriana.reus@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, fabio.estevam@nxp.com, shawnguo@kernel.org, anson.huang@nxp.com, Adriana Reus <adriana.reus@nxp.com>
List-Id: devicetree@vger.kernel.org

The first patch sets the OCRAM_CLK parent to main_axi_root_clk instead of
axi_post_div.

The second patch removes the ARM_M0 clock.
IMX7d does not have an M0 and this clock is not otherwise used.

Adriana Reus (2):
  clk: imx: imx7d: Fix parent clock for OCRAM_CLK
  clk: imx: imx7d: Remove ARM_M0 clock

 drivers/clk/imx/clk-imx7d.c             |  11 +-
 include/dt-bindings/clock/imx7d-clock.h | 742 ++++++++++++++++----------------
 2 files changed, 370 insertions(+), 383 deletions(-)

-- 
2.7.4

