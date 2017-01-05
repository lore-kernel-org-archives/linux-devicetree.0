From: Ding Tianhong <dingtianhong@huawei.com>
Subject: [PATCH v6 1/4] arm64: arch_timer: Add device tree binding for
 hisilicon-161601 erratum
Date: Thu, 5 Jan 2017 13:31:54 +0800
Message-ID: <1483594317-10732-2-git-send-email-dingtianhong@huawei.com>
References: <1483594317-10732-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483594317-10732-1-git-send-email-dingtianhong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, marc.zyngier@arm.com, mark.rutland@arm.com, oss@buserror.net, devicetree@vger.kernel.org, shawnguo@kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Cc: Ding Tianhong <dingtianhong@huawei.com>
List-Id: devicetree@vger.kernel.org

This erratum describes a bug in logic outside the core, so MIDR can't be
used to identify its presence, and reading an SoC-specific revision
register from common arch timer code would be awkward.  So, describe it
in the device tree.

v2: Use the new erratum name and update the description.

Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index ad440a2..935f142 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -31,6 +31,14 @@ to deliver its interrupts via SPIs.
   This also affects writes to the tval register, due to the implicit
   counter read.
 
+- hisilicon,erratum-161601 : A boolean property. Indicates the presence of
+  erratum 161601, which says that reading the counter is unreliable unless
+  reading twice on the register and the value of the second read is larger
+  than the first by less than 32. If the verification is unsuccessful, then
+  discard the value of this read and repeat this procedure until the verification
+  is successful.  This also affects writes to the tval register, due to the
+  implicit counter read.
+
 ** Optional properties:
 
 - arm,cpu-registers-not-fw-configured : Firmware does not initialize
-- 
1.9.0
