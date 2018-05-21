From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v5 4/4] gpiolib: discourage gpiochip_add_pin[group]_range for
 DT pinctrls
Date: Mon, 21 May 2018 22:57:39 +0200
Message-ID: <2969992a1005d7e7f4ea23d4c684d2f10d4a0aca.1526935804.git.chunkeey@gmail.com>
References: <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
In-Reply-To: <0ae3376606a89bcdf3fe753a5c967f7103699e09.1526935804.git.chunkeey@gmail.com>
References: <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
 <270904bcbf03a6b6ac3150f4a7daa15aa7e97586.1526935804.git.chunkeey@gmail.com>
 <0ae3376606a89bcdf3fe753a5c967f7103699e09.1526935804.git.chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds the stern warning to the kerneldoc text of both
gpiochip_add_pin[group]_range() functions in hope of detering
developers from ever using them in their DeviceTree-supported
pinctrl drivers in the future.

For anyone affected: Please refer to Section 2.1 of
Documentation/devicetree/bindings/gpio/gpio.txt on how to
bind pinctrl and gpio drivers via the "gpio-ranges" property.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

As a (final?) follow-up to Stephen's request of adding a warning
to notify devs and users alike about any potentially broken drivers:

of_gpiochip_add_pin_range() - which parses the gpio-ranges property -
calls both gpiochip_add_pin(group)_range functions. So adding a
warning/debug message into the code will not really work (unless
the DT-check will also take the call-trace into account... which is
possible, but at this point it would make more sense to just
refactor the code).
---
 drivers/gpio/gpiolib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1171db66c30..387bf0677ca8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2117,6 +2117,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_config);
  * @pctldev: the pin controller to map to
  * @gpio_offset: the start offset in the current gpio_chip number space
  * @pin_group: name of the pin group inside the pin controller
+ *
+ * Calling this function directly from a DeviceTree-supported
+ * pinctrl driver is DEPRECATED. Please see Section 2.1 of
+ * Documentation/devicetree/bindings/gpio/gpio.txt on how to
+ * bind pinctrl and gpio drivers via the "gpio-ranges" property.
  */
 int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 			struct pinctrl_dev *pctldev,
@@ -2170,6 +2175,11 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
  *
  * Returns:
  * 0 on success, or a negative error-code on failure.
+ *
+ * Calling this function directly from a DeviceTree-supported
+ * pinctrl driver is DEPRECATED. Please see Section 2.1 of
+ * Documentation/devicetree/bindings/gpio/gpio.txt on how to
+ * bind pinctrl and gpio drivers via the "gpio-ranges" property.
  */
 int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
-- 
2.17.0
