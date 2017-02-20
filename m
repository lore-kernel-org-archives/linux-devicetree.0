From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Mon, 20 Feb 2017 18:13:02 +0100
Message-ID: <1487610788-6939-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add combined gpio and pin controller driver for Renesas RZ/A1
r7s72100 SoC.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 drivers/pinctrl/Kconfig        |   10 +
 drivers/pinctrl/Makefile       |    1 +
 drivers/pinctrl/pinctrl-rza1.c | 1026 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1037 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-rza1.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8f8c2af..61310ac 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -163,6 +163,16 @@ config PINCTRL_ROCKCHIP
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
 
+config PINCTRL_RZA1
+	bool "Renesas r7s72100 RZ/A1 gpio and pinctrl driver"
+	depends on OF
+	depends on ARCH_R7S72100 || COMPILE_TEST
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	help
+	  This selects pinctrl driver for Renesas RZ/A1 r7s72100 platforms.
+
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index a251f43..0c2328d2 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RZA1)	+= pinctrl-rza1.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
new file mode 100644
index 0000000..348faee
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -0,0 +1,1026 @@
+/*
+ * Combined GPIO and pin controller support for Renesas RZ/A1 (r7s72100) SoC
+ *
+ * Copyright (C) 2017 Jacopo Mondi
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/*
+ * This pincontroller/gpio combined driver support Renesas devices of RZ/A1
+ * family.
+ * This includes SoCs which are sub- or super- sets of this particular line,
+ * as RZ/A1H (r7s721000), RZ/A1M (r7s721001) and RZ/A1L (r7s721002) are.
+ *
+ * To avoid compatibility issues, make the driver compatible with
+ * "renesas,r7s72100-ports".
+ * The device tree description of gpio-controllers shall provide the exact
+ * number of available pins in each port to differentiate between different
+ * SoCs of this specific family.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
+
+#include "core.h"
+#include "devicetree.h"
+#include "pinmux.h"
+
+#define DRIVER_NAME			"pinctrl-rza1"
+
+#define RZA1_PINMUX_OF_ARGS		2
+
+#define P_REG				0x0000
+#define PPR_REG				0x0200
+#define PM_REG				0x0300
+#define PMC_REG				0x0400
+#define PFC_REG				0x0500
+#define PFCE_REG			0x0600
+#define PFCEA_REG			0x0a00
+#define PIBC_REG			0x4000
+#define PBDC_REG			0x4100
+#define PIPC_REG			0x4200
+#define RZA1_ADDR(mem, reg, port)	((mem) + (reg) + ((port) * 4))
+
+/*
+ * Each port supports up to 16 pins.
+ * Even if not all ports have 16 active pins, we enumerate them all anyway
+ * to be able to retrieve pin position (port number and pin offset) from the
+ * pin identifier.
+ */
+#define RZA1_NPORTS			12
+#define RZA1_PINS_PER_PORT		16
+#define RZA1_NPINS			(RZA1_PINS_PER_PORT * RZA1_NPORTS)
+#define RZA1_PIN_TO_PORT(pin)		((pin) / RZA1_PINS_PER_PORT)
+#define RZA1_PIN_TO_OFFSET(pin)		((pin) % RZA1_PINS_PER_PORT)
+
+/*
+ * RZ/A1 provides up to 8 different selectable alternate functions.
+ * Be careful here: the pin configuration subnodes in device tree enumerates
+ * alternate functions from 1 to 8; subtract 1 before using macros so to match
+ * registers configuration which expects numbers from 0 to 7 instead.
+ */
+#define MUX_FUNC_OFFS			3
+#define MUX_FUNC_MASK			(BIT(MUX_FUNC_OFFS) - 1)
+#define MUX_FUNC_PFC_MASK		BIT(0)
+#define MUX_FUNC_PFCE_MASK		BIT(1)
+#define MUX_FUNC_PFCEA_MASK		BIT(2)
+#define MUX_CONF_INPUT_ENABLE		0x01
+#define MUX_CONF_SWIO			0x02
+
+/**
+ * rza1_pin_conf - describes a pin position, id, mux config and output value
+ *
+ * Use uint32_t to match types used in of_device nodes argument lists.
+ *
+ * @id: the pin identifier from 0 to RZA1_NPINS
+ * @port: the port where pin sits on
+ * @offset: pin offset in the port
+ * @mux: alternate function configuration settings
+ * @value: output value to set the pin to
+ */
+struct rza1_pin_conf {
+	uint32_t id;
+	uint32_t port;
+	uint32_t offset;
+	uint32_t mux_conf;
+	uint32_t value;
+};
+
+/**
+ * rza1_port - describes a pin port
+ *
+ * This is mostly useful to lock register writes per-bank and not globally.
+ *
+ * @lock: protect access to HW registers
+ * @id: port number
+ * @base: logical address base
+ * @pins: pins sitting on this port
+ */
+struct rza1_port {
+	spinlock_t lock;
+	unsigned int id;
+	void __iomem *base;
+	struct pinctrl_pin_desc *pins;
+};
+
+/**
+ * rza1_pinctrl - RZ pincontroller device
+ *
+ * @dev: parent device structure
+ * @mutex: protect [pinctrl|pinmux]_generic functions
+ * @base: logical address base
+ * @nports: number of pin controller ports
+ * @ports: pin controller banks
+ * @ngpiochips: number of gpio chips
+ * @gpio_ranges: gpio ranges for pinctrl core
+ * @pins: pin array for pinctrl core
+ * @desc: pincontroller desc for pinctrl core
+ * @pctl: pinctrl device
+ */
+struct rza1_pinctrl {
+	struct device *dev;
+
+	struct mutex mutex;
+
+	void __iomem *base;
+
+	unsigned int nport;
+	struct rza1_port *ports;
+
+	unsigned int ngpiochips;
+
+	struct pinctrl_gpio_range *gpio_ranges;
+	struct pinctrl_pin_desc *pins;
+	struct pinctrl_desc desc;
+	struct pinctrl_dev *pctl;
+};
+
+/* ----------------------------------------------------------------------------
+ * RZ/A1 SoC operations
+ */
+
+/**
+ * rza1_set_bit() - un-locked set/clear a single bit in pin configuration
+ *		    registers
+ *
+ * @port: port where pin sits on
+ * @reg: register offset
+ * @port: port number where pin sits
+ * @offset: pin offset in port register
+ * @set: set/clear flag
+ */
+static inline void rza1_set_bit(const struct rza1_port *port,
+				unsigned int reg, unsigned int offset,
+				bool set)
+{
+	void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
+	u16 val = ioread16(mem);
+
+	if (set)
+		val |= BIT(offset);
+	else
+		val &= ~BIT(offset);
+
+	iowrite16(val, mem);
+}
+
+/**
+ * rza1_get_bit() - get a bit value in a pin configuration register
+ *
+ * @port: port where pin sits on
+ * @reg: register offset
+ * @offset: pin offset in port register
+ */
+static inline int rza1_get_bit(struct rza1_port *port,
+			       unsigned int reg, unsigned int offset)
+{
+	void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
+
+	return ioread16(mem) & BIT(offset);
+}
+
+/**
+ * rza1_pin_reset() - reset a pin to default initial state
+ *
+ * Reset pin state disabling input buffer and bi-directional control,
+ * and configure it as input port.
+ * Note that pin is now configured with direction as input but with input
+ * buffer disabled. This implies the pin value cannot be read in this state.
+ *
+ * @port: port where pin sits on
+ * @offset: pin offset
+ */
+static void rza1_pin_reset(struct rza1_port *port,
+			   unsigned int offset)
+{
+	spin_lock(&port->lock);
+	rza1_set_bit(port, PIBC_REG, offset, 0);
+	rza1_set_bit(port, PBDC_REG, offset, 0);
+
+	rza1_set_bit(port, PM_REG, offset, 1);
+	rza1_set_bit(port, PMC_REG, offset, 0);
+	rza1_set_bit(port, PIPC_REG, offset, 0);
+	spin_unlock(&port->lock);
+}
+
+/**
+ * rza1_pin_get_direction() - get I/O direction on a pin in port mode
+ *
+ * @port: port where pin sits on
+ * @offset: pin offset
+ */
+static inline int rza1_pin_get_direction(struct rza1_port *port,
+					 int offset)
+{
+	int input;
+
+	spin_lock(&port->lock);
+	input = rza1_get_bit(port, PM_REG, offset);
+	spin_unlock(&port->lock);
+
+	return input;
+}
+
+/**
+ * rza1_pin_set_direction() - set I/O direction on a pin in port mode
+ *
+ * When running in output port mode keep PBDC enabled to allow reading the
+ * pin value from PPR.
+ * When in alternate mode disable that (if not explicitly required) not to
+ * interfere with the alternate function mode.
+ *
+ * @port: port where pin sits on
+ * @offset: pin offset
+ * @input: input enable/disable flag
+ */
+static inline void rza1_pin_set_direction(struct rza1_port *port,
+					  unsigned int offset,
+					  bool input)
+{
+	spin_lock(&port->lock);
+	if (input)
+		rza1_set_bit(port, PIBC_REG, offset, 1);
+	else {
+		rza1_set_bit(port, PM_REG, offset, 0);
+		rza1_set_bit(port, PBDC_REG, offset, 1);
+	}
+	spin_unlock(&port->lock);
+}
+
+/**
+ * rza1_pin_set() - set output value on a pin in port mode
+ *
+ * @port: port where pin sits on
+ * @offset: pin offset
+ * @value: pin output value
+ */
+static inline void rza1_pin_set(struct rza1_port *port,
+				unsigned int offset, unsigned int value)
+{
+	spin_lock(&port->lock);
+	rza1_set_bit(port, P_REG, offset, !!value);
+	spin_unlock(&port->lock);
+}
+
+/**
+ * rza1_pin_get() - get input value on a pin in port mode
+ *
+ * @port: port where pin sits on
+ * @offset: pin offset
+ */
+static inline int rza1_pin_get(struct rza1_port *port, unsigned int offset)
+{
+	int val;
+
+	spin_lock(&port->lock);
+	val = rza1_get_bit(port, PPR_REG, offset);
+	spin_unlock(&port->lock);
+
+	return val;
+}
+
+/**
+ * rza1_alternate_function_conf() - configure pin in alternate function mode
+ *
+ * @pinctrl: RZ/A1 pin controller device
+ * @pin_conf: single pin configuration descriptor
+ */
+static int rza1_alternate_function_conf(struct rza1_pinctrl *rza1_pctl,
+					struct rza1_pin_conf *pin_conf)
+{
+	unsigned int offset = pin_conf->offset;
+	struct rza1_port *port = &rza1_pctl->ports[pin_conf->port];
+	u8 mux_mode = (pin_conf->mux_conf - 1) & MUX_FUNC_MASK;
+	u8 mux_conf = pin_conf->mux_conf >> MUX_FUNC_OFFS;
+	bool swio_en = !!(mux_conf & MUX_CONF_SWIO);
+	bool input_en = !!(mux_conf & MUX_CONF_INPUT_ENABLE);
+
+	rza1_pin_reset(port, offset);
+
+	/*
+	 * When configuring pin with Software Controlled IO mode in alternate
+	 * mode, do not enable bi-directional control to avoid driving Pn
+	 * value to the pin input.
+	 * When working in direct IO mode (aka alternate function drives the
+	 * pin direction), enable bi-directional control for input pins in
+	 * order to enable the pin's input buffer as a consequence.
+	 */
+	if ((!swio_en && input_en) || (swio_en && !input_en))
+		rza1_set_bit(port, PBDC_REG, offset, 1);
+
+	/*
+	 * Enable alternate function mode and select it.
+	 *
+	 * ----------------------------------------------------
+	 * Alternate mode selection table:
+	 *
+	 * PMC	PFC	PFCE	PFCAE	mux_mode
+	 * 1	0	0	0	0
+	 * 1	1	0	0	1
+	 * 1	0	1	0	2
+	 * 1	1	1	0	3
+	 * 1	0	0	1	4
+	 * 1	1	0	1	5
+	 * 1	0	1	1	6
+	 * 1	1	1	1	7
+	 * ----------------------------------------------------
+	 */
+	rza1_set_bit(port, PFC_REG, offset, mux_mode & MUX_FUNC_PFC_MASK);
+	rza1_set_bit(port, PFCE_REG, offset, mux_mode & MUX_FUNC_PFCE_MASK);
+	rza1_set_bit(port, PFCEA_REG, offset, mux_mode & MUX_FUNC_PFCEA_MASK);
+
+	/*
+	 * All alternate functions except a few (4) need PIPCn = 1.
+	 * If PIPCn has to stay disabled (SW IO mode), configure PMn according
+	 * to I/O direction specified by pin configuration -after- PMC has been
+	 * set to one.
+	 */
+	if (!swio_en)
+		rza1_set_bit(port, PIPC_REG, offset, 1);
+
+	rza1_set_bit(port, PMC_REG, offset, 1);
+
+	if (swio_en)
+		rza1_set_bit(port, PM_REG, offset, input_en);
+
+	return 0;
+}
+
+/* ----------------------------------------------------------------------------
+ * pinctrl operations
+ */
+
+/**
+ * rza1_dt_node_to_map() - map a node to a function/group map
+ *
+ * Functions and groups are collected and registered to pinctrl_generic
+ * during DT parsing routine.
+ *
+ * @pctldev: pin controller device
+ * @np: device tree node to parse
+ * @map: pointer to pin map (output)
+ * @num_maps: number of collected maps (output)
+ */
+static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
+			       struct device_node *np,
+			       struct pinctrl_map **map,
+			       unsigned int *num_maps)
+{
+	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct group_desc *grp;
+	unsigned int grp_sel;
+
+	/*
+	 * Find the group of this node and check if we need create
+	 * config maps for pins.
+	 */
+	grp_sel = pinctrl_get_group_selector(pctldev, np->name);
+	if (grp_sel < 0) {
+		dev_err(rza1_pctl->dev, "unable to find group for node %s\n",
+			np->name);
+		return -EINVAL;
+	}
+
+	grp = pinctrl_generic_get_group(pctldev, grp_sel);
+	if (!grp) {
+		dev_err(rza1_pctl->dev, "unable to find group for node %s\n",
+			np->name);
+		return -EINVAL;
+	}
+
+	*num_maps = 0;
+	*map = kzalloc(sizeof(**map), GFP_KERNEL);
+	if (!*map)
+		return -ENOMEM;
+
+	(*map)->type	= PIN_MAP_TYPE_MUX_GROUP;
+	(*map)->data.mux.group	= np->name;
+	(*map)->data.mux.function = np->name;
+	*num_maps = 1;
+
+	return 0;
+}
+
+static void rza1_dt_free_map(struct pinctrl_dev *pctldev,
+			     struct pinctrl_map *map, unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops rza1_pinctrl_ops = {
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
+	.dt_node_to_map		= rza1_dt_node_to_map,
+	.dt_free_map		= rza1_dt_free_map,
+};
+
+/* ----------------------------------------------------------------------------
+ * gpio operations
+ */
+
+/**
+ * rza1_gpio_request() - configure pin in port mode
+ *
+ * Configure a pin as gpio (port mode).
+ * After reset, the pin is in input mode with input buffer disabled.
+ * To use the pin as input or output, set_direction shall be called first
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	rza1_pin_reset(port, gpio);
+
+	return 0;
+}
+
+/**
+ * rza1_gpio_disable_free() - reset a pin
+ *
+ * Surprisingly, disable_free a gpio, is equivalent to request it.
+ * Reset pin to port mode, with input buffer disabled. This overwrites all
+ * port direction settings applied with set_direction
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static void rza1_gpio_free(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	rza1_pin_reset(port, gpio);
+}
+
+/**
+ * rza1_gpio_get_direction() - get a gpio pin I/O direction
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	return rza1_pin_get_direction(port, offset);
+}
+
+/**
+ * rza1_gpio_direction_input() - set input direction on a gpio
+ *
+ * Enable input buffer to make the pin value accessible
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static int rza1_gpio_direction_input(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	rza1_pin_set_direction(port, offset, true);
+
+	return 0;
+}
+
+/**
+ * rza1_gpio_direction_output() - set value and direction on a gpio
+ *
+ * Set value before driving pin direction
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static int rza1_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int offset,
+				      int value)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	rza1_pin_set(port, offset, value);
+	rza1_pin_set_direction(port, offset, false);
+
+	return 0;
+}
+
+/**
+ * rza1_gpio_get() - read a gpio pin value
+ *
+ * Read gpio pin value through PPR register.
+ * Requires bi-directional mode to work when reading value of a pin
+ * in output mode
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static int rza1_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	return rza1_pin_get(port, offset);
+}
+
+/**
+ * rza1_gpio_set() - set a gpio pin value
+ *
+ * @chip: gpio chip where the gpio sits on
+ * @gpio: gpio offset
+ */
+static void rza1_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
+{
+	struct rza1_port *port = gpiochip_get_data(chip);
+
+	rza1_pin_set(port, offset, value);
+}
+
+struct gpio_chip rza1_gpiochip_template = {
+	.request		= rza1_gpio_request,
+	.free			= rza1_gpio_free,
+	.get_direction		= rza1_gpio_get_direction,
+	.direction_input	= rza1_gpio_direction_input,
+	.direction_output	= rza1_gpio_direction_output,
+	.get			= rza1_gpio_get,
+	.set			= rza1_gpio_set,
+};
+
+/* ----------------------------------------------------------------------------
+ * pinmux operations
+ */
+
+/**
+ * rza1_pinmux_set() - retrieve pins from a group and apply them mux settings
+ *
+ * @pctldev: pin controller device
+ * @selector: function selector
+ * @group: group selector
+ */
+static int rza1_pinmux_set(struct pinctrl_dev *pctldev, unsigned int selector,
+			   unsigned int group)
+{
+	int i;
+	struct group_desc *grp;
+	struct function_desc *func;
+	struct rza1_pin_conf *pin_confs;
+	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!grp)
+		return -EINVAL;
+
+	func = pinmux_generic_get_function(pctldev, selector);
+	if (!func)
+		return -EINVAL;
+
+	pin_confs = (struct rza1_pin_conf *)func->data;
+	for (i = 0; i < grp->num_pins; ++i) {
+		int ret;
+
+		ret = rza1_alternate_function_conf(rza1_pctl, &pin_confs[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct pinmux_ops rza1_pinmux_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
+	.set_mux		= rza1_pinmux_set,
+	.strict			= true,
+};
+
+/* ----------------------------------------------------------------------------
+ * RZ/A1 pin controller driver operations
+ */
+
+static unsigned int rza1_count_gpio_chips(struct device_node *np)
+{
+	unsigned int count = 0;
+	struct device_node *child;
+
+	for_each_child_of_node(np, child) {
+		if (!of_property_read_bool(child, "gpio-controller"))
+			continue;
+
+		count++;
+	}
+
+	return count;
+}
+
+/**
+ * rza1_parse_pmx_function() - parse and register a pin mux function
+ *
+ * Pins for RZ SoC pin controller described by "renesas-pins" property.
+ *
+ * First argument in the list identifies the pin, while the second one
+ * describes the requested alternate function number and additional
+ * configuration parameter to be applied to the selected function.
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ * @np: of pmx sub-node
+ */
+static int rza1_parse_pmx_function(struct rza1_pinctrl *rza1_pctl,
+				   struct device_node *np)
+{
+	int ret;
+	int of_pins;
+	unsigned int i;
+	unsigned int *grpins;
+	const char *grpname;
+	const char **fngrps;
+	struct rza1_pin_conf *pin_confs;
+	struct pinctrl_dev *pctldev = rza1_pctl->pctl;
+	char const *prop_name = "renesas,pins";
+
+	of_pins = pinctrl_count_index_with_args(np, prop_name);
+	if (of_pins <= 0) {
+		dev_err(rza1_pctl->dev, "Missing %s property\n", prop_name);
+		return -ENOENT;
+	}
+
+	/*
+	 * Functions are made of 1 group only;
+	 * in facts, functions and groups are identical for this pin controller
+	 * except that functions carry an array of per-pin configurations
+	 * settings.
+	 */
+	pin_confs = devm_kcalloc(rza1_pctl->dev, of_pins, sizeof(*pin_confs),
+				 GFP_KERNEL);
+	grpins = devm_kcalloc(rza1_pctl->dev, of_pins, sizeof(*grpins),
+			      GFP_KERNEL);
+	fngrps = devm_kzalloc(rza1_pctl->dev, sizeof(*fngrps), GFP_KERNEL);
+
+	if (!pin_confs || !grpins || !fngrps)
+		return -ENOMEM;
+
+	/* Collect pin positions and mux settings to store them in function */
+	for (i = 0; i < of_pins; ++i) {
+		struct rza1_pin_conf *pin_conf = &pin_confs[i];
+		struct of_phandle_args of_pins_args;
+
+		ret = pinctrl_parse_index_with_args(np, prop_name, i,
+						    &of_pins_args);
+		if (ret)
+			return ret;
+
+		if (of_pins_args.args_count < RZA1_PINMUX_OF_ARGS) {
+			dev_err(rza1_pctl->dev,
+				"Wrong arguments number for %s property\n",
+				prop_name);
+			return -EINVAL;
+		}
+
+		/*
+		 * This new pins configuration will be associated with a new
+		 * function, and later used to set-up pin muxing
+		 */
+		pin_conf->id = of_pins_args.args[0];
+		pin_conf->port = RZA1_PIN_TO_PORT(pin_conf->id);
+		pin_conf->offset = RZA1_PIN_TO_OFFSET(pin_conf->id);
+		pin_conf->mux_conf = of_pins_args.args[1];
+
+		if (pin_conf->port >= RZA1_NPORTS ||
+		    pin_conf->offset >= RZA1_PINS_PER_PORT) {
+			dev_err(rza1_pctl->dev,
+				"Wrong port %u pin %u for %s property\n",
+				pin_conf->port, pin_conf->offset, prop_name);
+			return -EINVAL;
+		}
+
+		grpins[i] = pin_conf->id;
+	}
+
+	grpname	= np->name;
+	fngrps[0] = grpname;
+
+	mutex_lock(&rza1_pctl->mutex);
+	ret = pinctrl_generic_add_group(pctldev, grpname, grpins, of_pins,
+					NULL);
+	if (ret) {
+		mutex_unlock(&rza1_pctl->mutex);
+		return ret;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, grpname, fngrps, 1,
+					  pin_confs);
+	if (ret)
+		goto remove_group;
+	mutex_unlock(&rza1_pctl->mutex);
+
+	dev_info(rza1_pctl->dev, "Parsed function and group %s with %d pins\n",
+				 grpname, of_pins);
+
+	return 0;
+
+remove_group:
+	dev_info(rza1_pctl->dev, "Unable to parse function and group %s\n",
+				 grpname);
+	pinctrl_generic_remove_last_group(pctldev);
+	mutex_unlock(&rza1_pctl->mutex);
+
+	return ret;
+}
+
+/**
+ * rza1_remove_pmx_functions() - un-register pmx functions and groups
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ */
+static void rza1_remove_pmx_functions(struct rza1_pinctrl *rza1_pctl)
+{
+	struct pinctrl_dev *pctldev = rza1_pctl->pctl;
+
+	mutex_lock(&rza1_pctl->mutex);
+	pinmux_generic_free_functions(pctldev);
+	mutex_unlock(&rza1_pctl->mutex);
+}
+
+/**
+ * rza1_parse_gpiochip() - parse and register a gpio chip and pin range
+ *
+ * The gpio controller subnode shall provide a "gpio-ranges" list property as
+ * defined by gpio device tree binding documentation.
+ * Gpio chips and pin ranges are here collected, but ranges are registered
+ * later, after pin controller has been registered too. Only gpiochips are
+ * registered here.
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ * @np: of gpio-controller node
+ * @chip: gpio chip to register to gpiolib
+ * @range: pin range to register to pinctrl core
+ */
+static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
+			       struct device_node *np,
+			       struct gpio_chip *chip,
+			       struct pinctrl_gpio_range *range)
+{
+	int ret;
+	u32 pinctrl_base;
+	unsigned int gpioport;
+	struct of_phandle_args of_args;
+	const char *list_name = "gpio-ranges";
+
+	of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
+
+	/*
+	 * Find out on which port this gpio-chip maps to inspecting the second
+	 * argument of "gpio-ranges" property.
+	 */
+	pinctrl_base = of_args.args[1];
+	gpioport = RZA1_PIN_TO_PORT(pinctrl_base);
+	if (gpioport > RZA1_NPORTS) {
+		dev_err(rza1_pctl->dev,
+			"Invalid values in property %s\n", list_name);
+		return -EINVAL;
+	}
+
+	*chip		= rza1_gpiochip_template;
+	chip->base	= -1;
+	chip->label	= kasprintf(GFP_KERNEL, "%s-%d", np->name, gpioport);
+	chip->ngpio	= of_args.args[2];
+	chip->of_node	= np;
+
+	range->id	= gpioport;
+	range->name	= kasprintf(GFP_KERNEL, "%s-%d", np->name, gpioport);
+	range->pin_base	= range->base = pinctrl_base;
+	range->npins	= of_args.args[2];
+	range->gc	= chip;
+
+	ret = devm_gpiochip_add_data(rza1_pctl->dev, chip,
+				     &rza1_pctl->ports[gpioport]);
+	if (ret)
+		return ret;
+
+	dev_info(rza1_pctl->dev, "Parsed gpiochip %s with %d pins\n",
+		 chip->label, chip->ngpio);
+
+	return 0;
+}
+
+/**
+ * rza1_parse_dt() - parse DT to collect gpiochips and pmx functions
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ */
+static int rza1_parse_dt(struct rza1_pinctrl *rza1_pctl)
+{
+	int ret;
+	unsigned int npmxfuncs;
+	unsigned int ngpiochips;
+	unsigned int i;
+	struct gpio_chip *gpio_chips;
+	struct pinctrl_gpio_range *gpio_ranges;
+	struct device_node *np = rza1_pctl->dev->of_node;
+	struct device_node *child;
+
+	ngpiochips = rza1_count_gpio_chips(np);
+	if (ngpiochips) {
+		dev_info(rza1_pctl->dev, "Registering %u gpio chips\n",
+					 ngpiochips);
+
+		gpio_chips = devm_kcalloc(rza1_pctl->dev, ngpiochips,
+					  sizeof(*gpio_chips), GFP_KERNEL);
+		gpio_ranges = devm_kcalloc(rza1_pctl->dev, ngpiochips,
+					   sizeof(*gpio_ranges), GFP_KERNEL);
+		if (!gpio_chips || !gpio_ranges)
+			return -ENOMEM;
+	} else {
+		dev_dbg(rza1_pctl->dev, "No gpiochip registered\n");
+		gpio_ranges = NULL;
+	}
+
+	rza1_pctl->gpio_ranges	= gpio_ranges;
+
+	i = 0;
+	npmxfuncs = 0;
+	for_each_child_of_node(np, child) {
+		if (of_property_read_bool(child, "gpio-controller")) {
+			/* Never get here if ngpiochips == 0 */
+			ret = rza1_parse_gpiochip(rza1_pctl, child,
+						  &gpio_chips[i],
+						  &gpio_ranges[i]);
+			if (ret)
+				goto gpio_pmx_unregister;
+
+			++i;
+		} else {
+			ret = rza1_parse_pmx_function(rza1_pctl, child);
+			if (ret)
+				goto gpio_pmx_unregister;
+
+			++npmxfuncs;
+		}
+	}
+
+	rza1_pctl->ngpiochips = i;
+
+	dev_info(rza1_pctl->dev,
+		 "Registered %u gpio controllers and %u pin mux functions\n",
+		 rza1_pctl->ngpiochips, npmxfuncs);
+
+	return 0;
+
+gpio_pmx_unregister:
+	/*
+	 * If a pmx function creation fails or a gpiochip cannot be registered,
+	 * clean up everything we have registered to gpio or pmx core so far.
+	 */
+	for (; i > 0; i--)
+		devm_gpiochip_remove(rza1_pctl->dev, &gpio_chips[i - 1]);
+
+	rza1_remove_pmx_functions(rza1_pctl);
+
+	return ret;
+}
+
+/**
+ * rza1_pinctrl_register() - Enumerate pins, ports, gpiochips and functions and
+ *			     register to pinctrl and gpio cores
+ *
+ * @rza1_pctl: RZ/A1 pin controller device
+ */
+static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
+{
+	int ret;
+	unsigned int i;
+	struct rza1_port *ports;
+	struct pinctrl_pin_desc *pins;
+
+	pins = devm_kcalloc(rza1_pctl->dev, RZA1_NPINS, sizeof(*pins),
+			    GFP_KERNEL);
+	ports = devm_kcalloc(rza1_pctl->dev, RZA1_NPORTS, sizeof(*ports),
+			     GFP_KERNEL);
+	if (!pins || !ports)
+		return -ENOMEM;
+
+	rza1_pctl->pins		= pins;
+	rza1_pctl->desc.pins	= pins;
+	rza1_pctl->desc.npins	= RZA1_NPINS;
+	rza1_pctl->ports	= ports;
+
+	for (i = 0; i < RZA1_NPINS; ++i) {
+		unsigned int port = RZA1_PIN_TO_PORT(i);
+		unsigned int offset = RZA1_PIN_TO_OFFSET(i);
+
+		pins[i].number = i;
+		pins[i].name = kasprintf(GFP_KERNEL, "P%u-%u", port, offset);
+
+		if (i % RZA1_PINS_PER_PORT == 0) {
+			/*
+			 * Setup ports;
+			 * they provide per-port lock and logical base address.
+			 */
+			unsigned int port_id = RZA1_PIN_TO_PORT(i);
+
+			ports[port_id].id = port_id;
+			ports[port_id].base = rza1_pctl->base;
+			ports[port_id].pins = &pins[i];
+			spin_lock_init(&ports[port_id].lock);
+		}
+	}
+
+	ret = devm_pinctrl_register_and_init(rza1_pctl->dev, &rza1_pctl->desc,
+					     rza1_pctl, &rza1_pctl->pctl);
+	if (ret) {
+		dev_err(rza1_pctl->dev,
+			"RZ/A1 pin controller registration failed\n");
+		return ret;
+	}
+
+	ret = rza1_parse_dt(rza1_pctl);
+	if (ret) {
+		dev_err(rza1_pctl->dev, "RZ/A1 DT parsing failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rza1_pinctrl_probe(struct platform_device *pdev)
+{
+	int ret;
+	unsigned int i;
+	struct resource *res;
+	struct rza1_pinctrl *rza1_pctl;
+
+	rza1_pctl = devm_kzalloc(&pdev->dev, sizeof(*rza1_pctl), GFP_KERNEL);
+	if (!rza1_pctl)
+		return -ENOMEM;
+
+	rza1_pctl->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (ret)
+		return -ENODEV;
+
+	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(rza1_pctl->base))
+		return PTR_ERR(rza1_pctl->base);
+
+	mutex_init(&rza1_pctl->mutex);
+
+	platform_set_drvdata(pdev, rza1_pctl);
+
+	rza1_pctl->desc.name	= DRIVER_NAME;
+	rza1_pctl->desc.pctlops	= &rza1_pinctrl_ops;
+	rza1_pctl->desc.pmxops	= &rza1_pinmux_ops;
+	rza1_pctl->desc.owner	= THIS_MODULE;
+
+	ret = rza1_pinctrl_register(rza1_pctl);
+	if (ret)
+		return ret;
+
+	/* register pin control ranges collected while parsing device tree */
+	for (i = 0; i < rza1_pctl->ngpiochips; i++)
+		pinctrl_add_gpio_range(rza1_pctl->pctl,
+				       &rza1_pctl->gpio_ranges[i]);
+
+	dev_info(&pdev->dev,
+		 "RZ/A1 pin controller and gpio successfully registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id rza1_pinctrl_of_match[] = {
+	{ .compatible = "renesas,r7s72100-ports", },
+	{ }
+};
+
+static struct platform_driver rza1_pinctrl_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = rza1_pinctrl_of_match,
+	},
+	.probe = rza1_pinctrl_probe,
+};
+
+static int __init rza1_pinctrl_init(void)
+{
+	return platform_driver_register(&rza1_pinctrl_driver);
+}
+core_initcall(rza1_pinctrl_init);
+
+MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org");
+MODULE_DESCRIPTION("Pin and gpio controller driver for Reneas RZ/A1 SoC");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
