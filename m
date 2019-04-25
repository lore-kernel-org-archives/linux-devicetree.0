From: Patrick Venture <venture@google.com>
Subject: [PATCH 2/2] ARM: dts: aspeed: quanta-q71: Enable p2a node
Date: Thu, 25 Apr 2019 12:49:03 -0700
Message-ID: <20190425194903.144569-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: venture@google.com, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, arm@kernel.org
List-Id: devicetree@vger.kernel.org

Enable the aspeed-p2a-ctrl node and configure with memory-region to
enable mmap access.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 0d7c6339da465..a68ff0675c28a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -112,6 +112,11 @@
 			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
 };
 
+&p2a {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
+
 &ibt {
 	status = "okay";
 };
-- 
2.21.0.593.g511ec345e18-goog
