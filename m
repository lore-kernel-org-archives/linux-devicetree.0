From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/2] ARM: dts: add pmu syscon handle to exynos hdmi nodes
Date: Tue, 20 May 2014 19:08:47 +0530
Message-ID: <1400593129-21170-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add PMU syscon handle to HDMI dt node for controlling PHY
Enable/Disable bit.

Patch is dependent for following patch for approval on DT
Bindings:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31106.html

It is based on Kukjin's "for-next" branch.

Rahul Sharma (2):
  ARM: dts: add pmu syscon handle to exynos5250 hdmi
  ARM: dts: add pmu syscon handle to exynos5420 hdmi

 arch/arm/boot/dts/exynos5250.dtsi |    1 +
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 2 files changed, 2 insertions(+)

-- 
1.7.9.5
