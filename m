From: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: Support GLINK intents
Date: Thu, 26 Oct 2017 15:28:54 -0700
Message-ID: <1509056936-26578-2-git-send-email-clew@codeaurora.org>
References: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509056936-26578-1-git-send-email-clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, smaliyap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Virtual GLINK channels may know what throughput to expect from a
remoteproc. An intent advertises to the remoteproc this channel is
ready to receive data. Allow a channel to define the size and amount of
intents to be prequeued.

Signed-off-by: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

Changes since v1:
- Change intents property to qcom,intents and update example
- Change second sentence in definition to better describe usage

 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index b277eca861f7..9663cab52246 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -39,6 +39,14 @@ of these nodes are defined by the individual bindings for the specific function
 	Definition: a list of channels tied to this function, used for matching
 		    the function to a set of virtual channels
 
+- qcom,intents:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: a list of size,amount pairs describing what intents should
+		    be preallocated for this virtual channel. This can be used
+		    to tweak the default intents available for the channel to
+		    meet expectations of the remote.
+
 = EXAMPLE
 The following example represents the GLINK RPM node on a MSM8996 device, with
 the function for the "rpm_request" channel defined, which is used for
@@ -69,6 +77,8 @@ regualtors and root clocks.
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
+			qcom,intents = <0x400 5
+					0x800 1>;
 			...
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
