From: Vinayak Kale <vkale@apm.com>
Subject: [PATCH 2/2] arm64: dts: Add PMU node for APM X-Gene Storm SOC
Date: Thu, 20 Mar 2014 15:17:27 +0530
Message-ID: <1395308847-16317-3-git-send-email-vkale@apm.com>
References: <1395308847-16317-1-git-send-email-vkale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395308847-16317-1-git-send-email-vkale@apm.com>
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
Cc: Catalin.Marinas@arm.com, patches@apm.com, Vinayak Kale <vkale@apm.com>, will.deacon@arm.com, jcm@redhat.com
List-Id: devicetree@vger.kernel.org

This patch adds the PMU device tree node for APM X-Gene Storm SOC.

Please note that this patch has dependancy on a GIC driver patch [1] which is
yet to be approved by maintainers.

[1]- https://lkml.org/lkml/2014/2/27/605
(irqchip:gic: change access of gicc_ctrl register to read modify write)

Signed-off-by: Vinayak Kale <vkale@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index d37d736..5edb16a 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -97,6 +97,11 @@
 		clock-frequency = <50000000>;
 	};
 
+	pmu {
+		compatible = "apm,potenza-pmu", "arm,armv8-pmuv3";
+		interrupts = <1 12 0xff04>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.7.9.5
