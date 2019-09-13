From: Andrew Murray <andrew.murray@arm.com>
Subject: [PATCH v6 2/3] dt-bindings: arm: coresight: Add support for
 coresight-loses-context-with-cpu
Date: Fri, 13 Sep 2019 12:53:11 +0100
Message-ID: <20190913115312.12943-3-andrew.murray@arm.com>
References: <20190913115312.12943-1-andrew.murray@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190913115312.12943-1-andrew.murray@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Al.Grant@arm.com, coresight@lists.linaro.org, Leo Yan <leo.yan@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

Some coresight components, because of choices made during hardware
integration, require their state to be saved and restored across CPU low
power states.

The software has no reliable method of detecting when save/restore is
required thus let's add a binding to inform the kernel.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Documentation/devicetree/bindings/arm/coresight.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index fcc3bacfd8bc..d02c42d21f2f 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -87,6 +87,15 @@ its hardware characteristcs.
 
 	* port or ports: see "Graph bindings for Coresight" below.
 
+* Optional properties for all components:
+
+	* arm,coresight-loses-context-with-cpu : boolean. Indicates that the
+	  hardware will lose register context on CPU power down (e.g. CPUIdle).
+	  An example of where this may be needed are systems which contain a
+	  coresight component and CPU in the same power domain. When the CPU
+	  powers down the coresight component also powers down and loses its
+	  context. This property is currently only used for the ETM 4.x driver.
+
 * Optional properties for ETM/PTMs:
 
 	* arm,cp14: must be present if the system accesses ETM/PTM management
-- 
2.21.0
