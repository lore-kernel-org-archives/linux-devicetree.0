From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH 3/3] gpio-vx855: Add device tree binding
Date: Wed, 21 Sep 2011 13:02:14 +0100 (BST)
Message-ID: <20110921120214.DFDC79D401E@zog.reactivated.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, sameo@linux.intel.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

This is needed to enable the HDD LED on the OLPC XO-1.5 laptop,
enabled through devicetree and the gpio-leds driver.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 .../devicetree/bindings/gpio/gpio_vx855.txt        |   20 ++++++++++++++++++++
 drivers/gpio/gpio-vx855.c                          |    9 +++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio_vx855.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio_vx855.txt b/Documentation/devicetree/bindings/gpio/gpio_vx855.txt
new file mode 100644
index 0000000..17285a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio_vx855.txt
@@ -0,0 +1,20 @@
+VIA VX855 GPIO controller
+
+Required properties:
+- compatible : "via,vx855-gpio"
+- #gpio-cells : Should be two. The first cell is the pin number and the
+  second cell is used to specify optional parameters:
+  - bit 0 specifies polarity (0 for normal, 1 for inverted)
+- gpio-controller : Marks the device node as a GPIO controller.
+
+As VIA differentiates between GPI, GPO and GPIO on its 42 available pins,
+with each pin type restarting numbering at 0, the following numbering scheme
+is used in the device tree for the pin number:
+
+PIN NO		VIA NAME
+0..13		GPI 0..13
+14..26		GPO 0..12
+27..41		GPIO 0..14
+
+For example, GPIO 11 (VIA name) is referred to with pin number 38 in the
+device tree.
diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index ef5aabd..2c300c9 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -201,7 +201,8 @@ static const char *vx855gpio_names[NR_VX855_GP] = {
 	"VX855_GPIO12", "VX855_GPIO13", "VX855_GPIO14"
 };
 
-static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
+static void vx855gpio_gpio_setup(struct vx855_gpio *vg,
+				 struct platform_device *pdev)
 {
 	struct gpio_chip *c = &vg->gpio;
 
@@ -216,6 +217,10 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->ngpio = NR_VX855_GP;
 	c->can_sleep = 0;
 	c->names = vx855gpio_names;
+
+#ifdef CONFIG_OF_GPIO
+	c->of_node = pdev->dev.of_node;
+#endif
 }
 
 /* This platform device is ordinarily registered by the vx855 mfd driver */
@@ -264,7 +269,7 @@ static __devinit int vx855gpio_probe(struct platform_device *pdev)
 	else
 		vg->gpo_reserved = true;
 
-	vx855gpio_gpio_setup(vg);
+	vx855gpio_gpio_setup(vg, pdev);
 
 	ret = gpiochip_add(&vg->gpio);
 	if (ret) {
-- 
1.7.6.2
