From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 0/6] arm64: dts: rockchip: ROC-PC fixes
Date: Thu, 19 Sep 2019 10:58:16 +0530
Message-ID: <20190919052822.10403-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

This series is trying to fix the Linux boot and other
regulators stuff for ROC-RK3399-PC board.

patch 1: attach pinctrl to pwm2 pin

patch 2-4: libretech naming conventions

patch 5-6: regulator renaming, input rails fixes

Any inputs?
Jagan.

Jagan Teki (6):
  arm64: dts: rockchip: Fix rk3399-roc-pc pwm2 pin
  dt-bindings: arm: rockchip: Use libretech for roc-pc binding
  arm64: dts: rockchip: Use libretech model, compatible for ROC-PC
  arm64: dts: rockchip: Rename roc-pc with libretech notation
  arm64: dts: rockchip: Rename vcc12v_sys into dc_12v for roc-rk3399-pc
  arm64: dts: rockchip: Fix roc-rk3399-pc regulator input rails

 .../devicetree/bindings/arm/rockchip.yaml     | 11 +++---
 arch/arm64/boot/dts/rockchip/Makefile         |  2 +-
 ...dts => rk3399-libretech-roc-rk3399-pc.dts} | 38 ++++++++++---------
 3 files changed, 27 insertions(+), 24 deletions(-)
 rename arch/arm64/boot/dts/rockchip/{rk3399-roc-pc.dts => rk3399-libretech-roc-rk3399-pc.dts} (95%)

-- 
2.18.0.321.gffc6fa0e3
