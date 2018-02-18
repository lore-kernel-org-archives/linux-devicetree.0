Return-Path: <SRS0=+B7o=FM=gmail.com=digetx@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/2] Enable Video Decoder on Tegra30
Date: Sun, 18 Feb 2018 22:46:54 +0300
Message-Id: <cover.1518981147.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

VDE on Terga30 is compatible with VDE on Tegra20, hence the 'tegra-vde'
driver works fine on Terga30. Let's add missing DT nodes to expose Video
Decoder Engine on Terga30.

Changelog:

V2:
	1) Appended unit address to the name of VDE pool node to fix
	   DTC warning as per Andreas's Färber suggestion.

	2) Correctly placed IRAM DT node in the address-ascending order.

Dmitry Osipenko (2):
  ARM: dts: tegra30: Add IRAM node
  ARM: dts: tegra30: Add video decoder node

 arch/arm/boot/dts/tegra30.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.16.1
