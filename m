Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] soc: renesas: r8a77990-sysc: Add support for R-Car E3
Date: Tue, 15 May 2018 21:07:37 +0900
Message-Id: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the renesas-devel-20180515-v4.17-rc5 tag of
renesas.git.

Changes from v1:
 - Rebase the latest kernel.
 - Modify r8a77990_areas[] as the specification in patch 1.
 - Use // instead of /* */ at the SPDX-License-Identifier line in patch 1.
 - Add workaround patch for 3DG-{A,B} of R-Car E3 ES1.0 as patch 2.

Takeshi Kihara (1):
  soc: renesas: rcar-sysc: Add support for R-Car E3 power areas

Yoshihiro Shimoda (1):
  soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 ++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77990-sysc.c                | 68 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 +
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 6 files changed, 79 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a77990-sysc.c

-- 
1.9.1
