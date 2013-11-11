From: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 12/12] arm: dts: keystone: add AEMIF/NAND device entry
Date: Mon, 11 Nov 2013 17:13:01 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D71@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-13-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384187188-5776-13-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add AEMIF/NAND device entry.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dts |   63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dts b/arch/arm/boot/dts/keystone.dts
index 100bdf5..998da98 100644
--- a/arch/arm/boot/dts/keystone.dts
+++ b/arch/arm/boot/dts/keystone.dts
@@ -179,5 +179,68 @@
                        interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
                        clocks = <&clkspi>;
                };
+
+               aemif@021000A00 {
+                       compatible = "ti,keystone-aemif";
+                       #address-cells = <2>;
+                       #size-cells = <1>;
+                       clocks = <&clkaemif>;
+                       clock-names = "aemif";
+                       clock-ranges;
+
+                       reg = <0x2100A00 0x00000100>;
+                       ranges = <0 0 0x30000000 0x10000000
+                                 1 0 0x21000A00 0x00000100>;
+
+                       nand:cs0 {
+                               compatible = "ti,davinci-cs";
+                               #address-cells = <2>;
+                               #size-cells = <1>;
+                               clock-ranges;
+                               ranges;
+
+                               /* all timings in nanoseconds */
+                               ti,davinci-cs-ta = <12>;
+                               ti,davinci-cs-rhold = <6>;
+                               ti,davinci-cs-rstrobe = <23>;
+                               ti,davinci-cs-rsetup = <9>;
+                               ti,davinci-cs-whold = <8>;
+                               ti,davinci-cs-wstrobe = <23>;
+                               ti,davinci-cs-wsetup = <8>;
+
+                               nand@0,0 {
+                                       compatible = "ti,keystone-nand";
+                                       #address-cells = <1>;
+                                       #size-cells = <1>;
+                                       reg = <0 0 0x4000000
+                                              1 0 0x0000100>;
+
+                                       ti,davinci-chipselect = <0>;
+                                       ti,davinci-mask-ale = <0x2000>;
+                                       ti,davinci-mask-cle = <0x4000>;
+                                       ti,davinci-mask-chipsel = <0>;
+                                       nand-ecc-mode = "hw";
+                                       ti,davinci-ecc-bits = <4>;
+                                       nand-on-flash-bbt;
+
+                                       partition@0 {
+                                               label = "u-boot";
+                                               reg = <0x0 0x100000>;
+                                               read-only;
+                                       };
+
+                                       partition@100000 {
+                                               label = "params";
+                                               reg = <0x100000 0x80000>;
+                                               read-only;
+                                       };
+
+                                       partition@180000 {
+                                               label = "ubifs";
+                                               reg = <0x180000 0x7E80000>;
+                                       };
+                               };
+                       };
+               };
        };
 };
--
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
