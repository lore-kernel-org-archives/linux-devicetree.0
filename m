From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [RFC PATCH v2 4/5] dt: msm8974: add qpnp rtc device node
Date: Thu,  3 Jul 2014 16:14:02 +0300
Message-ID: <1404393243-7324-5-git-send-email-svarbanov@mm-sol.com>
References: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Add QPNP RTC device tree node. The RTC device resides into pm8941
and is attached on usid0.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 9166b8e..f6fe27b 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -3,6 +3,7 @@
 #include "skeleton.dtsi"
 
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
 / {
@@ -258,6 +259,13 @@
 				reg = <0x0 SPMI_USID>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				pm8941_rtc@6000 {
+					compatible = "qcom,qpnp-rtc";
+					reg = <0x6000 0x6100>;
+					reg-names = "rtc", "alarm";
+					interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+				};
 			};
 
 			usid1: pm8941@1 {
-- 
1.7.0.4
