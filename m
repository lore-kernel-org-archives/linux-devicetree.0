From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V2] coresight: document binding acronyms
Date: Wed, 22 Jun 2016 09:01:03 -0600
Message-ID: <1466607663-22599-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Suzuki.Poulose@arm.com, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It can be hard for people not familiar with the CoreSight IP blocks
to make sense of the acronyms found in the current bindings.  As such
this patch expands each acronym in the hope of providing a better
description of the IP block they represent.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../devicetree/bindings/arm/coresight.txt          | 35 +++++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

Changes since V1:
   - Expanded ETB, ETF and ETR acronyms.
   - Added note about using the same binding
     for all 3 modes (ETB, ETF, ETR).

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index 93147c0c8a0e..fcbae6a5e6c1 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -12,14 +12,33 @@ its hardware characteristcs.
 
 	* compatible: These have to be supplemented with "arm,primecell" as
 	  drivers are using the AMBA bus interface.  Possible values include:
-		- "arm,coresight-etb10", "arm,primecell";
-		- "arm,coresight-tpiu", "arm,primecell";
-		- "arm,coresight-tmc", "arm,primecell";
-		- "arm,coresight-funnel", "arm,primecell";
-		- "arm,coresight-etm3x", "arm,primecell";
-		- "arm,coresight-etm4x", "arm,primecell";
-		- "qcom,coresight-replicator1x", "arm,primecell";
-		- "arm,coresight-stm", "arm,primecell"; [1]
+		- Embedded Trace Buffer (version 1.0):
+			"arm,coresight-etb10", "arm,primecell";
+
+		- Trace Port Interface Unit:
+			"arm,coresight-tpiu", "arm,primecell";
+
+		- Trace Memory Controller, used for Embedded Trace Buffer(ETB),
+		  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR)
+		  configuration.  The configuration mode (ETB, ETF, ETR) is
+		  discovered at boot time when the device is probed.
+			"arm,coresight-tmc", "arm,primecell";
+
+		- Trace Funnel:
+			"arm,coresight-funnel", "arm,primecell";
+
+		- Embedded Trace Macrocell (version 3.x) and
+					Program Flow Trace Macrocell:
+			"arm,coresight-etm3x", "arm,primecell";
+
+		- Embedded Trace Macrocell (version 4.x):
+			"arm,coresight-etm4x", "arm,primecell";
+
+		- Qualcomm Configurable Replicator (version 1.x):
+			"qcom,coresight-replicator1x", "arm,primecell";
+
+		- System Trace Macrocell:
+			"arm,coresight-stm", "arm,primecell"; [1]
 
 	* reg: physical base address and length of the register
 	  set(s) of the component.
-- 
2.7.4
