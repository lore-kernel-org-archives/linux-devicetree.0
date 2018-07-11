Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] clk: renesas: mstp: Add support for RZ/A2
Date: Wed, 11 Jul 2018 12:03:11 -0500
Message-Id: <20180711170313.80321-1-chris.brandt@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for RZ/A2 series.
The clock HW is similar to RZ/A1, but with different dividers
and additional clocks sources.


Chris Brandt (2):
  clk: renesas: mstp: Add support for r7s9210
  clk: renesas: mstp: Document R7S9210 support

 .../bindings/clock/renesas,cpg-mstp-clocks.txt     |   1 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/clk-mstp.c                     |   3 +
 drivers/clk/renesas/clk-rz.c                       | 155 ++++++++++++++++-----
 5 files changed, 131 insertions(+), 34 deletions(-)

-- 
2.16.1
