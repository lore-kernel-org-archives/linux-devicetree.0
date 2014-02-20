From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH RESEND] ARM: dts: qcom-msm8960-cdp: Add RNG device tree node
Date: Thu, 20 Feb 2014 18:49:02 +0200
Message-ID: <1392914942-23191-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Brown <davidb@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Add the necessary DT node to probe the rng driver on
msm8960-cdp platform.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
Tested-by: Stephen Boyd <sboyd@codeaurora.org>
---
 arch/arm/boot/dts/qcom-msm8960-cdp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index 7c30de4fa302..8fda9c90ba97 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -67,4 +67,11 @@
 		reg = <0x500000 0x1000>;
 		qcom,controller-type = "pmic-arbiter";
 	};
+
+	rng@1a500000 {
+		compatible = "qcom,prng";
+		reg = <0x1a500000 0x200>;
+		clocks = <&gcc PRNG_CLK>;
+		clock-names = "core";
+	};
 };
-- 
1.8.4.4
