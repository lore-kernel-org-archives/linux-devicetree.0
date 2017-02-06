From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V2 0/2] Add support for RK3288 Tinker board
Date: Mon,  6 Feb 2017 10:14:45 +0800
Message-ID: <1486347287-31051-1-git-send-email-eddie.cai@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, eddie.cai@rock-chips.com
List-Id: devicetree@vger.kernel.org

This patch set add support for RK3288 Tinker board. Tinker board is a 
credit card size develop board powered by RK3288.

Eddie Cai (2):
  dt-bindings: add Asus Tinker board
  ARM: dts: rockchip: add dts for RK3288-Tinker board

 Documentation/devicetree/bindings/arm/rockchip.txt |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3288-tinker.dts                | 543 +++++++++++++++++++++
 3 files changed, 547 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-tinker.dts

-- 
2.7.4
