Return-Path: <linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org>
From: Feng Kan <fkan@apm.com>
Subject: [PATCH 3/3] arm64: dts: mailbox device tree node for APM X-Gene
 platform.
Date: Tue, 17 Feb 2015 15:40:48 -0800
Message-Id: <1424216448-28665-3-git-send-email-fkan@apm.com>
In-Reply-To: <1424216448-28665-1-git-send-email-fkan@apm.com>
References: <1424216448-28665-1-git-send-email-fkan@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+robherring2=gmail.com@lists.infradead.org
To: patches@apm.com, jassisinghbrar@gmail.com, =devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-ID: <devicetree@vger.kernel.org>

Mailbox device tree node for APM X-Gene platform.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index f1ad9c2..27d6c3d 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -469,6 +469,20 @@
 			clocks = <&pcie4clk 0>;
 		};
 
+		mailbox: slimpro-mbox@10540000 {
+			compatible = "apm,xgene-slimpro-mbox";
+			reg = <0x0 0x10540000 0x0 0xa000>;
+			#mbox-cells = <1>;
+			interrupts =    <0x0 0x0 0x4>,
+					<0x0 0x1 0x4>,
+					<0x0 0x2 0x4>,
+					<0x0 0x3 0x4>,
+					<0x0 0x4 0x4>,
+					<0x0 0x5 0x4>,
+					<0x0 0x6 0x4>,
+					<0x0 0x7 0x4>;
+		};
+
 		serial0: serial@1c020000 {
 			status = "disabled";
 			device_type = "serial";
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
