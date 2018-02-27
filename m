From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 1/2] ARM: dts: armada388-clearfog: increase speed of i2c0 to
 400kHz
Date: Tue, 27 Feb 2018 16:01:57 +0000
Message-ID: <E1eqhhV-0004ku-Nd@rmk-PC.armlinux.org.uk>
References: <20180227160135.GU9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180227160135.GU9418@n2100.armlinux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

All the devices on I2C0 support fast mode, so increase the bus speed
to match.  The Armada 388 is known to have a timing issue when in
standard mode, which we believe causes the ficticious device at 0x64
to appear.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index 68acfc968706..0e3b1f140e6d 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -143,8 +143,7 @@
 };
 
 &i2c0 {
-	/* Is there anything on this? */
-	clock-frequency = <100000>;
+	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -239,13 +238,11 @@
 		};
 	};
 
-	/* The MCP3021 is 100kHz clock only */
+	/* The MCP3021 supports standard and fast modes */
 	mikrobus_adc: mcp3021@4c {
 		compatible = "microchip,mcp3021";
 		reg = <0x4c>;
 	};
-
-	/* Also something at 0x64 */
 };
 
 &i2c1 {
-- 
2.7.4
