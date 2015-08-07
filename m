From: =?UTF-8?B?Q2h1bmctWWloIFdhbmcgKOeOi+W0h+aHvyk=?=
	<cywang@chromium.org>
Subject: [PATCH] thermal: of: Introduce governor selection in dts
Date: Fri, 7 Aug 2015 15:09:39 +0800
Message-ID: <CAM2ehZYXsqCoS9ygXNfPHxt9-b5cFxH_ovrgjvM-BfDO6REcUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Chung-yih Wang <cywang@chromium.org>
List-Id: devicetree@vger.kernel.org

As there could be more thermal zones on a system and
more variety in thermal governors provided in kernel,
this patch provides flexibility of governor selection
for a thermal zone declared in device tree.

Change-Id: Ie4a75d762709cbbe9f1806dae325d13f71982e78
Signed-off-by: Chung-yih Wang <cywang@chromium.org>
---
 Documentation/devicetree/bindings/thermal/thermal.txt |  9 +++++++++
 drivers/thermal/of-thermal.c                          | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt
b/Documentation/devicetree/bindings/thermal/thermal.txt
index 8a49362..30a5d41 100644
--- a/Documentation/devicetree/bindings/thermal/thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/thermal.txt
@@ -174,6 +174,13 @@ Optional property:
                        2000mW, while on a 10'' tablet is around
                        4500mW.

+- thermal-governor-name:       The name of governor used to control the
+                               thermal zone instead of the default one
+                               specified in kernel config. For reference, if
+                               default governor is step_wise, one could
+                               select power_allocator for cpu_thermal zone
+                               in dts.
+
 Note: The delay properties are bound to the maximum dT/dt (temperature
 derivative over time) in two situations for a thermal zone:
 (i)  - when passive cooling is activated (polling-delay-passive); and
@@ -555,6 +562,8 @@ thermal-zones {

                sustainable-power = <2500>;

+               thermal-governor-name = "power_allocator";
+
                trips {
                        /* Trips are based on resulting linear equation */
                        cpu_trip: cpu-trip {
diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index b295b2b..45570ac 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -882,6 +882,7 @@ int __init of_parse_thermal_zones(void)
        }

        for_each_child_of_node(np, child) {
+               const char *governor_name;
                struct thermal_zone_device *zone;
                struct thermal_zone_params *tzp;
                int i, mask = 0;
@@ -909,6 +910,15 @@ int __init of_parse_thermal_zones(void)
                        goto exit_free;
                }

+               /* Select a preferred governor if declared */
+               if (!of_property_read_string(child,
+                                            "thermal-governor-name",
+                                            &governor_name)) {
+                       strncpy(tzp->governor_name,
+                               governor_name,
+                               sizeof(tzp->governor_name) - 1);
+               }
+
                /* No hwmon because there might be hwmon drivers registering */
                tzp->no_hwmon = true;

--
2.1.2
