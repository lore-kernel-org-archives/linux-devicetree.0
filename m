Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] clk: renesas: Add support for R-Car E3
Date: Wed, 11 Apr 2018 18:37:25 +0900
Message-Id: <1523439447-1084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-drivers-2018-04-03-v4.16 tag of
renesas-drivers.git.

Takeshi Kihara (1):
  clk: renesas: Add r8a77990 CPG Core Clock Definitions

Yoshihiro Shimoda (1):
  clk: renesas: cpg-mssr: Add support for R-Car E3

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c            | 291 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a77990-cpg-mssr.h      |  63 +++++
 7 files changed, 369 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r8a77990-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h

-- 
1.9.1
