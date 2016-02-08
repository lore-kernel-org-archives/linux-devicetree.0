From: Duc Dang <dhdang@apm.com>
Subject: [PATCH v5 3/3] arm64: dts: mailbox device tree node for APM X-Gene platform.
Date: Mon,  8 Feb 2016 14:04:09 -0800
Message-ID: <013f892a5bd86386dd379adc4870496dde8eb2a2.1454967957.git.dhdang@apm.com>
References: <cover.1454967957.git.dhdang@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454967957.git.dhdang@apm.com>
In-Reply-To: <cover.1454967957.git.dhdang@apm.com>
References: <CABb+yY1cE152ZdfK_aeB8ufG=WfoUVB6BN8kXPphYgMBnpH-GA@mail.gmail.com> <cover.1454967957.git.dhdang@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>, Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Mailbox device tree node for APM X-Gene platform.

Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Duc Dang <dhdang@apm.com>
---
Changes since v4:
        - Rebase over v4.5-rc1
        - Change node name to mailbox@10540000

Changes since v3:
        - Rebase over v4.4

 arch/arm64/boot/dts/apm/apm-storm.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index fe30f76..d91338a 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -691,6 +691,20 @@
 			msi-parent = <&msi>;
 		};
 
+		mailbox: mailbox@10540000 {
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
