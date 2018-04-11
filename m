Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] soc: renesas: Add support for R-Car E3
Date: Wed, 11 Apr 2018 18:36:22 +0900
Message-Id: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-drivers-2018-04-03-v4.16 tag of
renesas-drivers.git.

Takeshi Kihara (4):
  soc: renesas: identify R-Car E3
  soc: renesas: Add r8a77990 SYSC PM Domain Binding Definitions
  soc: renesas: rcar-sysc: Add support for R-Car E3 power areas
  soc: renesas: rcar-rst: Add support for R-Car E3

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
 drivers/soc/renesas/Kconfig                        |  8 +++++-
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77990-sysc.c                | 33 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                     |  1 +
 drivers/soc/renesas/rcar-sysc.c                    |  3 ++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 drivers/soc/renesas/renesas-soc.c                  |  8 ++++++
 include/dt-bindings/power/r8a77990-sysc.h          | 26 +++++++++++++++++
 10 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r8a77990-sysc.c
 create mode 100644 include/dt-bindings/power/r8a77990-sysc.h

-- 
1.9.1
