From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 07/10] ARM: dts: apq8064: Add USB OTG support for CM QS-600
Date: Thu,  9 Apr 2015 09:23:32 +0100
Message-ID: <1428567812-11019-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: bjorn.andersson@sonymobile.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

This patch adds USB OTG support on USB1 for Compulab QS-600 Board.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 220ff19..06307b9 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -40,6 +40,11 @@
 			};
 		};
 
+		/* OTG */
+		usb1_phy:phy@12500000 {
+			status = "ok";
+		};
+
 		usb3_phy:phy@12520000 {
 			status = "ok";
 		};
@@ -48,6 +53,15 @@
 			status = "ok";
 		};
 
+		gadget1:gadget@12500000 {
+			status = "ok";
+		};
+
+		/* OTG */
+		usb1: usb@12500000 {
+			status = "ok";
+		};
+
 		usb3: usb@12520000 {
 			status = "ok";
 		};
-- 
1.9.1
