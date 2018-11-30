From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 3/7] ARM: dts: pxa2xx: fix hwuart memory range
Date: Fri, 30 Nov 2018 18:55:39 +0100
Message-ID: <20181130175543.32628-4-daniel@zonque.org>
References: <20181130175543.32628-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181130175543.32628-1-daniel@zonque.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The memory range for the hwuart is at 0x41600000, not 0x41100000.
This also solves a conflict with the MMC controller node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 7d3dfa8259f8..30e77ebbcc4d 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -117,9 +117,9 @@
 			status = "disabled";
 		};
 
-		hwuart: serial@41100000 {
+		hwuart: serial@41600000 {
 			compatible = "mrvl,pxa-uart";
-			reg = <0x41100000 0x30>;
+			reg = <0x41600000 0x30>;
 			interrupts = <7>;
 			status = "disabled";
 		};
-- 
2.19.2
