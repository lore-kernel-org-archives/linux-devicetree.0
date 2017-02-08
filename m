From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 07/10] clocksource/drivers/arm_arch_timer: Add dt binding for hisilicon-161010101 erratum
Date: Thu,  9 Feb 2017 00:14:41 +0100
Message-ID: <1486595685-10232-7-git-send-email-daniel.lezcano@linaro.org>
References: <20170208231208.GB12695@mai>
 <1486595685-10232-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486595685-10232-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: Ding Tianhong <dingtianhong@huawei.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Scott Wood <oss@buserror.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Ding Tianhong <dingtianhong@huawei.com>

This erratum describes a bug in logic outside the core, so MIDR can't be
used to identify its presence, and reading an SoC-specific revision
register from common arch timer code would be awkward.  So, describe it
in the device tree.

Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index ad440a2..e926aea 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -31,6 +31,12 @@ to deliver its interrupts via SPIs.
   This also affects writes to the tval register, due to the implicit
   counter read.
 
+- hisilicon,erratum-161010101 : A boolean property. Indicates the
+  presence of Hisilicon erratum 161010101, which says that reading the
+  counters is unreliable in some cases, and reads may return a value 32
+  beyond the correct value. This also affects writes to the tval
+  registers, due to the implicit counter read.
+
 ** Optional properties:
 
 - arm,cpu-registers-not-fw-configured : Firmware does not initialize
-- 
2.7.4
