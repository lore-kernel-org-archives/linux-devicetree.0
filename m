From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC 2/2] staging: jnx-connector: add device tree binding
Date: Fri,  7 Oct 2016 18:16:12 +0300
Message-ID: <1475853372-21997-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853372-21997-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alon Ronen <aronen-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Dhruva Diveneni <ddevineni-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Yu-Lin Lu <ylu-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Add documentation for the Juniper connector driver.

Signed-off-by: Alon Ronen <aronen-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/jnx/jnx-connector          | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/jnx/jnx-connector

diff --git a/Documentation/devicetree/bindings/jnx/jnx-connector b/Documentation/devicetree/bindings/jnx/jnx-connector
new file mode 100644
index 0000000..9262752
--- /dev/null
+++ b/Documentation/devicetree/bindings/jnx/jnx-connector
@@ -0,0 +1,59 @@
+Device-Tree bindings for Juniper connector driver
+
+Required properties:
+	- compatible - Must be one of
+	  - "jnx,pic-connector"
+	  - "jnx,sib-connector"
+	  - "jnx,fpc-connector"
+	  - "jnx,cb-connector"
+	  - "jnx,psm-connector"
+	  - "jnx,fan-connector"
+	  - "jnx,mp-connector"
+	  - "jnx,fpm-connector"
+	  - "jnx,spmb-connector"
+	  "simple-bus" must also be specified to facilitate instantiation.
+	- slot - slot number
+
+Optional properties:
+	- assembly-id - Static assembly ID to be used for all adapters.
+			If specified, it is assumed that no ID eeprom is
+			present, and the provided assembly ID will always be
+			used to identify the adapter and the devicetree overlay
+			to load.
+	- presence-detect-gpios - presence detect gpio pin
+				  If not provided, card is assumed
+				  to be always present.
+	- attention-button-gpios - request button gpio pin
+	- attention-button-ignore - set if kernel shall ignore
+				    attention button events
+	- attention-button-holdtime - button hold time in milli-seconds
+				      (3s default)
+	- activation-timeout - activation timeout in milli-seconds (10s default)
+	- debounce-interval - debounce interval in milli-seconds
+				(applies to presence detect pin).
+	- power-enable-gpios - power enable gpio pin
+	- power-status-gpios - power status gpio pin (mandatory if
+			       power-enable-gpios is provided)
+	- power-enable-timeout - power enable timeout in ms (1s default)
+	- poweron-reset-delay - delay to be applied after poweron in
+				milli-seconds (default none)
+	- reset-gpios - board reset gpio pin
+	- led-green - phandle pointing to green LED
+	- led-red - phandle pointing to red LED
+	- sysfs-linkname - name to be user for the symbolic link under jnx/card
+
+Example node:
+
+	pic0 {
+		compatible = "jnx,pic-connector", "simple-bus";
+		slot = <0>;
+		presence-detect-gpios = <&gpio1 148 0x10013>;
+		attention-button-gpios = <&gpio20 150 0x10013>;
+		power-enable-gpios = <&gpio1 154 0x0>;
+		power-status-gpios = <&gpio1 151 0x3>;
+		reset-gpios = <&gpio1 153 0x10000>;
+		power-enable-timeout = <2000>;
+		debounce-interval = <1>;
+		led-green = <&pic0_green>;
+		led-red = <&pic0_red>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
