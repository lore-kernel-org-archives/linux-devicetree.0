From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: Add peci and lpc for Facebook
Date: Wed, 23 Jan 2019 15:07:32 -0800
Message-ID: <20190123230733.1821501-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: vijaykhemka@fb.com, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Added lpc control for enabling lpc clock, peci for cpu sensors and lpc
snoop devices to Facebook Tiogapass device tree.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 73e58a821613..d60dbb019f82 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -54,6 +54,16 @@
 	};
 };
 
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&lpc_ctrl {
+	// Enable lpc clock
+	status = "okay";
+};
+
 &uart1 {
 	// Host Console
 	status = "okay";
@@ -67,6 +77,10 @@
 	status = "okay";
 };
 
+&peci0 {
+	status = "okay";
+};
+
 &kcs2 {
 	// BMC KCS channel 2
 	status = "okay";
-- 
2.17.1
