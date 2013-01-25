From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/4] 0/4] ARM: dts: add support for hdmi to exynos4412
Date: Fri, 25 Jan 2013 05:39:40 -0500
Message-ID: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

This patch enables hdmi support for Samsung Exynos4412 soc based Origen Board.

This set is base on "for next" branch at
git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git

Rahul Sharma (4):
  ARM: dts: add support for hdmi to exynos4
  ARM: dts: add support for mixer to exynos4
  ARM: dts: add support for hdmi-ddc to exynos4412-origen
  ARM: dts: add support for hdmi-phy to exynos4412

 arch/arm/boot/dts/exynos4.dtsi          | 24 +++++++++++++++++++++++-
 arch/arm/boot/dts/exynos4412-origen.dts | 13 +++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi       | 11 +++++++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c  |  6 ++++++
 4 files changed, 53 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 arch/arm/boot/dts/exynos4.dtsi

-- 
1.8.0
