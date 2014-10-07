From: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3] clocksource: arch_timer: Allow the device tree to specify uninitialized CNTVOFF
Date: Mon,  6 Oct 2014 23:37:32 -0700
Message-ID: <1412663852-32681-1-git-send-email-sonnyrao@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some 32-bit (ARMv7) systems are architected like this:

* The firmware doesn't know and doesn't care about hypervisor mode and
  we don't want to add the complexity of hypervisor there.

* The firmware isn't involved in SMP bringup or resume.

* The ARCH timer come up with an uninitialized offset (CNTVOFF)
  between the virtual and physical counters.  Each core gets a
  different random offset.

* The device boots in "Secure SVC" mode.

* Nothing has touched the reset value of CNTHCTL.PL1PCEN or
  CNTHCTL.PL1PCTEN (both default to 1 at reset)

On systems like the above, it doesn't make sense to use the virtual
counter.  There's nobody managing the offset and each time a core goes
down and comes back up it will get reinitialized to some other random
value.

This adds an optional property which can inform the kernel of this
situation, and firmware is free to remove the property if it is going
to initialize the CNTVOFF registers when each CPU comes out of reset.

Currently, the best course of action in this case is to use the
physical timer, which is why it is important that CNTHCTL hasn't been
changed from its reset value and it's a reasonable assumption given
that the firmware has never entered HYP mode.

Note that it's been said that ARM64 (ARMv8) systems the firmware and
kernel really can't be architected as described above.  That means
using the physical timer like this really only makes sense for ARMv7
systems.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Add "#ifdef CONFIG_ARM" as per Will Deacon

Changes in v3:
- change property name to arm,cntvoff-not-fw-configured and specify
  that the value of CNTHCTL.PL1PC(T)EN must still be the reset value
  of 1 as per Mark Rutland
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
 drivers/clocksource/arm_arch_timer.c                 | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index 37b2caf..67837c9 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -22,6 +22,14 @@ to deliver its interrupts via SPIs.
 - always-on : a boolean property. If present, the timer is powered through an
   always-on power domain, therefore it never loses context.
 
+** Optional properties:
+
+- arm,cntvoff-not-fw-configured : Firmware does not initialize
+  CNTVOFF, which may reset to arbitrary and different values on each
+  CPU.  CNTHCTL.PL1PC(T)EN must both be 1, which is the reset value
+  specificed by the architecture.   Only supported for ARM (not ARM64).
+
+
 Example:
 
 	timer {
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index bd8da15..234d7b9 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -668,6 +668,15 @@ static void __init arch_timer_init(struct device_node *np)
 		arch_timer_ppi[i] = irq_of_parse_and_map(np, i);
 	arch_timer_detect_rate(NULL, np);
 
+#ifdef CONFIG_ARM
+	/*
+	 * If we cannot rely on firmware initializing the CNTVOFF then
+	 * we should use the physical timers instead.
+	 */
+	if (of_property_read_bool(np, "arm,cntvoff-not-fw-configured"))
+		arch_timer_use_virtual = false;
+#endif
+
 	/*
 	 * If HYP mode is available, we know that the physical timer
 	 * has been configured to be accessible from PL1. Use it, so
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
