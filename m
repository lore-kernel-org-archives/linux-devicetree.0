From: Vikash Garodia <vgarodia@codeaurora.org>
Subject: [PATCH v7 5/5] dt-bindings: media: Document bindings for venus firmware device
Date: Fri, 14 Sep 2018 18:54:37 +0530
Message-ID: <1536931477-13018-6-git-send-email-vgarodia@codeaurora.org>
References: <1536931477-13018-1-git-send-email-vgarodia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536931477-13018-1-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add devicetree binding documentation for firmware loader for video
hardware running on qualcomm chip.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
---
 Documentation/devicetree/bindings/media/qcom,venus.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
index 00d0d1b..7e04586 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus.txt
+++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
@@ -53,7 +53,7 @@
 
 * Subnodes
 The Venus video-codec node must contain two subnodes representing
-video-decoder and video-encoder.
+video-decoder and video-encoder, and one optional firmware subnode.
 
 Every of video-encoder or video-decoder subnode should have:
 
@@ -79,6 +79,13 @@ Every of video-encoder or video-decoder subnode should have:
 		    power domain which is responsible for collapsing
 		    and restoring power to the subcore.
 
+The firmware subnode must have:
+
+- iommus:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs.
+
 * An Example
 	video-codec@1d00000 {
 		compatible = "qcom,msm8916-venus";
@@ -105,4 +112,8 @@ Every of video-encoder or video-decoder subnode should have:
 			clock-names = "core";
 			power-domains = <&mmcc VENUS_CORE1_GDSC>;
 		};
+
+		video-firmware {
+			iommus = <&apps_iommu 0x10b2 0x0>;
+		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
