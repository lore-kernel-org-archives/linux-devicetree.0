From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 5/6] ARM: dts: qs600: add alias to serial0
Date: Tue, 18 Aug 2015 14:10:27 +0100
Message-ID: <1439903427-20317-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch add alias node with serial0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 06b3a70..c095849 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -6,6 +6,10 @@
 	model = "CompuLab CM-QS600";
 	compatible = "qcom,apq8064-cm-qs600", "qcom,apq8064";
 
+	aliases {
+		serial0 = &gsbi7_serial;
+	};
+
 	pwrseq {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1
