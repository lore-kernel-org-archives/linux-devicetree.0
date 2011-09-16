From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 RESEND 2] gpio-vx855: add device tree binding
Date: Fri, 16 Sep 2011 19:12:20 +0100 (BST)
Message-ID: <20110916181220.E12109D401C@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is needed to enable the HDD LED on the OLPC XO-1.5 laptop,
enabled through devicetree and the gpio-leds driver.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio_vx855.txt        |   20 ++++++++++++++++++++
 drivers/gpio/gpio-vx855.c                          |    5 +++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio_vx855.txt

v2: extended the documentation with information about the pin numbering
scheme, which matches that of the driver.

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
index ef5aabd..5b7e9ba 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -31,6 +31,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #define MODULE_NAME "vx855_gpio"
 
@@ -216,6 +217,10 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->ngpio = NR_VX855_GP;
 	c->can_sleep = 0;
 	c->names = vx855gpio_names;
+
+#ifdef CONFIG_OF_GPIO
+	c->of_node = of_find_compatible_node(NULL, NULL, "via,vx855-gpio");
+#endif
 }
 
 /* This platform device is ordinarily registered by the vx855 mfd driver */
-- 
1.7.6
