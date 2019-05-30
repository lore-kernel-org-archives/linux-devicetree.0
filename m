From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] arm: dts: vexpress-v2p-ca15_a7: disable NOR flash node by
 default
Date: Thu, 30 May 2019 10:11:39 +0100
Message-ID: <20190530091139.11643-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Accessing the NOR flash memory from the kernel will disrupt CPU sleep/
idles states and CPU hotplugging. We need to disable this DT node by
default. Setups that want to access the flash can modify this entry to
enable the flash again but also ensuring to disable CPU idle states and
CPU hotplug.

The platform firmware assumes the flash is always in read mode while
Linux kernel driver leaves NOR flash in "read id" mode after
initialization. If it gets used actively, it can be in some other state.

So far we had not seen this issue as the NOR flash drivers in kernel
were not enabled by default. However it was enable in multi_v7 config by
Commit 5f068190cc10 ("ARM: multi_v7_defconfig: Enable support for CFI NOR FLASH")

So, let's mark the NOR flash disabled so that the platform can boot
again. This based on:
Commit 980bbff018f6 ("ARM64: juno: disable NOR flash node by default")

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi    | 2 +-
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index d3963e9eaf48..1b5bc536c547 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -30,7 +30,7 @@
 			#interrupt-cells = <1>;
 			ranges;
 
-			flash@0,00000000 {
+			nor_flash: flash@0,00000000 {
 				compatible = "arm,vexpress-flash", "cfi-flash";
 				reg = <0 0x00000000 0x04000000>,
 				      <4 0x00000000 0x04000000>;
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
index 164c904c9992..1de0a658adf1 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
@@ -680,3 +680,12 @@
 				<0 3 &gic 0 39 4>;
 	};
 };
+
+&nor_flash {
+	/*
+	 * Unfortunately, accessing the flash disturbs the CPU idle states
+	 * (suspend) and CPU hotplug of this platform. For this reason, flash
+	 * hardware access is disabled by default on this platform alone.
+	 */
+	status = "disabled";
+};
-- 
2.17.1
