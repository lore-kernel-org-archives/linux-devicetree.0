From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 1/8] rsb: Add generic Reduced Serial Bus
 (RSB) controller binding documentation
Date: Wed, 19 Aug 2015 12:20:02 +0800
Message-ID: <1439958009-14056-2-git-send-email-wens@csie.org>
References: <1439958009-14056-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGEI2CXAKGQEK4UZRYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1439958009-14056-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reduced Serial Bus is a proprietary 2-line push-pull serial bus
supporting multiple slave devices.

It was developed by Allwinner, Inc. and used by Allwinner and X-Powers,
Inc. for their line of PMICs and other peripheral ICs.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/rsb/rsb.txt | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rsb/rsb.txt

diff --git a/Documentation/devicetree/bindings/rsb/rsb.txt b/Documentation/devicetree/bindings/rsb/rsb.txt
new file mode 100644
index 000000000000..0b027948ca9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rsb/rsb.txt
@@ -0,0 +1,50 @@
+Reduced Serial Bus (RSB) Controller
+
+This document defines a generic set of bindings for use by RSB controllers.
+A controller is modelled in device tree as a node with zero or more child
+nodes, each representing a unique slave device on the bus.
+
+Required properties:
+
+ - #address-cells : must be 2
+ - #size-cells : must be 0
+
+Optional properties:
+
+ - clock-frequency : Desired bus clock frequency in Hz. Maximum is 20 MHz.
+
+Child nodes:
+
+An RSB controller node can contain zero or more child nodes representing
+slave devices on the bus.  Child 'reg' properties are specified as a
+runtime address, hardware address pair. The hardware address is hardwired
+in the device, which can normally be found in the datasheet. The runtime
+address is set by software. No 2 devices on the same bus shall have the
+same runtime address.
+
+Valid runtime addresses - There are only 15 valid runtime addresses:
+
+    0x17, 0x2d, 0x3a, 0x4e, 0x59, 0x63, 0x74, 0x8b,
+    0x9c, 0xa6, 0xb1, 0xc5, 0xd2, 0xe8, 0xff
+
+It is highly recommended that one choose the same runtime addresses as
+vendor BSPs use so that a) the addresses remain the same across different
+software systems, and b) addresses of supported and listed slave devices
+don't conflict with unsupported or not yet listed devices.
+
+Example:
+
+	rsb@... {
+		compatible = "...";
+		reg = <...>;
+		/* ... */
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		pmic@2d {
+			compatible = "...";
+			reg = <0x2d 0x3e3>;
+
+			/* ... */
+		};
+	};
-- 
2.5.0
