From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v5 1/4] dt-bindings: arm: coresight: Add new compatible for static replicator
Date: Fri, 12 Apr 2019 18:27:35 +0800
Message-ID: <20190412102738.12679-2-leo.yan@linaro.org>
References: <20190412102738.12679-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412102738.12679-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

CoreSight uses below bindings for replicator:

  Dynamic replicator, aka. configurable replicator:
    "arm,coresight-dynamic-replicator", "arm,primecell";

  Static replicator, aka. non-configurable replicator:
    "arm,coresight-replicator";

The compatible string "arm,coresight-replicator" is not an explicit
naming to express the replicator is 'static'.  To unify the naming
convention, this patch introduces a new compatible string
"arm,coresight-static-replicator" for the static replicator; the
compatible string "arm,coresight-replicator" is kept for backward
compatibility, but tag it as obsolete and suggest to use the new
compatible string.

As result CoreSight replicator have below bindings:

  Dynamic replicator:
    "arm,coresight-dynamic-replicator", "arm,primecell";

  Static replicator:
    "arm,coresight-static-replicator";
    "arm,coresight-replicator"; (obsolete)

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index f8aff65ab921..d02d160fa8ac 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -69,7 +69,10 @@ its hardware characteristcs.
 
 	* compatible: Currently supported value is (note the absence of the
 	  AMBA markee):
-		- "arm,coresight-replicator"
+		- Coresight Non-configurable Replicator:
+			"arm,coresight-static-replicator";
+			"arm,coresight-replicator"; (OBSOLETE. For backward
+				compatibility and will be removed)
 
 	* port or ports: see "Graph bindings for Coresight" below.
 
@@ -169,7 +172,7 @@ Example:
 		/* non-configurable replicators don't show up on the
 		 * AMBA bus.  As such no need to add "arm,primecell".
 		 */
-		compatible = "arm,coresight-replicator";
+		compatible = "arm,coresight-static-replicator";
 
 		out-ports {
 			#address-cells = <1>;
-- 
2.17.1
