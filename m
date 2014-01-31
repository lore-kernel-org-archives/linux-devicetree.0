From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: k2hk-evm: rename clock node to clocks
Date: Fri, 31 Jan 2014 15:31:06 +0200
Message-ID: <1391175066-13862-1-git-send-email-grygorii.strashko@ti.com>
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
To: santosh.shilimkar@ti.com, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
Cc: ivan.khoronzhuk@ti.com, Grygorii Strashko <grygorii.strashko@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix type in clock(s) node name: "clock"-->"clocks".

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/k2hk-evm.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index eaefdfe..c02c3a8 100644
--- a/arch/arm/boot/dts/k2hk-evm.dts
+++ b/arch/arm/boot/dts/k2hk-evm.dts
@@ -15,7 +15,7 @@
 	compatible =  "ti,keystone-evm";
 
 	soc {
-		clock {
+		clocks {
 			refclksys: refclksys {
 				#clock-cells = <0>;
 				compatible = "fixed-clock";
-- 
1.7.9.5
