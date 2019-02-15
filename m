From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATVH v2 0/4] arm64: dts: allwinner: h6: Enable CPU
Date: Fri, 15 Feb 2019 08:49:33 -0500
Message-ID: <20190215134937.10259-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add the cpufreq support of h6, source of information is as follows.

h6 cpu opp info:
https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/arch/arm64/boot/dts/sunxi/sun50iw6p1.dtsi

axp805 spec:
http://linux-sunxi.org/images/b/bc/AXP805_Datasheet_V1.0_en.pdf

Yangtao Li (4):
  arm64: dts: allwinner: h6: orangepi: Add CPU supply regulator
  arm64: dts: allwinner: h6: pine: Add CPU supply regulator
  arm64: dts: allwinner: h6: Add clock to CPU cores
  arm64: dts: allwinner: h6: Add CPU Operating Performance Points table

 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  8 ++-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  8 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 63 +++++++++++++++++++
 3 files changed, 75 insertions(+), 4 deletions(-)

-- 
2.17.0
