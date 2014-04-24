From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Add sound card node Snow/Peach-pit board
Date: Thu, 24 Apr 2014 11:46:57 +0530
Message-ID: <1398320219-23362-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Related sound card driver has been posted here.
1. [PATCH V2] ASoC: SAMSUNG: Add sound card driver for Snow board
https://lkml.org/lkml/2014/4/23/184

Patch 2 is dependent on Arun's following patch.
2. [PATCH v2] ARM: dts: Add peach-pit board support
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg29189.html

Tushar Behera (2):
  ARM: dts: Add sound node for Snow board
  ARM: dts: Add sound node for Peach-pit board

 arch/arm/boot/dts/exynos5250-snow.dts      |   32 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   31 +++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

-- 
1.7.9.5
