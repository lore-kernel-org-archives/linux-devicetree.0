From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven segment display on zaius
Date: Tue, 13 Dec 2016 23:55:04 -0800
Message-ID: <1481702104-8617-5-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

Add clock, data and clear signal GPIO lines to control seven segment display on
zaius platform.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 8ef4ece..ccb8147 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -43,6 +43,14 @@
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = "1000";
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &fmc {
--
2.8.0.rc3.226.g39d4020
