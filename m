From: Duc Dang <dhdang@apm.com>
Subject: [PATCH v4 3/3] arm64: dts: mailbox device tree node for APM X-Gene platform.
Date: Fri, 15 Jan 2016 18:57:19 -0800
Message-ID: <54c827fc1e65689569232eb319ad17a0725c2411.1452912126.git.dhdang@apm.com>
References: <cover.1452912126.git.dhdang@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1452912126.git.dhdang@apm.com>
In-Reply-To: <cover.1452912126.git.dhdang@apm.com>
References: <CABb+yY2zHycEmsVvp8OFwpJ1PZgrEPpV-oOe56wgFJ=EE0nTcg@mail.gmail.com> <cover.1452912126.git.dhdang@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com, Duc Dang <dhdang@apm.com>, Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Mailbox device tree node for APM X-Gene platform.

Signed-off-by: Feng Kan <fkan@apm.com>
Signed-off-by: Duc Dang <dhdang@apm.com>
---
Changes since v3:
        - Rebase over v4.4

 arch/arm64/boot/dts/apm/apm-storm.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 6c5ed11..42f3fa0 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -642,6 +642,20 @@
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
