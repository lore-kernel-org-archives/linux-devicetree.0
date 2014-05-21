From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: [PATCH v1 2/4] ARM: dts: qcom: Add APQ8084-MTP board support
Date: Wed, 21 May 2014 17:57:03 +0300
Message-ID: <1400684225-21381-3-git-send-email-gdjakov@mm-sol.com>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Georgi Djakov <gdjakov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Add device-tree file for APQ8084-MTP board, which belongs
to the Snapdragon 805 family.

Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
---
 arch/arm/boot/dts/Makefile             |    3 ++-
 arch/arm/boot/dts/qcom-apq8084-mtp.dts |    6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8084-mtp.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 377b7c3..792f063 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -293,7 +293,8 @@ dtb-$(CONFIG_ARCH_ORION5X) += orion5x-lacie-ethernet-disk-mini-v2.dtb
 dtb-$(CONFIG_ARCH_PRIMA2) += prima2-evb.dtb
 dtb-$(CONFIG_ARCH_QCOM) += qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
-	qcom-apq8074-dragonboard.dtb
+	qcom-apq8074-dragonboard.dtb \
+	qcom-apq8084-mtp.dtb
 dtb-$(CONFIG_ARCH_S3C24XX) += s3c2416-smdk2416.dtb
 dtb-$(CONFIG_ARCH_S3C64XX) += s3c6410-mini6410.dtb \
 	s3c6410-smdk6410.dtb
diff --git a/arch/arm/boot/dts/qcom-apq8084-mtp.dts b/arch/arm/boot/dts/qcom-apq8084-mtp.dts
new file mode 100644
index 0000000..9dae387
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8084-mtp.dts
@@ -0,0 +1,6 @@
+#include "qcom-apq8084.dtsi"
+
+/ {
+	model = "Qualcomm APQ 8084-MTP";
+	compatible = "qcom,apq8084-mtp", "qcom,apq8084";
+};
-- 
1.7.9.5
