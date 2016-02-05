From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 4/5] ARM: dts: NSP: Add SP805 Support to DT
Date: Fri,  5 Feb 2016 17:43:23 -0500
Message-ID: <1454712204-30419-5-git-send-email-jonmason@broadcom.com>
References: <1454712204-30419-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454712204-30419-1-git-send-email-jonmason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for the ARM SP805 Watchdog timer to the Northstar Plus
device tree.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 415a0a6..0e8cb6e 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -203,6 +203,14 @@
 			clock-frequency = <100000>;
 		};
 
+		wdt@39000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x39000 0x1000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>, <&iprocslow>;
+			clock-names = "wdogclk", "apb_pclk";
+		};
+
 		lcpll0: lcpll0@3f100 {
 			#clock-cells = <1>;
 			compatible = "brcm,nsp-lcpll0";
-- 
1.9.1
