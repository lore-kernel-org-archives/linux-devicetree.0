From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH RESEND] DTS: CI20: Fix bugs in ci20's device tree.
Date: Fri, 25 Jan 2019 17:19:22 +0800
Message-ID: <1548407962-6484-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, mark.rutland@arm.com, malat@debian.org, ezequiel@collabora.co.uk, ulf.hansson@linaro.org, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

According to the Schematic, the hardware of ci20 leads to uart3,
but not to uart2. Uart2 is miswritten in the original code.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 50cff3c..4f7b1fa 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -76,7 +76,7 @@
 	status = "okay";
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&pins_uart2>;
+	pinctrl-0 = <&pins_uart3>;
 };
 
 &uart4 {
@@ -196,9 +196,9 @@
 		bias-disable;
 	};
 
-	pins_uart2: uart2 {
-		function = "uart2";
-		groups = "uart2-data", "uart2-hwflow";
+	pins_uart3: uart3 {
+		function = "uart3";
+		groups = "uart3-data", "uart3-hwflow";
 		bias-disable;
 	};
 
-- 
2.7.4
