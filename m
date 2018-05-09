From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: dts: vexpress: Replace '_' with '-' in node names
Date: Wed,  9 May 2018 17:48:02 +0100
Message-ID: <1525884482-19855-1-git-send-email-sudeep.holla@arm.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

The latest DTC throws warnings for character '_' in the node names.

Warning (node_name_chars_strict): /sysreg@10000/sys_led: Character '_' not recommended in node name
Warning (node_name_chars_strict): /sysreg@10000/sys_mci: Character '_' not recommended in node name
Warning (node_name_chars_strict): /sysreg@10000/sys_flash: Character '_' not recommended in node name

The general recommendation is to use character '-' for all the node names.
This patch fixes the warnings following the recommendation.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index 7b8ff5b3b912..58e73131ecef 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -77,19 +77,19 @@
 					compatible = "arm,vexpress-sysreg";
 					reg = <0x010000 0x1000>;
 
-					v2m_led_gpios: sys_led {
+					v2m_led_gpios: sys-led {
 						compatible = "arm,vexpress-sysreg,sys_led";
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
 
-					v2m_mmc_gpios: sys_mci {
+					v2m_mmc_gpios: sys-mci {
 						compatible = "arm,vexpress-sysreg,sys_mci";
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
 
-					v2m_flash_gpios: sys_flash {
+					v2m_flash_gpios: sys-flash {
 						compatible = "arm,vexpress-sysreg,sys_flash";
 						gpio-controller;
 						#gpio-cells = <2>;
-- 
2.7.4
