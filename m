From: "jianqun.xu" <jay.xu@rock-chips.com>
Subject: [PATCH v3 0/4] add core dtsi file for rk3399
Date: Thu, 18 Feb 2016 19:16:29 +0800
Message-ID: <1455794193-4497-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jwerner@chromium.org, broonie@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk
Cc: huangtao@rock-chips.com, jay.xu@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

There is the new SoCs from Rockchip which named rk3399, the
patches are added to support them.

Xing Zheng (2):
  clk: rockchip: add dt-binding header for rk3399
  dt-bindings: add documentation of rk3399 clock controller

Xu Jianqun (2):
  spi: rockchip: add bindings for rk3399 spi
  ARM64: dts: rockchip: add core dtsi file for rk3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |  82 ++
 .../devicetree/bindings/spi/spi-rockchip.txt       |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 949 +++++++++++++++++++++
 drivers/spi/spi-rockchip.c                         |   1 +
 include/dt-bindings/clock/rk3399-cru.h             | 609 +++++++++++++
 5 files changed, 1642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h
