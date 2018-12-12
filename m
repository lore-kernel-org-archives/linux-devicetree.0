Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10817 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbeLLTbe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Dec 2018 14:31:34 -0500
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH 0/4] add Tegra210 BPMP driver
Date: Wed, 12 Dec 2018 21:31:24 +0200
Message-ID: <1544643088-17678-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: treding@nvidia.com, sivaramn@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This series adds a driver for Tegra210 BPMP firmware. The BPMP is a
specific processor in Tegra210 chip, which runs firmware for assisting
in entering deep low power states (suspend to ram), and offloading
DRAM memory clock scaling on some platforms.

The series consist of first refactoring the existing BPMP driver by
first renaming the terminology used for communication, then splitting
out the Tegra186 chip specific parts, and finally adding the needed
functionality for Tegra210.

Timo Alho (4):
  firmware: tegra: reword messaging terminology
  firmware: tegra: refactor bpmp driver
  firmware: tegra: add bpmp driver for Tegra210
  dt-bindings: firmware: Add bindings for Tegra210 BPMP

 .../bindings/firmware/nvidia,tegra210-bpmp.txt     |  36 +++
 drivers/firmware/tegra/Makefile                    |   2 +
 drivers/firmware/tegra/bpmp-private.h              |  26 ++
 drivers/firmware/tegra/bpmp-t186.c                 | 303 ++++++++++++++++++
 drivers/firmware/tegra/bpmp-t210.c                 | 241 ++++++++++++++
 drivers/firmware/tegra/bpmp.c                      | 354 ++++++++-------------
 include/soc/tegra/bpmp.h                           |  13 +-
 7 files changed, 743 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
 create mode 100644 drivers/firmware/tegra/bpmp-private.h
 create mode 100644 drivers/firmware/tegra/bpmp-t186.c
 create mode 100644 drivers/firmware/tegra/bpmp-t210.c

-- 
2.7.4
