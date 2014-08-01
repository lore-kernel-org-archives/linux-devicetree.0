From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/3] mfd: document DT bindings for Qualcomm SPMI PMICs
Date: Fri,  1 Aug 2014 17:30:49 +0300
Message-ID: <1406903450-27283-3-git-send-email-svarbanov@mm-sol.com>
References: <1406903450-27283-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406903450-27283-1-git-send-email-svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document DT bindings used to describe the Qualcomm SPMI PMICs.

Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
new file mode 100644
index 0000000..7182b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -0,0 +1,64 @@
+          Qualcomm SPMI PMICs multi-function device bindings
+
+The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
+PMICs.  These PMICs use a QPNP scheme through SPMI interface.
+QPNP is effectively a partitioning scheme for dividing the SPMI extended
+register space up into logical pieces, and set of fixed register
+locations/definitions within these regions, with some of these regions
+specifically used for interrupt handling.
+
+The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
+interfaced to the chip via the SPMI (System Power Management Interface) bus.
+Support for multiple independent functions are implemented by splitting the
+16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
+each. A function can consume one or more of these fixed-size register regions.
+
+Required properties:
+- compatible:      Should contain one of:
+                     "qcom,pm8941"
+                     "qcom,pm8841"
+                     "qcom,pma8084"
+                     or generalized "qcom,spmi-pmic".
+- reg:             Specifies the SPMI USID slave address for this device.
+                   For more information see:
+                   Documentation/devicetree/bindings/spmi/spmi.txt
+
+Required properties for peripheral child nodes:
+- compatible:      Should contain "qcom,xxx", where "xxx" is a peripheral name.
+
+Optional properties for peripheral child nodes:
+- interrupts:      Interrupts are specified as a 4-tuple. For more information
+                   see:
+                   Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+- interrupt-names: Corresponding interrupt name to the interrupts property
+
+Each child node of SPMI slave id represents a function of the PMIC. In the
+example below the rtc device node represents a peripheral of pm8941
+SID = 0. The regulator device node represents a peripheral of pm8941 SID = 1.
+
+Example:
+
+	spmi {
+		compatible = "qcom,spmi-pmic-arb";
+
+		pm8941@0 {
+			compatible = "qcom,pm8941", "qcom,spmi-pmic";
+			reg = <0x0 SPMI_USID>;
+
+			rtc {
+				compatible = "qcom,rtc";
+				interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "alarm";
+			};
+		};
+
+		pm8941@1 {
+			compatible = "qcom,pm8941", "qcom,spmi-pmic";
+			reg = <0x1 SPMI_USID>;
+
+			regulator {
+				compatible = "qcom,regulator";
+				regulator-name = "8941_boost";
+			};
+		};
+	};
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
