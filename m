From: Sylvain Rochet <sylvain.rochet@finsecur.com>
Subject: [PATCH] AT91: DT: Watchdog, remove property idle halt by default
Date: Sat, 17 Jan 2015 22:49:56 +0100
Message-ID: <1421531396-20188-1-git-send-email-sylvain.rochet@finsecur.com>
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
To: Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, boris.brezillon@free-electrons.com, voice.shen@atmel.com, alexandre.belloni@free-electrons.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sylvain Rochet <sylvain.rochet@finsecur.com>
List-Id: devicetree@vger.kernel.org

The behavior changed when watchdog properties were added to DT, it makes
the watchdog not counting when CPU is in idle state, therefore the
watchdog reset time depend on mean CPU usage and will not reset at all
if the CPU stop working while it is in idle state, which is a very weird
behavior.

Apply principle of least surprise on at91sam9260-wdt by removing idle
halt flag by default.

Signed-off-by: Sylvain Rochet <sylvain.rochet@finsecur.com>
---
 arch/arm/boot/dts/at91sam9x5.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index bbb3ba6..ce61f91 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -1125,7 +1125,6 @@
 				atmel,watchdog-type = "hardware";
 				atmel,reset-type = "all";
 				atmel,dbg-halt;
-				atmel,idle-halt;
 				status = "disabled";
 			};
 
-- 
2.1.4
