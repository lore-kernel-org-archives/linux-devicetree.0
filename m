From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/7] ARM: bcm2835: Add a Raspberry Pi-specific clock driver.
Date: Mon, 18 May 2015 12:43:34 -0700
Message-ID: <1431978219-14226-3-git-send-email-eric@anholt.net>
References: <1431978219-14226-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431978219-14226-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

Unfortunately, the clock manager's registers are not accessible by the
ARM, so we have to request that the firmware modify our clocks for us.

This driver only registers the clocks at the point they are requested
by a client driver.  This is partially to support returning
-EPROBE_DEFER when the firmware driver isn't supported yet, but it
also avoids issues with disabling "unused" clocks due to them not yet
being connected to their consumers in the DT.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-raspberrypi.c         | 241 ++++++++++++++++++++++++++=
++++++++
 include/dt-bindings/clk/raspberrypi.h |  23 ++++
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/clk/clk-raspberrypi.c
 create mode 100644 include/dt-bindings/clk/raspberrypi.h

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3d00c25..6a5dafa 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_MACH_ASM9260)		+=3D clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+=3D clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+=3D clk-axm5516.o
 obj-$(CONFIG_ARCH_BCM2835)		+=3D clk-bcm2835.o
+obj-$(CONFIG_ARCH_BCM2835)		+=3D clk-raspberrypi.o
 obj-$(CONFIG_COMMON_CLK_CDCE706)	+=3D clk-cdce706.o
 obj-$(CONFIG_ARCH_CLPS711X)		+=3D clk-clps711x.o
 obj-$(CONFIG_ARCH_EFM32)		+=3D clk-efm32gg.o
