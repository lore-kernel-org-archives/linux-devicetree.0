From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/4] arm64: dts: models: use list instead of tuple for mmci
 interrupts
Date: Fri, 25 Jan 2019 17:56:04 +0000
Message-ID: <20190125175606.6607-2-sudeep.holla@arm.com>
References: <20190125175606.6607-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125175606.6607-1-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

RTSM/FVP vexpress motherboard model MMCI requires dedicated interrupts
for CMD and PIO, which obviously should be expressed as a list. Current
form uses tuple and it works fine since interrupt-cells equal to 1.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index b25f3cbd3da8..102e93744edc 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -86,7 +86,7 @@
 				mmci@50000 {
 					compatible = "arm,pl180", "arm,primecell";
 					reg = <0x050000 0x1000>;
-					interrupts = <9 10>;
+					interrupts = <9>, <10>;
 					cd-gpios = <&v2m_sysreg 0 0>;
 					wp-gpios = <&v2m_sysreg 1 0>;
 					max-frequency = <12000000>;
-- 
2.17.1
