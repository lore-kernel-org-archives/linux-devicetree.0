Return-Path: <SRS0=iiFe=F6=linaro.org=shawn.guo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add HiSilicon Hi3798CV200 specific dw_mmc extension driver
Date: Thu,  8 Mar 2018 09:01:32 +0800
Message-Id: <1520470894-9114-1-git-send-email-shawn.guo@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

It adds the dt-bindings and driver support for HiSilicon Hi3798CV200
specific dw_mmc extension.

Changes for v3:
 - Update copyright to year 2018.
 - Move DW-MMC register defines into dw_mmc.h.
 - Include bit HLE into ALL_INT_CLR define.
 - Add a custom .remove hook to disable drive_clk and sample_clk.
 - Collect Rob's Reviewed-by tag on bindings.

Changes for v2:
 - Rebase to v4.16-rc.
 - Use SPDX tag for license.
 - Make ciu-sample and ciu-drive clock be required.
 - Drop deprecated num-slots property from bindings example.
 - Do not show board vs. SoC portion split in bindings example.
 - Use .init hook instead of .parse_dt for initialization.
 - Improve MODULE_DESCRIPTION to make it clear this is Hi3798CV200
   specific extension.
 - Various style improvements and code cleanups.

tianshuliang (2):
  dt-bindings: mmc: add bindings for hi3798cv200-dw-mshc
  mmc: dw_mmc: add support for hi3798cv200 specific extensions of
    dw-mshc

 .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 ++++
 drivers/mmc/host/Kconfig                           |   9 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c              | 202 +++++++++++++++++++++
 drivers/mmc/host/dw_mmc.h                          |   6 +
 5 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
 create mode 100644 drivers/mmc/host/dw_mmc-hi3798cv200.c

-- 
1.9.1
