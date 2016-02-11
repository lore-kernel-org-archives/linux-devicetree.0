From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 0/2] clk: Add Artpec-6 SoC support
Date: Thu, 11 Feb 2016 17:01:02 +0100
Message-ID: <cover.1455206007.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add clock support for the Artpec-6 SoC port. The ARM parts are in the series
"arm: Add Artpec-6 SoC" and it goes through the arm-soc tree.

Lars Persson (2):
  clk: add device tree binding for artpec-6 pll1 clock
  clk: add artpec-6 pll1 clock driver

 .../devicetree/bindings/clock/artpec6.txt          | 16 +++++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-artpec6.c                          | 70 ++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 drivers/clk/clk-artpec6.c

-- 
2.1.4
