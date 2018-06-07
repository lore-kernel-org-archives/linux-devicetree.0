From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/4] clk: rockchip: support clock controller for px30 SoC
Date: Thu,  7 Jun 2018 11:06:22 +0800
Message-ID: <1528340786-462-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Elaine Zhang (4):
  dt-bindings: add bindings for px30 clock controller
  clk: rockchip: add dt-binding header for px30
  clk: rockchip: add support for half divider
  clk: rockchip: add clock controller for px30

 .../bindings/clock/rockchip,px30-cru.txt           |   67 ++
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-half-divider.c            |  235 +++++
 drivers/clk/rockchip/clk-px30.c                    | 1080 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   10 +
 drivers/clk/rockchip/clk.h                         |   86 +-
 include/dt-bindings/clock/px30-cru.h               |  402 ++++++++
 7 files changed, 1881 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-half-divider.c
 create mode 100644 drivers/clk/rockchip/clk-px30.c
 create mode 100644 include/dt-bindings/clock/px30-cru.h

-- 
1.9.1
