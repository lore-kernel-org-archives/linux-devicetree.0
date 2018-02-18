Return-Path: <SRS0=+B7o=FM=gmail.com=digetx@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] Enable Video Decoder on Tegra30
Date: Sun, 18 Feb 2018 20:01:44 +0300
Message-Id: <cover.1518973069.git.digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

VDE on Terga30 is compatible with VDE on Tegra20, hence the 'tegra-vde'
driver works fine on Terga30. Let's add missing DT nodes to expose Video
Decoder Engine on Terga30.

Dmitry Osipenko (2):
  ARM: dts: tegra30: Add IRAM node
  ARM: dts: tegra30: Add video decoder node

 arch/arm/boot/dts/tegra30.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.16.1
