From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: mfd: axp20x: Document backup
 battery charging property
Date: Sat, 30 Dec 2017 16:23:28 +0100
Message-ID: <20171230152330.28946-2-contact@paulk.fr>
References: <20171230152330.28946-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBIG7T3JAKGQEDLYFJXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171230152330.28946-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds documentation for the "backup" property of the axp20x driver,
that controls the charging mechanism for the backup battery on axp20x.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 9455503b0299..382776b29932 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -58,6 +58,11 @@ Optional properties:
 	      See Documentation/devicetree/bindings/regulator/regulator.txt
 	      for more information on standard regulator bindings.
 
+- backup: An array of two integers for backup battery charging (axp20x-only),
+	  describing the charging voltage in mV first and the charging current
+	  in uA second. Backup battery charging is only enabled when these two
+	  fields are filled.
+
 Optional properties for DCDC regulators:
 - x-powers,dcdc-workmode: 1 for PWM mode, 0 for AUTO (PWM/PFM) mode
 			  Default: Current hardware setting
@@ -256,4 +261,6 @@ axp209: pmic@34 {
 			/* unused but preferred to be managed by OS */
 		};
 	};
+
+	backup = <3000 200>;
 };
-- 
2.15.1
