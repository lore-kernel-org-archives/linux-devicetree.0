From: Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH v2 2/4] dt-bindings: qcom: Document bindings for new MSM8916 devices
Date: Mon, 22 Jul 2019 11:22:09 +0200
Message-ID: <20190722092211.100586-3-stephan@gerhold.net>
References: <20190722092211.100586-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722092211.100586-1-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

Document the new samsung,a3u/a5u-eur and longcheer,l8150
device tree bindings used in their device trees.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 54ef6b6b9189..e39d8f02e33c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -45,6 +45,7 @@ description: |
   	mtp
   	sbc
   	hk01
+  	qrd
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
@@ -115,6 +116,13 @@ properties:
           - const: qcom,msm8916-mtp
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - longcheer,l8150
+              - samsung,a3u-eur
+              - samsung,a5u-eur
+          - const: qcom,msm8916
+
       - items:
           - const: qcom,msm8996-mtp
 
-- 
2.22.0
