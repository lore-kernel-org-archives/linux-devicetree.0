From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] arm64: dts: uniphier: switch to PSCI, DT-side support for cpufreq driver
Date: Sun, 16 Oct 2016 23:59:15 +0900
Message-ID: <1476629958-25368-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

The UniPhier clock driver was merged, and now ARM Trusted Firmware
poring was finished.

Now, I can upstream more features with this platform.



Masahiro Yamada (3):
  arm64: dts: uniphier: switch over to PSCI enable method
  arm64: dts: uniphier: add CPU clock and OPP table for LD11 SoC
  arm64: dts: uniphier: add CPU clocks and OPP tables for LD20 SoC

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi |  51 +++++++++--
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 103 +++++++++++++++++++++--
 2 files changed, 140 insertions(+), 14 deletions(-)

-- 
1.9.1
