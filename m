Return-Path: <SRS0=+qJk=MW=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/3] mmc: tmio_mmc: Add support for RZ/A2
Date: Wed, 10 Oct 2018 10:06:39 -0500
Message-Id: <20181010150642.73890-1-chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Basically the same HW block that was used in R-Car Gen 3 is used in
RZ/A2 (with only a couple small differences).

Not sure if you're going to like the Kconfig change or not.

Chris Brandt (3):
  clk: renesas: r7s9210: Add SDHI clocks
  mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
  dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
 drivers/mmc/host/Kconfig                           |  5 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
 4 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.16.1
