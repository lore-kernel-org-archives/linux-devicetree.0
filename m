From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 1/2] mfd: dt-bindings: add the description about dvs gpio for rk808
Date: Mon, 15 Dec 2014 11:07:57 +0800
Message-ID: <1418612879-16094-2-git-send-email-zyw@rock-chips.com>
References: <1418612879-16094-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418612879-16094-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

add the description about dvs1, dvs2, dvsok, and add the example.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

---

Changes in v3:
- Modify the syntax error

Changes in v2:
- increase description about dvs pins

 Documentation/devicetree/bindings/mfd/rk808.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
index 9e6e259..9cc2941 100644
--- a/Documentation/devicetree/bindings/mfd/rk808.txt
+++ b/Documentation/devicetree/bindings/mfd/rk808.txt
@@ -24,6 +24,14 @@ Optional properties:
 - vcc10-supply: The input supply for LDO_REG6
 - vcc11-supply: The input supply for LDO_REG8
 - vcc12-supply: The input supply for SWITCH_REG2
+- dvs-gpios:  buck1/2 can be controlled by gpio dvs, this is GPIO specifiers
+  for 2 host gpio's used for dvs. The format of the gpio specifier depends in
+  the gpio controller. If DVS GPIOs aren't present, voltage changes will happen
+  very quickly with no slow ramp time.
+- dvsok-gpios: if we use dvs gpio to control buck1/2, this gpio will be pull
+  high, once RK808 completed the adjustment of voltage. If the DVSOK isn't
+  present, we'll just delay based on whatever is specified in the regulator
+  constraints.
 
 Regulators: All the regulators of RK808 to be instantiated shall be
 listed in a child node named 'regulators'. Each regulator is represented
@@ -55,7 +63,10 @@ Example:
 		interrupt-parent = <&gpio0>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_int>;
+		pinctrl-0 = <&pmic_int &dvs_ok &dvs_1 &dvs_2>;
+		dvsok-gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
+		dvs-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>,
+			    <&gpio7 15 GPIO_ACTIVE_HIGH>;
 		reg = <0x1b>;
 		rockchip,system-power-controller;
 		wakeup-source;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
