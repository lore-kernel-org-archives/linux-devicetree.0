From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: dts: da850-lego-ev3: Add node for reboot modes
Date: Thu, 11 Jan 2018 20:29:50 -0600
Message-ID: <1515724191-30499-2-git-send-email-david@lechnology.com>
References: <1515724191-30499-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515724191-30499-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a new node for reboot modes on LEGO MINDSTORMS EV3. The EV3's
bootloader looks for a magic number in the ARM local RAM and if found,
it will boot into a special firmware update mode where the flash memory
can be written via USB.

This has been testing working using the command:

    # systemctl reboot loader

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---
 arch/arm/boot/dts/da850-lego-ev3.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
index 81942ae..2e85080 100644
--- a/arch/arm/boot/dts/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
@@ -184,6 +184,23 @@
 		io-channel-names = "voltage", "current";
 		rechargeable-gpios = <&gpio 136 GPIO_ACTIVE_LOW>;
 	};
+
+	/* ARM local RAM */
+	memory@ffff0000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0xffff0000 0x2000>; /* 8k */
+
+		/*
+		 * The I2C bootloader looks for this magic value to either
+		 * boot normally or boot into a firmware update mode.
+		 */
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x1ffc>;
+			mode-normal = <0x00000000>;
+			mode-loader = <0x5555aaaa>;
+		};
+	};
 };
 
 &pmx_core {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
