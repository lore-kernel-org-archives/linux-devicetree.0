From: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH 0/2] Fix espressobin ethernet support on mainline u-boot
Date: Mon, 28 Jan 2019 21:07:26 +0100
Message-ID: <20190128200728.17747-1-repk@triplefau.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
List-Id: devicetree@vger.kernel.org

This patchset fixes ethernet and mv88e6341 switch support on espressobin
board when bootloader does not initialize needed registers.

This patchset should be applied along with pinctrl fixes from [1] which
have been merged in next branch of linux-pinctrl tree.

[1] https://lkml.org/lkml/2018/12/21/507

Remi Pommarel (2):
  arm64: dts: armada-3720-espressobin: Configure RGMII and SMI pins
  arm64: dts: armada-3720-espressobin: Set mv88e6341 cpu port as
    RGMII-ID

 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 7 +++++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi            | 5 +++++
 2 files changed, 12 insertions(+)

-- 
2.20.1
