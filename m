From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 0/6] phy: rockchip-typec: fix boards that does not report cable-state.
Date: Thu,  1 Mar 2018 10:24:14 +0100
Message-ID: <20180301092420.1191-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, heiko@sntech.de
Cc: groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Shawn Lin <shawn.lin@rock-chips.com>, Rask Ingemann Lambertsen <rask@formelder.dk>, Catalin Marinas <catalin.marinas@arm.com>, Pierre-Hugues Husson <phh@phh.me>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jacob Chen <jacob-chen@iotwrt.com>, Kever Yang <kever.yang@rock-chips.com>, linux-rockchip@lists.infradead.org, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@g>
List-Id: devicetree@vger.kernel.org

Hi,

Commit c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port
support for rk3399") introduced a regression on some rk3399 boards,
and break USB. While some boards have support to report cable-state via
extcon interface, other boards does not support. This patch series
tries to fix this.

First and second patch makes extcon optional, the following patches
enables the typec phyter for others rk3399 boards. It has been tested on
Samsung Chromebook Plus and Sapphire but not on the other boards, so I'll
appreciate if someone can test it.

Best regards,
 Enric

Enric Balletbo i Serra (6):
  phy: rockchip-typec: fall back to working in host-mode if extcon is
    missing.
  dt-bindings: phy-rockchip-typec: move extcon property to be optional.
  arm64: dts: rockchip: enable typec-phy for rk3399-sapphire.
  arm64: dts: rockchip: enable typec-phy for rk3399-firefly.
  arm64: dts: rockchip: enable typec-phy1 for rk3399-puma.
  arm64: dts: rockchip: enable typec-phy0 for rk3399-puma-haikou.

 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 2 ++
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts              | 8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts          | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi            | 8 ++++++++
 drivers/phy/rockchip/phy-rockchip-typec.c                    | 9 ++++++---
 6 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.16.1
