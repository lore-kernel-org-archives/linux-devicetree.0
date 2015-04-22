From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH] coresight: binding for ETMv4 coresight drivers
Date: Wed, 22 Apr 2015 16:43:57 -0600
Message-ID: <1429742637-12337-1-git-send-email-mathieu.poirier@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org
List-Id: devicetree@vger.kernel.org

Adding compatible string for new coresight ETMv4 tracer.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index 88602b75418e..f4d6a86738a4 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -17,6 +17,7 @@ its hardware characteristcs.
 		- "arm,coresight-tmc", "arm,primecell";
 		- "arm,coresight-funnel", "arm,primecell";
 		- "arm,coresight-etm3x", "arm,primecell";
+		- "arm,coresight-etm4x", "arm,primecell";
 
 	* reg: physical base address and length of the register
 	  set(s) of the component.
-- 
1.9.1
