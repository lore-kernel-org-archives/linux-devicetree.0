From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: [PATCH v1 2/2] ARM: dts: qcom: Enable serial port on IFC6540 boards
Date: Tue, 26 Aug 2014 18:39:38 +0300
Message-ID: <1409067578-30272-3-git-send-email-gdjakov@mm-sol.com>
References: <1409067578-30272-1-git-send-email-gdjakov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409067578-30272-1-git-send-email-gdjakov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, iivanov@mm-sol.com, Georgi Djakov <gdjakov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Enable the serial port on the IFC6540 boards.

Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
---
 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts b/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
index 4603e91..e41cb8a 100644
--- a/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
+++ b/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
@@ -3,4 +3,10 @@
 / {
 	model = "Qualcomm APQ8084/IFC6540";
 	compatible = "qcom,apq8084-ifc6540", "qcom,apq8084";
+
+	soc {
+		serial@f995e000 {
+			status = "okay";
+		};
+	};
 };
-- 
1.7.9.5
