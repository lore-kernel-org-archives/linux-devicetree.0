From: Alexander Syring <alex@asyring.de>
Subject: [PATCH] ARM: sun7i: dts: enable battery power supply subnode on
 cubietruck
Date: Wed,  5 Jul 2017 10:30:20 +0200
Message-ID: <20170705083020.14865-1-alex@asyring.de>
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
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, maxime.ripard@free-electrons.com, Alexander Syring <alex@asyring.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Cubietruck has an AXP209 PMIC with battery connector.

This enables the battery power supply subnode.

Signed-off-by: Alexander Syring <alex@asyring.de>
---
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index 102903e83bd2..13bbf2361f9c 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -271,6 +271,10 @@
 	status = "okay";
 };
 
+&battery_power_supply {
+	status = "okay";
+};
+
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
-- 
2.11.0
