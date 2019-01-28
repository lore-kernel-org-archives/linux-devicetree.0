From: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH 2/2] arm64: dts: armada-3720-espressobin: Set mv88e6341 cpu port as RGMII-ID
Date: Mon, 28 Jan 2019 21:07:28 +0100
Message-ID: <20190128200728.17747-3-repk@triplefau.lt>
References: <20190128200728.17747-1-repk@triplefau.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128200728.17747-1-repk@triplefau.lt>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
List-Id: devicetree@vger.kernel.org

The mv88e6341 ethernet switch needs the cpu port control register to be
set with TX and RX internal delay in order to work.

This fixes ethernet support on system booted via a bootloader that
has not already configured this register (e.g. mainline u-boot, or
vendor u-boot compiled without ethernet support).

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
index b60897edc885..86e8a1e3207f 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
@@ -156,6 +156,11 @@
 				reg = <0>;
 				label = "cpu";
 				ethernet = <&eth0>;
+				phy-mode = "rgmii-id";
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			port@1 {
-- 
2.20.1
