From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 06/14] tegra: fdt: Add device tree file for Tegra2
	Seaboard
Date: Wed, 23 Nov 2011 19:54:48 -0800
Message-ID: <1322106896-23054-7-git-send-email-sjg@chromium.org>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1322106896-23054-2-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Albert ARIBAUD <albert.u.boot@aribaud.net>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

This was taken from commit 1ea6b8f at:
git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 board/nvidia/dts/tegra2-seaboard.dts |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 board/nvidia/dts/tegra2-seaboard.dts

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
new file mode 100644
index 0000000..7d0869a
--- /dev/null
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -0,0 +1,32 @@
+/dts-v1/;
+
+/memreserve/ 0x1c000000 0x04000000;
+/include/ ARCH_CPU_DTS
+
+/ {
+	model = "NVIDIA Seaboard";
+	compatible = "nvidia,seaboard", "nvidia,tegra20";
+
+	chosen {
+		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = < 0x00000000 0x40000000 >;
+	};
+
+	serial@70006300 {
+		clock-frequency = < 216000000 >;
+	};
+
+	sdhci@c8000400 {
+		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
+		power-gpios = <&gpio 70 0>; /* gpio PI6 */
+	};
+
+	sdhci@c8000600 {
+		support-8bit;
+	};
+};
-- 
1.7.3.1
