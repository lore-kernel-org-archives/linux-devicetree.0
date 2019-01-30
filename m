From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH] ARM: dts: aspeed: tiogapass: Enable VUART
Date: Wed, 30 Jan 2019 10:14:26 -0800
Message-ID: <20190130181427.2469674-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: vijaykhemka@fb.com, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Enabling vuart for Facebook tiogapass

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 42e0d7a8e8d0..a058fb2985f7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -64,6 +64,11 @@
 	status = "okay";
 };
 
+&vuart {
+	// VUART Host Console
+	status = "okay";
+};
+
 &uart1 {
 	// Host Console
 	status = "okay";
-- 
2.17.1
