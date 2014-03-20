From: Vinayak Kale <vkale@apm.com>
Subject: [PATCH 1/2] dt-bindings: Add Potenza PMU binding
Date: Thu, 20 Mar 2014 15:17:26 +0530
Message-ID: <1395308847-16317-2-git-send-email-vkale@apm.com>
References: <1395308847-16317-1-git-send-email-vkale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395308847-16317-1-git-send-email-vkale@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin.Marinas@arm.com, patches@apm.com, Vinayak Kale <vkale@apm.com>, will.deacon@arm.com, jcm@redhat.com
List-Id: devicetree@vger.kernel.org

This patch documents the compatible string for APM X-Gene Potenza CPU's PMU.

Signed-off-by: Vinayak Kale <vkale@apm.com>
---
 Documentation/devicetree/bindings/arm/pmu.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
index 3e1e498..0246f81 100644
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/pmu.txt
@@ -7,6 +7,7 @@ representation in the device tree should be done as under:-
 Required properties:
 
 - compatible : should be one of
+	"apm,potenza-pmu"
 	"arm,armv8-pmuv3"
 	"arm,cortex-a15-pmu"
 	"arm,cortex-a9-pmu"
-- 
1.7.9.5
