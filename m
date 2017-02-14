From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V3 0/2] Add support for RK3288 Tinker board
Date: Tue, 14 Feb 2017 18:07:29 +0800
Message-ID: <1487066851-25142-1-git-send-email-eddie.cai.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Eddie Cai <eddie.cai.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set add support for RK3288 Tinker board. Tinker board is a
credit card size develop board powered by RK3288.

Eddie Cai (2):
  dt-bindings: add Asus Tinker board
  ARM: dts: rockchip: add dts for RK3288-Tinker board

 Documentation/devicetree/bindings/arm/rockchip.txt |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3288-tinker.dts                | 536 +++++++++++++++++++++
 3 files changed, 540 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-tinker.dts

-- 
2.7.4
