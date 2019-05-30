From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: dts: vexpress: set the right partition type for NOR flash
Date: Thu, 30 May 2019 10:11:56 +0100
Message-ID: <20190530091156.11693-1-sudeep.holla@arm.com>
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

We should set up the partitions in the right way so we will find out
what is in the flash.

The ARM Firmware Suite now has its own compatible and proper device
tree bindings to trigger discovery of the flash contents, and Linux
supports handling the new type of AFS partitions.

Based on commit 7f8e78ca90e2 ("arm64: dts: juno: set the right partition
type for NOR flash")

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 3 +++
 arch/arm/boot/dts/vexpress-v2m.dtsi     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index 1b5bc536c547..d6a1fc269241 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -35,6 +35,9 @@
 				reg = <0 0x00000000 0x04000000>,
 				      <4 0x00000000 0x04000000>;
 				bank-width = <4>;
+				partitions {
+					compatible = "arm,arm-firmware-suite";
+				};
 			};
 
 			psram@1,00000000 {
diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpress-v2m.dtsi
index 798c97aff7fa..8e57e15307e2 100644
--- a/arch/arm/boot/dts/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
@@ -35,6 +35,9 @@
 				reg = <0 0x00000000 0x04000000>,
 				      <1 0x00000000 0x04000000>;
 				bank-width = <4>;
+				partitions {
+					compatible = "arm,arm-firmware-suite";
+				};
 			};
 
 			psram@2,00000000 {
-- 
2.17.1
