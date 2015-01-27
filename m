From: Pranavkumar Sawargaonkar <psawargaonkar@apm.com>
Subject: [PATCH] arm64: dts: Fix GIC reg sizes for APM X-Gene
Date: Tue, 27 Jan 2015 12:33:26 +0530
Message-ID: <1422342206-4750-1-git-send-email-psawargaonkar@apm.com>
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
To: devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>, arnd@arndb.de, marc.zyngier@arm.com, jcm@redhat.com, patches@apm.com, kvmarm@lists.cs.columbia.edu, christoffer.dall@linaro.org, Tushar Jagad <tjagad@apm.com>, Pranavkumar Sawargaonkar <psawargaonkar@apm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In APM X-Gene, GIC register space is 64K aligned while the sizes mentioned
in the dt are 4K aligned. This breaks KVM when kernel is built with 64K page
size due to size alignment checking in vgic driver for VCPU Control and
VCPU register.

This patch corrects the sizes to be inline with the hardware spec.

CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.cs.columbia.edu
CC: arnd@arndb.de
CC: marc.zyngier@arm.com
CC: christoffer.dall@linaro.org
CC: jcm@redhat.com
Signed-off-by: Pranavkumar Sawargaonkar <psawargaonkar@apm.com>
Signed-off-by: Tushar Jagad <tjagad@apm.com>
Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index f1ad9c2..65f0e6d 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -81,10 +81,10 @@
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		reg = <0x0 0x78010000 0x0 0x1000>,	/* GIC Dist */
-		      <0x0 0x78020000 0x0 0x1000>,	/* GIC CPU */
-		      <0x0 0x78040000 0x0 0x2000>,	/* GIC VCPU Control */
-		      <0x0 0x78060000 0x0 0x2000>;	/* GIC VCPU */
+		reg = <0x0 0x78010000 0x0 0x10000>,	/* GIC Dist */
+		      <0x0 0x78020000 0x0 0x20000>,	/* GIC CPU */
+		      <0x0 0x78040000 0x0 0x10000>,	/* GIC VCPU Control */
+		      <0x0 0x78060000 0x0 0x20000>;	/* GIC VCPU */
 		interrupts = <1 9 0xf04>;	/* GIC Maintenence IRQ */
 	};

--
1.7.9.5
