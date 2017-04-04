From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 1/2] regulator: DT: Add settling time property for non-linear voltage change
Date: Tue, 4 Apr 2017 18:59:49 +0530
Message-ID: <1491312590-20887-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some regulators (some PWM regulators) have the voltage transition
exponentially. On such cases, the settling time for voltage change
is treated as constant time.

Add DT property for providing the settling time for any level of
voltage change for non-linear voltage change.

signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---
This patch is continuation of discussion on patch
   regulator: pwm: Fix regulator ramp delay for continuous mode
   https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.

Changes from V1:
- Pass the flag to tell that voltage ramp is exponential instead of
  providing delay.

Changes from V2:
- Based on review comment from V1, make the settling time property
  independent of the regulator-ramp-delay and move this out of PWM
  regulator.

Changes from V3:
- The change was sent long back and resuming this patch.
- Added Rob's ack from V3 and content is same as V3.
   https://lkml.org/lkml/2016/11/30/632
- Rebase on linux-next tag 20170330 for resend.
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 6ab5aef..d18edb0 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -21,6 +21,9 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-settling-time-us: Settling time, in microseconds, for voltage
+  change if regulator have the constant time for any level voltage change.
+  This is useful when regulator have exponential voltage change.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
