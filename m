Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] clk: renesas: Add support for R-Car E3
Date: Fri, 20 Apr 2018 21:27:42 +0900
Message-Id: <1524227264-24896-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-devel-20180418-v4.17-rc1 tag of
renesas.git.

Changes from v1:
 - Remove POST3's definition in patch 1.
  Discussed on https://patchwork.kernel.org/patch/10335231/

 - Fix typo and some errors in patch 2.
 - Add Geert-san's Reviewed-by in patch 2.
  Discussed on https://patchwork.kernel.org/patch/10335235/

Takeshi Kihara (1):
  clk: renesas: Add r8a77990 CPG Core Clock Definitions

Yoshihiro Shimoda (1):
  clk: renesas: cpg-mssr: Add support for R-Car E3

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c            | 289 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a77990-cpg-mssr.h      |  62 +++++
 7 files changed, 366 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r8a77990-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h

-- 
1.9.1
