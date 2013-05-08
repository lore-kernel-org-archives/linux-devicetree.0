From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 0/3] Add DP related DT and Display-timing Node to exynos5250 based Arndale Board
Date: Wed,  8 May 2013 11:31:31 +0530
Message-ID: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for DP on Exynos5250 based Arndale Board

Is based on branch "for-next"
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Vikas Sajjan (3):
  ARM: dts: Add DT node for DP controller for Arndale Board
  ARM: dts: Add clock provider information for DP controller in
    Exynos5250 SoC
  ARM: dts: Add display timing node to exynos5250-arndale.dts

 arch/arm/boot/dts/exynos5250-arndale.dts |   26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi        |    2 ++
 2 files changed, 28 insertions(+)

-- 
1.7.9.5
