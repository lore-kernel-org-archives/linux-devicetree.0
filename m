Return-Path: <SRS0=+6fA=MW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60816 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbeJJXRg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Oct 2018 19:17:36 -0400
From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Subject: [PATCH RFC v2 2/4] dt-bindings: introduce System PM domain bindings for Qualcomm SoCs
Date: Wed, 10 Oct 2018 21:24:37 +0530
Message-Id: <1539186879-10009-3-git-send-email-rplsssn@codeaurora.org>
In-Reply-To: <1539186879-10009-1-git-send-email-rplsssn@codeaurora.org>
References: <1539186879-10009-1-git-send-email-rplsssn@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
To: ilina@codearuroa.org
Cc: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add device binding documentation for Qualcomm Technology Inc's System PM
domain driver. The driver is used for managing system sleep activities
that are required when application processor is going to deepest low
power mode.

Cc: devicetree@vger.kernel.org
Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
---
 .../bindings/soc/qcom/system_pm_domain.txt         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
new file mode 100644
index 0000000..9f913c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
@@ -0,0 +1,38 @@
+Qualcomm Technologies system power domain
+-----------------------------------------
+
+System pm domain handles the tasks that need to be performed during application
+processor deeper low power mode entry for QCOM SoCs which have hardened IP blocks
+combinedly called as RPMH (Resource Power Manager Hardened) for shared resource
+management. Flushing the buffered requests to TCS (Triggered Command Set) in RSC
+(Resource State Coordinator) and programming the wakeup timer in PDC (Power
+Domain Controller) for timer based wakeup are handled as part of domain power
+down.
+
+The bindings for System PM domain is specified in the RSC section in devicetree.
+
+Properties:
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,system-pm-domain".
+
+- #power-domain-cells: number of cells in power domain specifier;
+    must be 0.
+
+Node of a device using power domains must have a power-domains property
+defined with a phandle to respective power domain.
+
+Example:
+
+	apps_rsc: rsc@179c0000 {
+		[...]
+		system_pd: system-power-domain {
+			compatible = "qcom,system-pm";
+            #power-domain-cells = <0>;
+		};
+	};
+
+
+See Documentation/devicetree/bindings/power/power_domain.txt for description
+of consumer-side bindings.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of the Code Aurora Forum, hosted by The Linux Foundation.
