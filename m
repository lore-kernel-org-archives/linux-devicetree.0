From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] thermal: allow creating hwmon for thermal zones on OF systems
Date: Mon, 20 Apr 2015 15:21:31 -0700
Message-ID: <20150420222131.GA6077@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Current implementation forcibly suppresses creation of hwmon instances
for thermal zones defined in device tree data. Let's add a new property,
"linux,hwmon" to allow marking certain thermal zones as needing generic
hwmon interface.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/thermal/thermal.txt | 4 ++++
 drivers/thermal/of-thermal.c                          | 7 +++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
index 8a49362..0106f8f 100644
--- a/Documentation/devicetree/bindings/thermal/thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/thermal.txt
@@ -174,6 +174,10 @@ Optional property:
 			2000mW, while on a 10'' tablet is around
 			4500mW.
 
+- linux,hwmon:		A boolean property that instructs Linux thermal core
+			to create an instance of hwmon device representing
+			this thermal zone.
+
 Note: The delay properties are bound to the maximum dT/dt (temperature
 derivative over time) in two situations for a thermal zone:
 (i)  - when passive cooling is activated (polling-delay-passive); and
diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 9e8c614..7b7a70c 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -891,8 +891,11 @@ int __init of_parse_thermal_zones(void)
 			goto exit_free;
 		}
 
-		/* No hwmon because there might be hwmon drivers registering */
-		tzp->no_hwmon = true;
+		/*
+		 * Do not attach hwmon device unless explicitly requested,
+		 * since there might be dedicated hwmon drivers registering.
+		 */
+		tzp->no_hwmon = !of_property_read_bool(child, "linux,hwmon");
 
 		if (!of_property_read_u32(child, "sustainable-power", &prop))
 			tzp->sustainable_power = prop;
-- 
2.2.0.rc0.207.ga3a616c


-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
