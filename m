From: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH net-next] phylib: rename reset-(post-)delay-us to reset-(de)assert-us
Date: Fri, 22 Dec 2017 11:08:09 +0100
Message-ID: <20171222100809.18826-1-dev@g0hl1n.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, frowand.list@gmail.com
Cc: davem@davemloft.net, richard.leitner@skidata.com, geert+renesas@glider.be, lukma@denx.de, sergei.shtylyov@cogentembedded.com, martin.blumenstingl@googlemail.com, david.wu@rock-chips.com, baruch@tkos.co.il, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Leitner <richard.leitner@skidata.com>

As suggested by Rob Herring [1] rename the previously introduced
reset-{,post-}delay-us bindings to the clearer reset-{,de}assert-us

[1] https://patchwork.kernel.org/patch/10104905/

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 Documentation/devicetree/bindings/net/phy.txt | 8 ++++----
 drivers/net/phy/mdio_device.c                 | 2 +-
 drivers/of/of_mdio.c                          | 7 ++++---
 include/linux/mdio.h                          | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 72860ce7f610..d2169a56f5e3 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -55,10 +55,10 @@ Optional Properties:
 
 - reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
 
-- reset-delay-us: Delay after the reset was asserted in microseconds.
+- reset-assert-us: Delay after the reset was asserted in microseconds.
   If this property is missing the delay will be skipped.
 
-- reset-post-delay-us: Delay after the reset was deasserted in microseconds.
+- reset-deassert-us: Delay after the reset was deasserted in microseconds.
   If this property is missing the delay will be skipped.
 
 Example:
@@ -70,6 +70,6 @@ ethernet-phy@0 {
 	reg = <0>;
 
 	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
-	reset-delay-us = <1000>;
-	reset-post-delay-us = <2000>;
+	reset-assert-us = <1000>;
+	reset-deassert-us = <2000>;
 };
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index 843c1dde93e4..c924700cf37b 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -126,7 +126,7 @@ void mdio_device_reset(struct mdio_device *mdiodev, int value)
 
 	gpiod_set_value(mdiodev->reset, value);
 
-	d = value ? mdiodev->reset_delay : mdiodev->reset_post_delay;
+	d = value ? mdiodev->reset_assert_delay : mdiodev->reset_deassert_delay;
 	if (d)
 		usleep_range(d, d + max_t(unsigned int, d / 10, 100));
 }
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index f4c73292b304..1b9ef35cf0d9 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -77,9 +77,10 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 	if (of_property_read_bool(child, "broken-turn-around"))
 		mdio->phy_ignore_ta_mask |= 1 << addr;
 
-	of_property_read_u32(child, "reset-delay-us", &phy->mdio.reset_delay);
-	of_property_read_u32(child, "reset-post-delay-us",
-			     &phy->mdio.reset_post_delay);
+	of_property_read_u32(child, "reset-assert-us",
+			     &phy->mdio.reset_assert_delay);
+	of_property_read_u32(child, "reset-deassert-us",
+			     &phy->mdio.reset_deassert_delay);
 
 	/* Associate the OF node with the device structure so it
 	 * can be looked up later */
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index e37c21d8eb19..268aad47ecd3 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -41,8 +41,8 @@ struct mdio_device {
 	int addr;
 	int flags;
 	struct gpio_desc *reset;
-	unsigned int reset_delay;
-	unsigned int reset_post_delay;
+	unsigned int reset_assert_delay;
+	unsigned int reset_deassert_delay;
 };
 #define to_mdio_device(d) container_of(d, struct mdio_device, dev)
 
-- 
2.11.0
