Return-Path: <SRS0=aeJ0=UT=nvidia.com=jonathanh@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] arm64: tegra: A few device-tree fixes
Date: Thu, 20 Jun 2019 09:16:59 +0100
Message-ID: <20190620081702.17209-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Here are a few device-tree fixes for Tegra210 GPU regulator and AGIC.

Jon Hunter (3):
  arm64: tegra: Fix AGIC register range
  arm64: tegra: Update Jetson TX1 GPU regulator timings
  arm64: tegra: Fix Jetson Nano GPU regulator

 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  3 ++-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 21 +++++++++++--------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.17.1
