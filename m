From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] ARM: dts: rockchip: increase vdd_arm voltage for rk3066a-rayeager board
Date: Thu, 14 Jan 2016 20:34:20 +0800
Message-ID: <1452774860-16572-1-git-send-email-andy.yan@rock-chips.com>
References: <1452774780-16493-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452774780-16493-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, naobsd@gmail.com
Cc: robh+dt@kernel.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, pawel.moll@arm.com, mark.rutland@arm.com, inux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

The current vdd_arm voltage is too low, increase it will make
the system more stable.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm/boot/dts/rk3066a-rayeager.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
index 0bf6876..3d4c104 100644
--- a/arch/arm/boot/dts/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
@@ -159,6 +159,14 @@
 
 &cpu0 {
 	cpu0-supply = <&vdd_arm>;
+	operating-points = <
+		/* kHz    uV */
+		1008000 1125000
+		816000  1125000
+		600000  1100000
+		504000  1100000
+		312000  1075000
+	>;
 };
 
 &emac {
-- 
1.9.1
