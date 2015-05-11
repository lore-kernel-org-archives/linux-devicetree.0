From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [v4.0: PATCH 3/3] ARM: dts: k2l: fix the netcp range size
Date: Mon, 11 May 2015 14:05:30 -0400
Message-ID: <1431367530-4924-4-git-send-email-m-karicheri2@ti.com>
References: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ssantosh@kernel.org
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

k2l netcp range size is 16M (0x1000000) and not 0xffffff. This patch fixes
this. Similarly fix the size of switch module register space to 0x20000.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 arch/arm/boot/dts/k2l-netcp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/k2l-netcp.dtsi b/arch/arm/boot/dts/k2l-netcp.dtsi
index a97aeee..6b95284 100644
--- a/arch/arm/boot/dts/k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/k2l-netcp.dtsi
@@ -112,7 +112,7 @@ netcp: netcp@26000000 {
 	#size-cells = <1>;
 
 	/* NetCP address range */
-	ranges = <0 0x26000000 0xffffff>;
+	ranges = <0 0x26000000 0x1000000>;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
@@ -129,7 +129,7 @@ netcp: netcp@26000000 {
 		gbe@200000 { /* ETHSS */
 			label = "netcp-gbe";
 			compatible = "ti,netcp-gbe-5";
-			reg = <0x200000 0x900>, <0x220000 0x1ffff>;
+			reg = <0x200000 0x900>, <0x220000 0x20000>;
 			/* enable-ale; */
 			tx-queue = <896>;
 			tx-channel = "nettx";
-- 
1.9.1
