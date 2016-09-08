From: Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: [PATCH v2 0/2] Add power domain support for eMMC node on rk3399
Date: Thu,  8 Sep 2016 14:49:03 +0800
Message-ID: <20160908064905.18080-1-xzy.xu@rock-chips.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: heiko@sntech.de, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, shawn.lin@rock-chips.com, dianders@chromium.org, Ziyuan Xu <xzy.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This series add power domain for eMMC node which will be controlled by
genpd to make sure it's available in probing state, and will be gate
once suspend/resume.

Changes in v2:
- fix a typo
- add an example code for power-domain
- add Shawn's review-tag and Doug's review-tag

Ziyuan Xu (2):
  Documentation: mmc: sdhci-of-arasan: add description of power domain
  arm64: dts: rockchip: add eMMC's power domain support for rk3399

 Documentation/devicetree/bindings/mmc/arasan,sdhci.txt |  7 ++++++-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi               | 11 +++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.9.2


