From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v6 00/16] clk: exynos4/5: migrate to common clock framework
Date: Mon, 18 Feb 2013 13:51:10 +0530
Message-ID: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com
List-Id: devicetree@vger.kernel.org

Changes since v5:
- Squashed several Exynos4 fixes patch from Tomasz Figa
- Included support for Exynos5250 and Exynos5440, thus converting all
  Exynos4 and Exynos5 platforms to common clock framework.
- Depends on the following patch series.
  - http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg15849.html
  - http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg15852.html

Changes since v4:
- Rebased to linux-3.8-rc1.

Changes since v3:
- Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>

This patch series migrates the Samsung Exynos4/5 SoC clock code to adopt the
common clock framework. The use of Samsung specific clock structures has
been removed and all board support code has been updated. imx-style of
clock registration and lookup has been adopted for device tree based
exynos4/5 platforms.
