From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: marvell: Disable AP I2C on Armada-8040-DB
Date: Tue, 21 May 2019 16:37:49 +0200
Message-ID: <20190521143749.488-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Konstantin Porotchkin <kostap@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Konstantin Porotchkin <kostap@marvell.com>

While AP I2C bus was available to users in early revisions of the SoC,
this is not the case anymore since eMMC was connected to the AP. Most
users do not have access to this I2C bus so do not enable it in the
board device tree.

As there are three I2C buses enabled on this board, add an alias to be
sure the two other buses keep their initial numbering.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
[<miquel.raynal@bootlin.com>: Reword commit message, add alias]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 9f4f939ab65f..d6e9c014c2f9 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -27,6 +27,8 @@
 		ethernet1 = &cp0_eth2;
 		ethernet2 = &cp1_eth0;
 		ethernet3 = &cp1_eth1;
+		i2c1 = &cp0_i2c0;
+		i2c2 = &cp1_i2c0;
 	};
 
 	cp0_reg_usb3_0_vbus: cp0-usb3-0-vbus {
@@ -72,11 +74,6 @@
 	};
 };
 
-&i2c0 {
-	status = "okay";
-	clock-frequency = <100000>;
-};
-
 &spi0 {
 	status = "okay";
 
-- 
2.19.1
