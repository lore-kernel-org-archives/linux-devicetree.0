Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16045 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfFNHrR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 03:47:17 -0400
From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 0/8] Tegra XHCI controller ELPG support
Date: Fri, 14 Jun 2019 15:46:48 +0800
Message-ID: <20190614074652.21960-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra XHCI controler can be placed in ELPG (Engine Level PowerGate)
state for power saving when all of the connected USB devices are in
suspended state. This patch series includes clk, phy and pmc changes
that are required for properly place controller in ELPG and bring
controller out of ELPG.


JC Kuo (8):
  clk: tegra: Add PLLE HW power sequencer control
  clk: tegra: don't enable PLLE HW sequencer at init
  phy: tegra: xusb: t210: rearrange UPHY init
  phy: tegra: xusb: add sleepwalk and suspend/resume
  soc/tegra: pmc: support T210 USB 2.0 Sleepwalk
  phy: tegra: xusb: t210: support wake and sleepwalk
  arm64: tegra: add Tegra210 XUSB PADCTL irq
  xhci: tegra: enable ELPG for runtime/system PM

 arch/arm64/boot/dts/nvidia/tegra210.dtsi |    3 +-
 drivers/clk/tegra/clk-pll.c              |   12 -
 drivers/clk/tegra/clk-tegra210.c         |   45 +
 drivers/phy/tegra/xusb-tegra210.c        | 1023 +++++++++++++++++-----
 drivers/phy/tegra/xusb.c                 |   80 +-
 drivers/phy/tegra/xusb.h                 |   10 +
 drivers/soc/tegra/pmc.c                  |  462 ++++++++++
 drivers/usb/host/xhci-tegra.c            |  802 ++++++++++++++---
 include/linux/clk/tegra.h                |    2 +
 include/linux/phy/tegra/xusb.h           |   12 +
 include/soc/tegra/pmc.h                  |   13 +
 11 files changed, 2108 insertions(+), 356 deletions(-)

-- 
2.17.1
