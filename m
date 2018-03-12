Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Date: Mon, 12 Mar 2018 17:10:29 +0530
Message-ID: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

1. ADD AHCI support for Tegra210
2. Extend the Tegra AHCI controller device tree binding with Tegra210
3. Update initialization sequence
4. Initialize regulators based on chip
5. Disable DevSlp
6. Disable DIPM
---

Preetham Ramchandra (9):
  dt-bindings: Tegra210: add binding documentation
  arm64: tegra: Add SATA node for Tegra210
  arm64: tegra: Enable AHCI on Jetson TX1
  ata: ahci_tegra: Update initialization sequence
  ata: ahci_tegra: initialize regulators from soc struct
  ata: ahci_tegra: disable devslp for Tegra124
  ata: ahci_tegra: disable DIPM
  ata: ahci_tegra: Add AHCI support for Tegra210
  ata: change Tegra124 to Tegra

 .../bindings/ata/nvidia,tegra124-ahci.txt          |  36 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  16 +
 drivers/ata/Kconfig                                |   4 +-
 drivers/ata/ahci_tegra.c                           | 359 ++++++++++++++++-----
 5 files changed, 330 insertions(+), 90 deletions(-)

-- 
2.7.4
