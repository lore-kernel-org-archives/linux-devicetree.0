From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/3] soc: rockchip: Modify power domain driver for rk3366 SoC
Date: Fri, 14 Jul 2017 15:02:40 +0800
Message-ID: <1500015763-4940-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, tomeu.vizoso@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, wxt@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, wdc@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

support rk3366 SoC power domain setting.

Elaine Zhang (3):
  dt-bindings: power: add RK3366 SoCs header for power-domain
  dt-bindings: add binding for rk3366 power domains
  soc: rockchip: power-domain: add power domain support for rk3366

 .../bindings/soc/rockchip/power_domain.txt         |  3 ++
 drivers/soc/rockchip/pm_domains.c                  | 32 ++++++++++++++++++++++
 include/dt-bindings/power/rk3366-power.h           | 24 ++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/power/rk3366-power.h

-- 
1.9.1
