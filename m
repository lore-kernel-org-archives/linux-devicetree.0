From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/2] regulator: DT: Add properties for asymmetric settling times
Date: Tue, 16 May 2017 11:43:42 -0700
Message-ID: <20170516184343.103099-1-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some regulators have different settling times for voltage increases and
decreases. Add DT properties to define separate settling times for up-
and downward voltage changes.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v3:
- none

 Documentation/devicetree/bindings/regulator/regulator.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index d18edb075e1c..378f6dc8b8bd 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -24,6 +24,14 @@ Optional properties:
 - regulator-settling-time-us: Settling time, in microseconds, for voltage
   change if regulator have the constant time for any level voltage change.
   This is useful when regulator have exponential voltage change.
+- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
+  increase if the regulator needs a constant time to settle after voltage
+  increases of any level. This is useful for regulators with exponential
+  voltage changes.
+- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
+  decrease if the regulator needs a constant time to settle after voltage
+  decreases of any level. This is useful for regulators with exponential
+  voltage changes.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
-- 
2.13.0.303.g4ebf302169-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
