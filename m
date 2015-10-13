From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: [PATCH] ARM: dts: msm8974: fix typo in "disabled" property
Date: Tue, 13 Oct 2015 14:02:00 +0200
Message-ID: <1444737720-20164-1-git-send-email-michael.opdenacker@free-electrons.com>
References: <561CF1B3.2010405@free-electrons.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <561CF1B3.2010405@free-electrons.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, agross@codeaurora.org, davidb@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Michael Opdenacker <michael.opdenacker@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Replace "disable" by "disabled" in the Qualcomm MSM8974 dtsi

Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index ab8e57250468..8c87203b6429 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -308,7 +308,7 @@
 		};
 
 		blsp_i2c11: i2c@f9967000 {
-			status = "disable";
+			status = "disabled";
 			compatible = "qcom,i2c-qup-v2.1.1";
 			reg = <0xf9967000 0x1000>;
 			interrupts = <0 105 IRQ_TYPE_NONE>;
-- 
2.1.4
