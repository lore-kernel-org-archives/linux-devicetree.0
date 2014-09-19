From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 6/8] ARM: mvebu: armada-xp: Add RGMII pinctrl to Lenovo ix4-300d
Date: Fri, 19 Sep 2014 22:14:42 +0200
Message-ID: <1411157684-6991-7-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Lenovo ix4-300d has two ethernet PHYs connected via RGMII. Add the
corresponding pinctrl settings.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Benoit Masson <yahoo@perenite.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
index 492cd8e3f424..c5ee6c00766c 100644
--- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
+++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
@@ -66,12 +66,16 @@
 			};
 
 			ethernet@70000 {
+				pinctrl-0 = <&pmx_ge0_rgmii>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy0>;
 				phy-mode = "rgmii-id";
 			};
 
 			ethernet@74000 {
+				pinctrl-0 = <&pmx_ge1_rgmii>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy1>;
 				phy-mode = "rgmii-id";
-- 
2.0.0