diff --git a/drivers/clk/clk-raspberrypi.c b/drivers/clk/clk-raspberryp=
i.c
new file mode 100644
index 0000000..5745875
--- /dev/null
+++ b/drivers/clk/clk-raspberrypi.c
@@ -0,0 +1,241 @@
+/*
+ * Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * Implements a clock provider for the clocks controlled by the
+ * firmware on Raspberry Pi.
+ *
+ * These clocks are controlled by the CLOCKMAN peripheral in the
+ * hardware, but the ARM doesn't have access to the registers for
+ * them.  As a result, we have to call into the firmware to get it to
+ * enable, disable, and set their frequencies.
+ *
+ * We don't have an interface for getting the set of frequencies
+ * available from the hardware.  We can request a min/max, but other
+ * than that we have to request a frequency and take what it gives us.
+ */
+
+#include <dt-bindings/clk/raspberrypi.h>
+#include <linux/clk-provider.h>
+#include <soc/bcm2835/raspberrypi-firmware-property.h>
+
+struct rpi_firmware_clock {
+	/* Clock definitions in our static struct. */
+	int clock_id;
+	const char *name;
+
+	/* The rest are filled in at init time. */
+	struct clk_hw hw;
+	struct device *dev;
+	struct device_node *firmware_node;
+};
+
+static struct rpi_firmware_clock rpi_clocks[] =3D {
+	[RPI_CLOCK_EMMC] =3D { 1, "emmc" },
+	[RPI_CLOCK_UART0] =3D { 2, "uart0" },
+	[RPI_CLOCK_ARM] =3D { 3, "arm" },
+	[RPI_CLOCK_CORE] =3D { 4, "core" },
+	[RPI_CLOCK_V3D] =3D { 5, "v3d" },
+	[RPI_CLOCK_H264] =3D { 6, "h264" },
+	[RPI_CLOCK_ISP] =3D { 7, "isp" },
+	[RPI_CLOCK_SDRAM] =3D { 8, "sdram" },
+	[RPI_CLOCK_PIXEL] =3D { 9, "pixel" },
+	[RPI_CLOCK_PWM] =3D { 10, "pwm" },
+};
+
+static int rpi_clk_is_on(struct clk_hw *hw)
+{
+	struct rpi_firmware_clock *rpi_clk =3D
+		container_of(hw, struct rpi_firmware_clock, hw);
+	u32 packet[2];
+	int ret;
+
+	packet[0] =3D rpi_clk->clock_id;
+	packet[1] =3D 0;
+	ret =3D rpi_firmware_property(rpi_clk->firmware_node,
+				    RPI_FIRMWARE_GET_CLOCK_STATE,
+				    &packet, sizeof(packet));
+	if (ret) {
+		dev_err(rpi_clk->dev, "Failed to get clock state\n");
+		return 0;
+	}
+
+	return packet[1] !=3D 0;
+}
+
+static int rpi_clk_set_state(struct rpi_firmware_clock *rpi_clk, bool =
on)
+{
+	u32 packet[2];
+	int ret;
+
+	packet[0] =3D rpi_clk->clock_id;
+	packet[1] =3D on;
+	ret =3D rpi_firmware_property(rpi_clk->firmware_node,
+				    RPI_FIRMWARE_SET_CLOCK_STATE,
+				    &packet, sizeof(packet));
+	if (ret || (packet[1] & (1 << 1))) {
+		dev_err(rpi_clk->dev, "Failed to set clock state\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rpi_clk_on(struct clk_hw *hw)
+{
+	struct rpi_firmware_clock *rpi_clk =3D
+		container_of(hw, struct rpi_firmware_clock, hw);
+
+	return rpi_clk_set_state(rpi_clk, true);
+}
+
+static void rpi_clk_off(struct clk_hw *hw)
+{
+	struct rpi_firmware_clock *rpi_clk =3D
+		container_of(hw, struct rpi_firmware_clock, hw);
+
+	rpi_clk_set_state(rpi_clk, false);
+}
+
+static unsigned long rpi_clk_get_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct rpi_firmware_clock *rpi_clk =3D
+		container_of(hw, struct rpi_firmware_clock, hw);
+	u32 packet[2];
+	int ret;
+
+	packet[0] =3D rpi_clk->clock_id;
+	packet[1] =3D 0;
+	ret =3D rpi_firmware_property(rpi_clk->firmware_node,
+				    RPI_FIRMWARE_GET_CLOCK_RATE,
+				    &packet, sizeof(packet));
+	if (ret) {
+		dev_err(rpi_clk->dev, "Failed to get clock rate\n");
+		return 0;
+	}
+
+	return packet[1];
+}
+
+static int rpi_clk_set_rate(struct clk_hw *hw,
+			    unsigned long rate, unsigned long parent_rate)
+{
+	struct rpi_firmware_clock *rpi_clk =3D
+		container_of(hw, struct rpi_firmware_clock, hw);
+	u32 packet[2];
+	int ret;
+
+	packet[0] =3D rpi_clk->clock_id;
+	packet[1] =3D rate;
+	ret =3D rpi_firmware_property(rpi_clk->firmware_node,
+				    RPI_FIRMWARE_SET_CLOCK_RATE,
+				    &packet, sizeof(packet));
+	if (ret) {
+		dev_err(rpi_clk->dev, "Failed to set clock rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static long rpi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	/*
+	 * The firmware will end up rounding our rate to something,
+	 * but we don't have an interface for it.  Just return the
+	 * requested value, and it'll get updated after the clock gets
+	 * set.
+	 */
+	return rate;
+}
+
+static struct clk_ops rpi_clk_ops =3D {
+	.is_prepared =3D rpi_clk_is_on,
+	.prepare =3D rpi_clk_on,
+	.unprepare =3D rpi_clk_off,
+	.recalc_rate =3D rpi_clk_get_rate,
+	.set_rate =3D rpi_clk_set_rate,
+	.round_rate =3D rpi_clk_round_rate,
+};
+
+DEFINE_MUTEX(delayed_clock_init);
+static struct clk *rpi_firmware_delayed_get_clk(struct of_phandle_args=
 *clkspec,
+						void *_data)
+{
+	struct device_node *of_node =3D _data;
+	struct platform_device *pdev =3D of_find_device_by_node(of_node);
+	struct device *dev =3D &pdev->dev;
+	struct device_node *firmware_node;
+	struct clk_init_data init;
+	struct rpi_firmware_clock *rpi_clk;
+	struct clk *ret_clk;
+	int ret;
+
+	if (clkspec->args_count !=3D 1) {
+		dev_err(dev, "clock phandle should have 1 argument\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (clkspec->args[0] >=3D ARRAY_SIZE(rpi_clocks)) {
+		dev_err(dev, "clock phandle index %d too large\n",
+			clkspec->args[0]);
+		return ERR_PTR(-ENODEV);
+	}
+
+	rpi_clk =3D &rpi_clocks[clkspec->args[0]];
+
+	firmware_node =3D of_parse_phandle(of_node, "firmware", 0);
+	if (!firmware_node) {
+		dev_err(dev, "%s: Missing firmware node\n", rpi_clk->name);
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* Try a no-op transaction to see if the driver is loaded yet. */
+	ret =3D rpi_firmware_property_list(firmware_node, NULL, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	mutex_lock(&delayed_clock_init);
+	if (rpi_clk->hw.clk) {
+		mutex_unlock(&delayed_clock_init);
+		return rpi_clk->hw.clk;
+	}
+	memset(&init, 0, sizeof(init));
+	init.ops =3D &rpi_clk_ops;
+
+	rpi_clk->firmware_node =3D firmware_node;
+	rpi_clk->dev =3D dev;
+	rpi_clk->hw.init =3D &init;
+	init.name =3D rpi_clk->name;
+	init.flags =3D CLK_IS_ROOT;
+
+	ret_clk =3D clk_register(dev, &rpi_clk->hw);
+	mutex_unlock(&delayed_clock_init);
+	if (!IS_ERR(ret_clk))
+		dev_info(dev, "registered %s clock\n", rpi_clk->name);
+	else {
+		dev_err(dev, "%s clock failed to init: %ld\n", rpi_clk->name,
+			PTR_ERR(ret_clk));
+	}
+	return ret_clk;
+}
+
+void __init rpi_firmware_init_clock_provider(struct device_node *node)
+{
+	/* We delay construction of our struct clks until get time,
+	 * because we need to be able to return -EPROBE_DEFER if the
+	 * firmware driver isn't up yet.  clk core doesn't support
+	 * re-probing on -EPROBE_DEFER, but callers of clk_get can.
+	 */
+	of_clk_add_provider(node, rpi_firmware_delayed_get_clk, node);
+}
+
+CLK_OF_DECLARE(rpi_firmware_clocks, "raspberrypi,firmware-clocks",
+	       rpi_firmware_init_clock_provider);
diff --git a/include/dt-bindings/clk/raspberrypi.h b/include/dt-binding=
s/clk/raspberrypi.h
new file mode 100644
index 0000000..c9fa85c
--- /dev/null
+++ b/include/dt-bindings/clk/raspberrypi.h
@@ -0,0 +1,23 @@
+#/*
+ *  Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_CLK_RASPBERRYPI_H
+#define _DT_BINDINGS_CLK_RASPBERRYPI_H
+
+#define RPI_CLOCK_EMMC	0
+#define RPI_CLOCK_UART0	1
+#define RPI_CLOCK_ARM	2
+#define RPI_CLOCK_CORE	3
+#define RPI_CLOCK_V3D	4
+#define RPI_CLOCK_H264	5
+#define RPI_CLOCK_ISP	6
+#define RPI_CLOCK_SDRAM	7
+#define RPI_CLOCK_PIXEL	8
+#define RPI_CLOCK_PWM	9
+
+#endif
--=20
2.1.4
