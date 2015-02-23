From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 07/12] ARM: DT: apq8064: Add usb host support to CM QS-600
Date: Mon, 23 Feb 2015 07:55:44 +0000
Message-ID: <1424678144-13224-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

This patch adds device tree nodes to support two usb hosts on Compulab QS600 board.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 6e62f24..af2e075 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -41,6 +41,22 @@
 			};
 		};
 
+		usb3_phy:phy@12520000 {
+			status = "ok";
+		};
+		
+		usb4_phy:phy@12530000 {
+			status = "ok";
+		};
+		
+		usb3: usb@12520000 {
+			status = "ok";
+		};
+		
+		usb4: usb@12530000 {
+			status = "ok";
+		};
+
 		/* on board fixed 3.3v supply */
 		v3p3_pcieclk: v3p3-pcieclk {
 			compatible = "regulator-fixed";
-- 
1.9.1
