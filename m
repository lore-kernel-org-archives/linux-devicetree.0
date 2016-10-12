From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [RFC V3 PATCH 3/7] dt-bindings: qcom: Add msm899(2/4) bindings
Date: Wed, 12 Oct 2016 02:37:30 -0700
Message-ID: <1476265054-22511-4-git-send-email-jeremymc@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol@redhat.com>

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 3e24518..7cab94b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -21,6 +21,9 @@ The 'SoC' element must be one of the following strings:
 	apq8096
 	msm8916
 	msm8974
+	msm8992
+	msm8994
+	msm8994v2
 	msm8996
 
 The 'board' element must be one of the following strings:
-- 
2.6.1
