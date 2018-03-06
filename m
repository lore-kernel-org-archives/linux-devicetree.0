Return-Path: <SRS0=MR/7=F4=linaro.org=shawn.guo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add HiSilicon Hi3798CV200 specific dw_mmc extension driver
Date: Tue,  6 Mar 2018 14:58:49 +0800
Message-Id: <1520319531-24661-1-git-send-email-shawn.guo@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

It adds the dt-bindings and driver support for HiSilicon Hi3798CV200
specific dw_mmc extension.

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

v1: https://lkml.org/lkml/2017/10/17/1213

tianshuliang (2):
  dt-bindings: mmc: add bindings for hi3798cv200-dw-mshc
  mmc: dw_mmc: add support for hi3798cv200 specific extensions of
    dw-mshc

 .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 +++++
 drivers/mmc/host/Kconfig                           |   9 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c              | 197 +++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
 create mode 100644 drivers/mmc/host/dw_mmc-hi3798cv200.c

-- 
1.9.1
