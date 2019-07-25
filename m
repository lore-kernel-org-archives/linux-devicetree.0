From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 0/5] Add veyron tiger and fievel boards
Date: Thu, 25 Jul 2019 09:26:37 -0700
Message-ID: <20190725162642.250709-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This series adds device tree files for the veyron tiger and
fievel boards. It also reorganizes display and backlight
settings for veyron devices, to avoid duplication.

Previous versions of the series didn't have a cover letter,
v2 can be found at
https://patchwork.kernel.org/project/linux-rockchip/list/?series=144987

Matthias Kaehlcke (5):
  ARM: dts: rockchip: move rk3288-veryon display settings into a
    separate file
  ARM: dts: rockchip: consolidate veyron panel and backlight settings
  dt-bindings: ARM: dts: rockchip: Add bindings for
    rk3288-veyron-{fievel,tiger}
  ARM: dts: rockchip: add veyron-fievel board
  ARM: dts: rockchip: add veyron-tiger board

 .../devicetree/bindings/arm/rockchip.yaml     |  30 ++
 arch/arm/boot/dts/Makefile                    |   2 +
 .../boot/dts/rk3288-veyron-chromebook.dtsi    | 115 +------
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi      | 173 ++++++++++
 arch/arm/boot/dts/rk3288-veyron-fievel.dts    | 299 ++++++++++++++++++
 arch/arm/boot/dts/rk3288-veyron-jaq.dts       |  55 ----
 arch/arm/boot/dts/rk3288-veyron-jerry.dts     |  58 ----
 arch/arm/boot/dts/rk3288-veyron-minnie.dts    |  52 ---
 arch/arm/boot/dts/rk3288-veyron-pinky.dts     |  17 +
 arch/arm/boot/dts/rk3288-veyron-speedy.dts    |  58 ----
 arch/arm/boot/dts/rk3288-veyron-tiger.dts     | 125 ++++++++
 11 files changed, 647 insertions(+), 337 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3288-veyron-edp.dtsi
 create mode 100644 arch/arm/boot/dts/rk3288-veyron-fievel.dts
 create mode 100644 arch/arm/boot/dts/rk3288-veyron-tiger.dts

-- 
2.22.0.709.g102302147b-goog
