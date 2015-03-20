From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH RESEND] Doc: dt: arch_timer: discourage clock-frequency use
Date: Fri, 20 Mar 2015 17:57:47 +0000
Message-ID: <1426874267-24413-1-git-send-email-mark.rutland@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ARM Generic Timer (AKA the architected timer, arm_arch_timer)
features a CPU register (CNTFRQ) which firmware is intended to
initialize, and non-secure software can read to determine the frequency
of the timer. On CPUs with secure state, this register cannot be written
from non-secure states.

The firmware of early SoCs featuring the timer did not correctly
initialize CNTFRQ correctly on all CPUs, requiring the frequency to be
described in DT as a workaround. This workaround is not complete however
as it is exposed to all software in a privileged non-secure mode
(including guests running under a hypervisor). The firmware and DTs for
recent SoCs have followed the example set by these early SoCs.

This patch updates the arch timer binding documentation to make it
clearer that the use of the clock-frequency property is a poor
work-around. The MMIO generic timer binding is similarly updated, though
this is less of a concern as there is generally no need to expose the
MMIO timers to guest OSs.

Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

This patch has fallen through the cracks a few times [1,2], though that appears
to be my fault for not sorting out a reasonable Cc list.

Rob, are you happy to take this through your tree?

Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/282804.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/282830.html


diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index 256b4d8..e774128 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -17,7 +17,10 @@ to deliver its interrupts via SPIs.
 - interrupts : Interrupt list for secure, non-secure, virtual and
   hypervisor timers, in that order.
 
-- clock-frequency : The frequency of the main counter, in Hz. Optional.
+- clock-frequency : The frequency of the main counter, in Hz. Should be present
+  only where necessary to work around broken firmware which does not configure
+  CNTFRQ on all CPUs to a uniform correct value. Use of this property is
+  strongly discouraged; fix your firmware unless absolutely impossible.
 
 - always-on : a boolean property. If present, the timer is powered through an
   always-on power domain, therefore it never loses context.
@@ -46,7 +49,8 @@ Example:
 
 - compatible : Should at least contain "arm,armv7-timer-mem".
 
-- clock-frequency : The frequency of the main counter, in Hz. Optional.
+- clock-frequency : The frequency of the main counter, in Hz. Should be present
+  only when firmware has not configured the MMIO CNTFRQ registers.
 
 - reg : The control frame base address.
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
