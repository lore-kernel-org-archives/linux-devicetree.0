From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 11/14] MIPS: Malta: Use syscon-reboot driver to reboot
Date: Mon, 19 Sep 2016 22:21:28 +0100
Message-ID: <20160919212132.28893-12-paul.burton@imgtec.com>
References: <20160919212132.28893-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160919212132.28893-1-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Linz <linz-LlUBiLVY8XKsTnJN9+BGXg@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make use of the generic syscon-reboot driver to reboot the Malta board,
reducing the amount of platform code it requires.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---

Changes in v2: None

 arch/mips/boot/dts/mti/malta.dts            | 12 ++++++++++++
 arch/mips/configs/malta_defconfig           |  2 ++
 arch/mips/configs/malta_kvm_defconfig       |  2 ++
 arch/mips/configs/malta_kvm_guest_defconfig |  2 ++
 arch/mips/configs/malta_qemu_32r6_defconfig |  2 ++
 arch/mips/configs/maltaaprp_defconfig       |  2 ++
 arch/mips/configs/maltasmvp_defconfig       |  2 ++
 arch/mips/configs/maltasmvp_eva_defconfig   |  2 ++
 arch/mips/configs/maltaup_defconfig         |  2 ++
 arch/mips/configs/maltaup_xpa_defconfig     |  2 ++
 arch/mips/mti-malta/malta-reset.c           | 15 ++-------------
 11 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/mips/boot/dts/mti/malta.dts b/arch/mips/boot/dts/mti/malta.dts
index 48783b1..f604a27 100644
--- a/arch/mips/boot/dts/mti/malta.dts
+++ b/arch/mips/boot/dts/mti/malta.dts
@@ -81,6 +81,18 @@
 		};
 	};
 
+	fpga_regs: system-controller@1f000000 {
+		compatible = "mti,malta-fpga", "syscon", "simple-mfd";
+		reg = <0x1f000000 0x1000>;
+
+		reboot {
+			compatible = "syscon-reboot";
+			regmap = <&fpga_regs>;
+			offset = <0x500>;
+			mask = <0x4d>;
+		};
+	};
+
 	isa {
 		compatible = "isa";
 		#address-cells = <2>;
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index d5d4816..58d43f3 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -318,6 +318,8 @@ CONFIG_LIBERTAS=m
 # CONFIG_SERIO_I8042 is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index ef6ef24..c8f7e28 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -331,6 +331,8 @@ CONFIG_LIBERTAS=m
 # CONFIG_SERIO_I8042 is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 3a49a77..d2f54e5 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -331,6 +331,8 @@ CONFIG_LIBERTAS=m
 # CONFIG_SERIO_I8042 is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index 65f140e..cbf37dd 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -132,6 +132,8 @@ CONFIG_LEGACY_PTY_COUNT=4
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 799c433..35f6ba2 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -132,6 +132,8 @@ CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index ac0eb4d..900f145 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -134,6 +134,8 @@ CONFIG_LEGACY_PTY_COUNT=4
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 3184600..8e2738b 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -137,6 +137,8 @@ CONFIG_LEGACY_PTY_COUNT=4
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index a79107d..6dc4e30 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -131,6 +131,8 @@ CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 62e05eb..3d0d9cb 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -326,6 +326,8 @@ CONFIG_LIBERTAS=m
 # CONFIG_SERIO_I8042 is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
diff --git a/arch/mips/mti-malta/malta-reset.c b/arch/mips/mti-malta/malta-reset.c
index 2fd2cc2..04d6b9c 100644
--- a/arch/mips/mti-malta/malta-reset.c
+++ b/arch/mips/mti-malta/malta-reset.c
@@ -8,21 +8,11 @@
  */
 #include <linux/io.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
 
 #include <asm/reboot.h>
 #include <asm/mach-malta/malta-pm.h>
 
-#define SOFTRES_REG	0x1f000500
-#define GORESET		0x42
-
-static void mips_machine_restart(char *command)
-{
-	unsigned int __iomem *softres_reg =
-		ioremap(SOFTRES_REG, sizeof(unsigned int));
-
-	__raw_writel(GORESET, softres_reg);
-}
-
 static void mips_machine_halt(void)
 {
 	while (true);
@@ -33,12 +23,11 @@ static void mips_machine_power_off(void)
 	mips_pm_suspend(PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_SOFF);
 
 	pr_info("Failed to power down, resetting\n");
-	mips_machine_restart(NULL);
+	machine_restart(NULL);
 }
 
 static int __init mips_reboot_setup(void)
 {
-	_machine_restart = mips_machine_restart;
 	_machine_halt = mips_machine_halt;
 	pm_power_off = mips_machine_power_off;
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
