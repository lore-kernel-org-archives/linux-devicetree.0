From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: coresight: Add new compatible for static replicator
Date: Sat,  6 Apr 2019 19:21:42 +0800
Message-ID: <20190406112145.15184-2-leo.yan@linaro.org>
References: <20190406112145.15184-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406112145.15184-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wanglai Shi <shiwanglai@hisilicon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

CoreSight uses below bindings for replicator:

  Static replicator, aka. non-configurable replicator:
    "arm,coresight-replicator";

  Dynamic replicator, aka. configurable replicator:
    "arm,coresight-dynamic-replicator", "arm,primecell";

The compatible string "arm,coresight-replicator" is not an explicit
naming to express the replicator is 'static'.  To unify the naming
convention, this patch introduces a new compatible string
"arm,coresight-static-replicator" for the static replicator; the
compatible string "arm,coresight-replicator" is still kept thus we
can support the old DT binding, but tag it as obsolete and suggest
to use the new compatible string.

As result CoreSight replicator have below bindings:

  Static replicator:
    "arm,coresight-replicator"; (obsolete)
    "arm,coresight-static-replicator";

  Dynamic replicator:
    "arm,coresight-dynamic-replicator", "arm,primecell";

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index f8aff65ab921..f8f794869af2 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -69,7 +69,11 @@ its hardware characteristcs.
 
 	* compatible: Currently supported value is (note the absence of the
 	  AMBA markee):
-		- "arm,coresight-replicator"
+		- Coresight Non-configurable Replicator, the compatible string
+		  "arm,coresight-replicator" is obsolete, keep it to support
+		  the old DT bindings:
+			"arm,coresight-replicator";
+			"arm,coresight-static-replicator";
 
 	* port or ports: see "Graph bindings for Coresight" below.
 
@@ -169,7 +173,7 @@ Example:
 		/* non-configurable replicators don't show up on the
 		 * AMBA bus.  As such no need to add "arm,primecell".
 		 */
-		compatible = "arm,coresight-replicator";
+		compatible = "arm,coresight-static-replicator";
 
 		out-ports {
 			#address-cells = <1>;
-- 
2.17.1
