From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH 0/3] Enable thermal management on MSM8916
Date: Tue,  6 Mar 2018 18:35:00 +0530
Message-ID: <cover.1520340931.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Alex Elder <elder@linaro.org>, Andy Gross <andy.gross@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Timur Tabi <timur@codeaurora.org>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT entries to create cooling devices on MSM8916, enable the thermal
sensor on the platform and turn on other cpufreq governors to make it easy
for developers.

This patchset requires
http://patchwork.kernel.org/bundle/amitkucheria/8016-cpufreq-dts/ to be
applied first to enable thermal functionality by cpu frequency throttling.

Amit Kucheria (2):
  arm64: defconfig: enable thermal sensor on QCOM platforms
  arm64: defconfig: enable more cpufreq governors

Rajendra Nayak (1):
  arm64: dts: msm8916: Add cpu cooling maps

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 31 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig          | 10 ++++++++++
 2 files changed, 41 insertions(+)

-- 
2.7.4
