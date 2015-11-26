From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 14:16:16 +0100
Message-ID: <56570620.3070106@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

In the device tree for my ARM platform, I have several nodes with
addresses within the SCU block:

	scu: scu@20000000 {
		compatible = "arm,cortex-a9-scu";
		reg = <0x20000000 0x100>;

	gic: interrupt-controller@20001000 {
		compatible = "arm,cortex-a9-gic";
		reg = <0x20001000 0x1000>, <0x20000100 0x0100>;

	twd-timer@20000600 {
		compatible = "arm,cortex-a9-twd-timer";
		reg = <0x20000600 0x10>;

Can I use preprocessor arithmetic to abstract the base address,
as would be done in C?

#define SCU_BASE 0x20000000

	scu: scu@XXX {
		compatible = "arm,cortex-a9-scu";
		reg = <SCU_BASE 0x100>;
	
	gic: interrupt-controller@XXX {
		compatible = "arm,cortex-a9-gic";
		reg = <SCU_BASE+0x1000 0x1000>, <SCU_BASE+0x100 0x0100>;

	twd-timer@XXX {
		compatible = "arm,cortex-a9-twd-timer";
		reg = <SCU_BASE+0x600 0x10>;

Are the @XXX important? Can they be removed altogether?

Regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
