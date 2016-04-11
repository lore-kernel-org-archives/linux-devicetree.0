From: Ashok Kumar <ashoks@broadcom.com>
Subject: [PATCH v4 1/6] Documentation: arm64: pmu: Add Broadcom Vulcan PMU
 binding
Date: Mon, 11 Apr 2016 06:02:16 -0700
Message-ID: <1460379741-1181-2-git-send-email-ashoks@broadcom.com>
References: <1460379741-1181-1-git-send-email-ashoks@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460379741-1181-1-git-send-email-ashoks@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, will.deacon@arm.com, Suzuki.Poulose@arm.com, robh+dt@kernel.org, catalin.marinas@arm.com
Cc: jchandra@broadcom.com, Ashok Kumar <ashoks@broadcom.com>, jglauber@cavium.com
List-Id: devicetree@vger.kernel.org

Document the compatible string for Broadcom Vulcan PMU.
Also arranged the list in alphabetical order.

Signed-off-by: Ashok Kumar <ashoks@broadcom.com>
---
 Documentation/devicetree/bindings/arm/pmu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
index 6eb73be..74d5417 100644
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/pmu.txt
@@ -22,10 +22,11 @@ Required properties:
 	"arm,arm11mpcore-pmu"
 	"arm,arm1176-pmu"
 	"arm,arm1136-pmu"
+	"brcm,vulcan-pmu"
+	"cavium,thunder-pmu"
 	"qcom,scorpion-pmu"
 	"qcom,scorpion-mp-pmu"
 	"qcom,krait-pmu"
-	"cavium,thunder-pmu"
 - interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
                interrupt (PPI) then 1 interrupt should be specified.
 
-- 
2.1.0
