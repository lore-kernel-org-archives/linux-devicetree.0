From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH 2/2] ARM: qcom: enable uart output by default on AP148
Date: Tue, 18 Aug 2015 15:05:38 -0700
Message-ID: <1439935538-13932-3-git-send-email-mathieu@codeaurora.org>
References: <1439935538-13932-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439935538-13932-1-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, agross@codeaurora.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This change adds a new chosen node to boot using UART console on AP148

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 55b2910..b08907a 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -14,6 +14,14 @@
 		};
 	};
 
+	alias {
+		serial0 = &uart4;
+	};
+
+	chosen {
+		linux,stdout-path = "serial0:115200n8";
+	};
+
 	soc {
 		pinmux@800000 {
 			i2c4_pins: i2c4_pinmux {
-- 
2.1.4
