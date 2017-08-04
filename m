From: Finley Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: add cpu operating points and efuse node for RK3328 SoC
Date: Fri,  4 Aug 2017 11:33:36 +0800
Message-ID: <1501817618-65504-1-git-send-email-finley.xiao@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jay.xu@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com, cl@rock-chips.com, Finley Xiao <finley.xiao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add cpu operating points and an efuse node in the device tree for rk3228 SoC

Finley Xiao (2):
  arm64: dts: rockchip: Add cpu operating points for RK3328 SoC
  arm64: dts: rockchip: Add efuse device node for RK3328 SoC

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

-- 
2.7.4
