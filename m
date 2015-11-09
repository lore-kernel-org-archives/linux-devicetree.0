From: Duc Dang <dhdang@apm.com>
Subject: [PATCH v3 3/3] arm64: dts: mailbox device tree node for APM X-Gene platform.
Date: Mon,  9 Nov 2015 10:05:45 -0800
Message-ID: <757aca862f350cb7afb1fcdad2ced644461c56dd.1447091626.git.dhdang@apm.com>
References: <cover.1447091625.git.dhdang@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1447091625.git.dhdang@apm.com>
In-Reply-To: <cover.1447091625.git.dhdang@apm.com>
References: <1429863912.2927.43.camel@x220> <cover.1447091625.git.dhdang@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>, Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Mailbox device tree node for APM X-Gene platform.

[dhdang: rebase over 4.3-rc5]
Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Duc Dang <dhdang@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index d831bc2..b36e555 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -604,6 +604,20 @@
 			msi-parent = <&msi>;
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
