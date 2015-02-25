From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH 2/2] ARM: dts: qcom: add stdout-path to AP148
Date: Tue, 24 Feb 2015 16:21:56 -0800
Message-ID: <1424823716-7504-2-git-send-email-mathieu@codeaurora.org>
References: <1424823716-7504-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424823716-7504-1-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, mathieu@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mmcclint@codeaurora.org
List-Id: devicetree@vger.kernel.org

AP148 default console output is uart4, so this change adds a serial0
alias to it, as well add the corresponding stdout-path.

This will avoid having to set these as chosen.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 55b2910..208bb79 100644
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
+		stdout-path = "serial0:115200n8";
+	};
+
 	soc {
 		pinmux@800000 {
 			i2c4_pins: i2c4_pinmux {
-- 
1.9.1
