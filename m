From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH net-next v1 2/3] dtb: xgene: Add interrupt for Tx completion
Date: Wed, 25 Mar 2015 12:19:11 -0700
Message-ID: <1427311152-30333-3-git-send-email-isubramanian@apm.com>
References: <1427311152-30333-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1427311152-30333-1-git-send-email-isubramanian@apm.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kchudgar@apm.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Iyappan Subramanian <isubramanian@apm.com>
Signed-off-by: Keyur Chudgar <kchudgar@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index c1eb691..e74f6e0 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -638,7 +638,8 @@
 			      <0x0 0x1f200000 0x0 0Xc300>,
 			      <0x0 0x1B000000 0x0 0X200>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0xA0 0x4>;
+			interrupts = <0x0 0xA0 0x4>,
+				     <0x0 0xA1 0x4>;
 			dma-coherent;
 			clocks = <&sge0clk 0>;
 			local-mac-address = [00 00 00 00 00 00];
@@ -652,7 +653,8 @@
 			      <0x0 0x1f200000 0x0 0Xc300>,
 			      <0x0 0x1B000000 0x0 0X8000>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0xAC 0x4>;
+			interrupts = <0x0 0xAC 0x4>,
+				     <0x0 0xAD 0x4>;
 			port-id = <1>;
 			dma-coherent;
 			clocks = <&sge1clk 0>;
@@ -667,7 +669,8 @@
 			      <0x0 0x1f600000 0x0 0Xc300>,
 			      <0x0 0x18000000 0x0 0X200>;
 			reg-names = "enet_csr", "ring_csr", "ring_cmd";
-			interrupts = <0x0 0x60 0x4>;
+			interrupts = <0x0 0x60 0x4>,
+				     <0x0 0x61 0x4>;
 			dma-coherent;
 			clocks = <&xge0clk 0>;
 			/* mac address will be overwritten by the bootloader */
-- 
1.9.1
