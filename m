From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [v4.0: PATCH 2/3] ARM: dts: k2e: fix the netcp range size
Date: Mon, 11 May 2015 14:05:29 -0400
Message-ID: <1431367530-4924-3-git-send-email-m-karicheri2@ti.com>
References: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ssantosh@kernel.org
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

k2e netcp range size is 16M (0x1000000) and not 0xffffff. This patch fixes
this. Similarly fix the size of switch module register space to 0x20000.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 arch/arm/boot/dts/k2e-netcp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-netcp.dtsi
index 4ab94c3..b13b3c9 100644
--- a/arch/arm/boot/dts/k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/k2e-netcp.dtsi
@@ -113,7 +113,7 @@ netcp: netcp@24000000 {
 	#size-cells = <1>;
 
 	/* NetCP address range */
-	ranges = <0 0x24000000 0xffffff>;
+	ranges = <0 0x24000000 0x1000000>;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
@@ -130,7 +130,7 @@ netcp: netcp@24000000 {
 		gbe@200000 { /* ETHSS */
 			label = "netcp-gbe";
 			compatible = "ti,netcp-gbe-9";
-			reg = <0x200000 0x900>, <0x220000 0x1ffff>;
+			reg = <0x200000 0x900>, <0x220000 0x20000>;
 			/* enable-ale; */
 			tx-queue = <896>;
 			tx-channel = "nettx";
-- 
1.9.1
