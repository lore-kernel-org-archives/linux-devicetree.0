From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v2] ARM: keystone: dts: drop "msmcsram" clock node
Date: Thu, 30 Jan 2014 20:10:00 +0200
Message-ID: <1391105400-31602-1-git-send-email-ivan.khoronzhuk@ti.com>
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
To: robh+dt@kernel.org, galak@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, santosh.shilimkar@ti.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

At late init all unused clocks are disabled. So clocks that were not
get before will be gated. In Keysone 2 SoC we have at least one
necessary clock that is not used by any driver - "msmcsram". This
clock is necessary, because it supplies the Multicore Shared Memory
Controller (MSMC). MSMC is the coherency interconnect and all the
coherent masters are connected to it including devices which are not
under Linux OS control. MSMC clock should not be touched even in low
power states.

So drop the clock node, otherwise 'clk_ignore_unused' parameter will
disable the clock leading to system stall.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
Based on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

v1..v2:
- dropped "msmcsram" clock node, instead disabling
- updated comment message

 arch/arm/boot/dts/keystone-clocks.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi b/arch/arm/boot/dts/keystone-clocks.dtsi
index 2363593..98ad488 100644
--- a/arch/arm/boot/dts/keystone-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-clocks.dtsi
@@ -327,16 +327,6 @@ clocks {
 		domain-id = <6>;
 	};
 
-	clkmsmcsram: clkmsmcsram {
-		#clock-cells = <0>;
-		compatible = "ti,keystone,psc-clock";
-		clocks = <&chipclk1>;
-		clock-output-names = "msmcsram";
-		reg = <0x02350038 0xb00>, <0x0235001c 0x400>;
-		reg-names = "control", "domain";
-		domain-id = <7>;
-	};
-
 	clkgem0: clkgem0 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
-- 
1.8.3.2
