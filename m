From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V3 4/4] MIPS: Add xilfpga defconfig
Date: Mon, 26 Oct 2015 11:30:57 +0000
Message-ID: <1445859057-47665-5-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, robh+dt@kernel.org
Cc: Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add defconfig for MIPSfpga

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 -> V3
no change

V1 -> V2

Reduced redundant options that had crept in
---
 arch/mips/configs/xilfpga_defconfig | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/mips/configs/xilfpga_defconfig

diff --git a/arch/mips/configs/xilfpga_defconfig b/arch/mips/configs/xilfpga_defconfig
new file mode 100644
index 0000000..ed1dce3
--- /dev/null
+++ b/arch/mips/configs/xilfpga_defconfig
@@ -0,0 +1,40 @@
+CONFIG_MACH_XILFPGA=y
+# CONFIG_COMPACTION is not set
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+# CONFIG_BLOCK is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_UEVENT_HELPER is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_XILINX=y
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MIPS_PLATFORM_DEVICES is not set
+# CONFIG_IOMMU_SUPPORT is not set
+# CONFIG_PROC_PAGE_MONITOR is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_PANIC_ON_OOPS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0,115200"
-- 
1.9.1
