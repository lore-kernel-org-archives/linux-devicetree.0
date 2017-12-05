From: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH net-next v3 1/4] phylib: Add device reset delay support
Date: Tue,  5 Dec 2017 14:25:57 +0100
Message-ID: <20171205132600.13796-2-dev@g0hl1n.net>
References: <20171205132600.13796-1-dev@g0hl1n.net>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171205132600.13796-1-dev@g0hl1n.net>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, andrew@lunn.ch, f.fainelli@gmail.com, frowand.list@gmail.com
Cc: davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

From: Richard Leitner <richard.leitner@skidata.com>

Some PHYs need a minimum time after the reset gpio was asserted and/or
deasserted. To ensure we meet these timing requirements add two new
optional devicetree parameters for the phy: reset-delay-us and
reset-post-delay-us.

This patch depends on the "phylib: Add device reset GPIO support" patch
submitted by Geert Uytterhoeven/Sergei Shtylyov, see:
	https://patchwork.kernel.org/patch/10090149/

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 Documentation/devicetree/bindings/net/phy.txt | 10 ++++++++++
 drivers/net/phy/mdio_device.c                 | 13 +++++++++++--
 drivers/of/of_mdio.c                          |  8 ++++++++
 include/linux/mdio.h                          |  2 ++
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index c05479f5ac7c..72860ce7f610 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -55,6 +55,12 @@ Optional Properties:
 
 - reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
 
+- reset-delay-us: Delay after the reset was asserted in microseconds.
+  If this property is missing the delay will be skipped.
+
+- reset-post-delay-us: Delay after the reset was deasserted in microseconds.
+  If this property is missing the delay will be skipped.
+
 Example:
 
 ethernet-phy@0 {
@@ -62,4 +68,8 @@ ethernet-phy@0 {
 	interrupt-parent = <&PIC>;
 	interrupts = <35 IRQ_TYPE_EDGE_RISING>;
 	reg = <0>;
+
+	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <1000>;
+	reset-post-delay-us = <2000>;
 };
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 75d97dd9fb28..ca3ff43f8ee8 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/unistd.h>
+#include <linux/delay.h>
 
 void mdio_device_free(struct mdio_device *mdiodev)
 {
@@ -118,8 +119,16 @@ EXPORT_SYMBOL(mdio_device_remove);
 
 void mdio_device_reset(struct mdio_device *mdiodev, int value)
 {
-	if (mdiodev->reset)
-		gpiod_set_value(mdiodev->reset, value);
+	if (!mdiodev->reset)
+		return;
+
+	gpiod_set_value(mdiodev->reset, value);
+
+	if (value && mdiodev->reset_delay)
+		usleep_range(mdiodev->reset_delay, mdiodev->reset_delay + 100);
+	else if (!value && mdiodev->reset_post_delay)
+		usleep_range(mdiodev->reset_post_delay,
+			     mdiodev->reset_post_delay + 100);
 }
 EXPORT_SYMBOL(mdio_device_reset);
 
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 98258583abb0..fb56486dfaa0 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -77,6 +77,14 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 	if (of_property_read_bool(child, "broken-turn-around"))
 		mdio->phy_ignore_ta_mask |= 1 << addr;
 
+	if (of_property_read_u32(child, "reset-delay-us",
+				 &phy->mdio.reset_delay))
+		phy->mdio.reset_delay = 0;
+
+	if (of_property_read_u32(child, "reset-post-delay-us",
+				 &phy->mdio.reset_post_delay))
+		phy->mdio.reset_post_delay = 0;
+
 	/* Associate the OF node with the device structure so it
 	 * can be looked up later */
 	of_node_get(child);
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 92d4e55ffe67..e37c21d8eb19 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -41,6 +41,8 @@ struct mdio_device {
 	int addr;
 	int flags;
 	struct gpio_desc *reset;
+	unsigned int reset_delay;
+	unsigned int reset_post_delay;
 };
 #define to_mdio_device(d) container_of(d, struct mdio_device, dev)
 
-- 
2.11.0
