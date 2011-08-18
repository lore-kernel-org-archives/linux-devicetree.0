From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 3/4] ARM: msm: Add devicetree support for msm8660-surf
Date: Thu, 18 Aug 2011 10:25:44 -0700
Message-ID: <1313688345-17699-4-git-send-email-davidb__33597.6799288348$1313689709$gmane$org@codeaurora.org>
References: <1313688345-17699-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-ID: <20110818173833.GC17990-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
Resent-To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
In-Reply-To: <1313688345-17699-1-git-send-email-davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adds support for booting via device tree with a simple serial console.

Signed-off-by: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/msm8660-surf.dts |   24 +++++++++++++++
 arch/arm/mach-msm/board-msm8x60.c  |   58 +++++++++++++++++++++++++++++++----
 2 files changed, 75 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/msm8660-surf.dts

diff --git a/arch/arm/boot/dts/msm8660-surf.dts b/arch/arm/boot/dts/msm8660-surf.dts
new file mode 100644
index 0000000..15ded0d
--- /dev/null
+++ b/arch/arm/boot/dts/msm8660-surf.dts
@@ -0,0 +1,24 @@
+/dts-v1/;
+
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "Qualcomm MSM8660 SURF";
+	compatible = "qcom,msm8660-surf", "qcom,msm8660";
+	interrupt-parent = <&intc>;
+
+	intc: interrupt-controller@02080000 {
+		compatible = "qcom,msm-8660-qgic";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = < 0x02080000 0x1000 >,
+		      < 0x02081000 0x1000 >;
+	};
+
+	serial@19c400000 {
+		compatible = "qcom,msm-hsuart", "qcom,msm-uart";
+		reg = <0x19c40000 0x1000>,
+		      <0x19c00000 0x1000>;
+		interrupts = <195>;
+	};
+};
diff --git a/arch/arm/mach-msm/board-msm8x60.c b/arch/arm/mach-msm/board-msm8x60.c
index 1163b6f..10fa8f6 100644
--- a/arch/arm/mach-msm/board-msm8x60.c
+++ b/arch/arm/mach-msm/board-msm8x60.c
@@ -1,4 +1,4 @@
-/* Copyright (c) 2010, Code Aurora Forum. All rights reserved.
+/* Copyright (c) 2010, 2011, Code Aurora Forum. All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 and
@@ -8,18 +8,16 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
- *
  */
 
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -64,6 +62,41 @@ static void __init msm8x60_init(void)
 {
 }
 
+#ifdef CONFIG_OF
+static struct of_dev_auxdata msm_auxdata_lookup[] __initdata = {
+	{}
+};
+
+static struct of_device_id msm_dt_gic_match[] __initdata = {
+	{ .compatible = "qcom,msm-8660-qgic", },
+	{}
+};
+
+static void __init msm8x60_dt_init(void)
+{
+	struct device_node *node;
+
+	node = of_find_matching_node_by_address(NULL, msm_dt_gic_match,
+			MSM8X60_QGIC_DIST_PHYS);
+	if (node)
+		irq_domain_add_simple(node, GIC_SPI_START);
+
+	if (of_machine_is_compatible("qcom,msm8660-surf")) {
+		printk(KERN_INFO "Init surf UART registers\n");
+		msm8x60_init_uart12dm();
+	}
+
+	of_platform_populate(NULL, of_default_bus_match_table,
+			msm_auxdata_lookup, NULL);
+}
+
+static const char *msm8x60_fluid_match[] __initdata = {
+	"qcom,msm8660-fluid",
+	"qcom,msm8660-surf",
+	NULL
+};
+#endif /* CONFIG_OF */
+
 MACHINE_START(MSM8X60_RUMI3, "QCT MSM8X60 RUMI3")
 	.map_io = msm8x60_map_io,
 	.init_irq = msm8x60_init_irq,
@@ -91,3 +124,14 @@ MACHINE_START(MSM8X60_FFA, "QCT MSM8X60 FFA")
 	.init_machine = msm8x60_init,
 	.timer = &msm_timer,
 MACHINE_END
+
+#ifdef CONFIG_OF
+/* TODO: General device tree support for all MSM. */
+DT_MACHINE_START(MSM_DT, "Qualcomm MSM (Flattened Device Tree)")
+	.map_io = msm8x60_map_io,
+	.init_irq = msm8x60_init_irq,
+	.init_machine = msm8x60_dt_init,
+	.timer = &msm_timer,
+	.dt_compat = msm8x60_fluid_match,
+MACHINE_END
+#endif /* CONFIG_OF */
-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
