From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] regulator: max77620: Add details of device specific ramp rate setting
Date: Fri, 22 Apr 2016 18:09:40 +0530
Message-ID: <1461328781-22768-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is observed that the ramp rate measured on platform is not same as
advertised ramp rate due to platform design variation. On this case,
measured ramp rate is provided with property regulator-ramp-rate.

For such cases, add DT property for device specific configurations.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/regulator/regulator-max77620.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index b3c8ca6..1c4bfe7 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -94,6 +94,28 @@ Following are additional properties:
 					This is applicable if suspend state
 					FPS source is selected as FPS0, FPS1 or
 					FPS2.
+- maxim,ramp-rate-setting:		integer, ramp rate(uV/us) setting to be
+					configured to the device.
+					The platform may have different ramp
+					rate than advertised ramp rate if it has
+					design variation from Maxim's
+					recommended. On this case, platform
+					specific ramp rate is used for ramp time
+					calculation and this property is used
+					for device register configurations.
+					The measured ramp rate of platform is
+					provided by the regulator-ramp-delay
+					as described in <devicetree/bindings/
+					regulator/regulator.txt>.
+					Maxim Max77620 supports following ramp
+					delay:
+					  SD: 13.75mV/us, 27.5mV/us, 55mV/us
+					  LDOs: 5mV/us, 100mV/us
+
+Note: If the measured ramp delay is same as advertised ramp delay then it is not
+required to provide the ramp delay with property "maxim,ramp-rate-setting". The
+ramp rate can be provided by the regulator-ramp-delay which will be used for
+ramp time calculation for voltage change as well as for device configuration.
 
 Example:
 --------
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
