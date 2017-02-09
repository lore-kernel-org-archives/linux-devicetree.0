From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH] ARM: dts: armada-385-linksys: fix DSA compatible property
Date: Thu,  9 Feb 2017 16:27:02 +0100
Message-ID: <20170209152702.23036-1-ralph.sennhauser@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,
 ..." <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The switch to the new DSA binding used "marvell,mv88e6095" for the
compatible property which doesn't exist, use "marvell,mv88e6085"
instead.

Fixes: 455b82f03f52 ("ARM: dts: armada-385-linksys: Utilize new DSA binding")
Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 20d5e8b..df47bf1 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -107,7 +107,7 @@
 				status = "okay";
 
 				switch@0 {
-					compatible = "marvell,mv88e6095";
+					compatible = "marvell,mv88e6085";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
-- 
2.10.2
