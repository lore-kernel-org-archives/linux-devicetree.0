From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH] spmi: of: fixup generic SPMI devicetree binding example
Date: Thu,  1 May 2014 16:40:26 -0500
Message-ID: <1398980426-23877-1-git-send-email-joshc@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The generic SPMI example was missing an equal sign in the assignment
of the #size-cells property.

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 Documentation/devicetree/bindings/spmi/spmi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/spmi.txt b/Documentation/devicetree/bindings/spmi/spmi.txt
index 462a42f..4bb10d1 100644
--- a/Documentation/devicetree/bindings/spmi/spmi.txt
+++ b/Documentation/devicetree/bindings/spmi/spmi.txt
@@ -26,7 +26,7 @@ Each child node must have one and only one 'reg' entry of type SPMI_USID.
 		reg = <...>;
 
 		#address-cells = <2>;
-		#size-cells <0>;
+		#size-cells = <0>;
 
 		child@0 {
 			compatible = "...";
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
