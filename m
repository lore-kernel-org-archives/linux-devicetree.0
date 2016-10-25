From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [PATCH 4/6] dt-bindings: qcom: Add msm899(2/4) bindings
Date: Tue, 25 Oct 2016 04:16:59 -0700
Message-ID: <1477394221-30963-5-git-send-email-jeremymc@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol@redhat.com>

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 3e24518..eb4057e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -21,6 +21,8 @@ The 'SoC' element must be one of the following strings:
 	apq8096
 	msm8916
 	msm8974
+	msm8992
+	msm8994
 	msm8996
 
 The 'board' element must be one of the following strings:
-- 
2.6.1
