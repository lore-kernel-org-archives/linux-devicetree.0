From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: soc: qcom: Support GLINK intents
Date: Wed, 18 Oct 2017 18:10:16 -0700
Message-ID: <1508375418-15611-2-git-send-email-clew@codeaurora.org>
References: <1508375418-15611-1-git-send-email-clew@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508375418-15611-1-git-send-email-clew@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, smaliyap@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-Id: devicetree@vger.kernel.org

Virtual GLINK channels may know what throughput to expect from a
remoteproc. An intent advertises to the remoteproc this channel is
ready to receive data. Allow a channel to define the size and amount of
intents to be prequeued.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index b277eca861f7..6c21f76822ca 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -39,6 +39,14 @@ of these nodes are defined by the individual bindings for the specific function
 	Definition: a list of channels tied to this function, used for matching
 		    the function to a set of virtual channels
 
+- intents:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: a list of size,amount pairs describing what intents should
+		    be preallocated for this virtual channel. If a GLINK node
+		    supports intents, an intent advertises this channel is ready
+		    to receive data.
+
 = EXAMPLE
 The following example represents the GLINK RPM node on a MSM8996 device, with
 the function for the "rpm_request" channel defined, which is used for
@@ -69,6 +77,8 @@ regualtors and root clocks.
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
+			intents = <0x400 5
+				   0x800 1>;
 			...
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
