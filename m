From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] driver: clocksource: fix age-old arch timer C3STOP detection issue
Date: Tue,  8 Apr 2014 10:04:32 +0100
Message-ID: <1396947872-6673-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ARM arch timers are tightly coupled with the CPU logic and lose context
on platform implementing HW power management when cores are powered
down at run-time. Marking the arch timers as C3STOP regardless of power
management capabilities causes issues on platforms with no power management=
,
since in that case the arch timers cannot possibly enter states where the
timer loses context at runtime and therefore can always be used as a high
resolution clockevent device.

In order to fix the C3STOP issue in a way compliant with how real HW
works, this patch adds a boolean property to the arch timer bindings
to define if the arch timer is managed by an always-on power domain.

This power domain is present on all ARM platforms to date, and manages
HW that must not be turned off, whatever the state of other HW
components (eg power controller). On platforms with no power management
capabilities, it is the only power domain present, which encompasses
and manages power supply for all HW components in the system.

If the timer is powered by the always-on power domain, the always-on
property must be present in the bindings which means that the timer cannot
be shutdown at runtime, so it is not a C3STOP clockevent device.
If the timer binding does not contain the always-on property, the timer is
assumed to be power-gateable, hence it must be defined as a C3STOP
clockevent device.

Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
Cc: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt | 3 +++
 drivers/clocksource/arm_arch_timer.c                 | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documen=
tation/devicetree/bindings/arm/arch_timer.txt
index 06fc760..37b2caf 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -19,6 +19,9 @@ to deliver its interrupts via SPIs.
=20
 - clock-frequency : The frequency of the main counter, in Hz. Optional.
=20
+- always-on : a boolean property. If present, the timer is powered through=
 an
+  always-on power domain, therefore it never loses context.
+
 Example:
=20
 =09timer {
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm=
_arch_timer.c
index 57e823c..5163ec1 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -66,6 +66,7 @@ static int arch_timer_ppi[MAX_TIMER_PPI];
 static struct clock_event_device __percpu *arch_timer_evt;
=20
 static bool arch_timer_use_virtual =3D true;
+static bool arch_timer_c3stop;
 static bool arch_timer_mem_use_virtual;
=20
 /*
@@ -263,7 +264,8 @@ static void __arch_timer_setup(unsigned type,
 =09clk->features =3D CLOCK_EVT_FEAT_ONESHOT;
=20
 =09if (type =3D=3D ARCH_CP15_TIMER) {
-=09=09clk->features |=3D CLOCK_EVT_FEAT_C3STOP;
+=09=09if (arch_timer_c3stop)
+=09=09=09clk->features |=3D CLOCK_EVT_FEAT_C3STOP;
 =09=09clk->name =3D "arch_sys_timer";
 =09=09clk->rating =3D 450;
 =09=09clk->cpumask =3D cpumask_of(smp_processor_id());
@@ -665,6 +667,8 @@ static void __init arch_timer_init(struct device_node *=
np)
 =09=09}
 =09}
=20
+=09arch_timer_c3stop =3D !of_property_read_bool(np, "always-on");
+
 =09arch_timer_register();
 =09arch_timer_common_init();
 }
--=20
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
