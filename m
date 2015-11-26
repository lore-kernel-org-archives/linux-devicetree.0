From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 13:52:54 +0000
Message-ID: <20151126135254.GD32343@leverpostej>
References: <56570620.3070106@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56570620.3070106-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 02:16:16PM +0100, Mason wrote:
> Hello,
> 
> In the device tree for my ARM platform, I have several nodes with
> addresses within the SCU block:
> 
> 	scu: scu@20000000 {
> 		compatible = "arm,cortex-a9-scu";
> 		reg = <0x20000000 0x100>;
> 
> 	gic: interrupt-controller@20001000 {
> 		compatible = "arm,cortex-a9-gic";
> 		reg = <0x20001000 0x1000>, <0x20000100 0x0100>;
> 
> 	twd-timer@20000600 {
> 		compatible = "arm,cortex-a9-twd-timer";
> 		reg = <0x20000600 0x10>;
> 
> Can I use preprocessor arithmetic to abstract the base address,
> as would be done in C?
> 
> #define SCU_BASE 0x20000000
> 
> 	scu: scu@XXX {
> 		compatible = "arm,cortex-a9-scu";
> 		reg = <SCU_BASE 0x100>;
> 	
> 	gic: interrupt-controller@XXX {
> 		compatible = "arm,cortex-a9-gic";
> 		reg = <SCU_BASE+0x1000 0x1000>, <SCU_BASE+0x100 0x0100>;

The pre-processor would only do substitution, not arithmetic. So the '+'
would flow all the way to DTC.

DTC does have some basic integer expression support (see [1]), but it
looks like it can only work at the cell level, so generally it needs to
be avoided (in case #address-cells >1, for example).

So generally I think that such arithmetic should be avoided.

> 	twd-timer@XXX {
> 		compatible = "arm,cortex-a9-twd-timer";
> 		reg = <SCU_BASE+0x600 0x10>;
> 
> Are the @XXX important? Can they be removed altogether?

The bit after the @ is called the unit-address.

It's meant to be there (matching the base address of the first reg
entry) to disambiguate nodes and make it simple to figure out where a
node lives in the physical address space.

They should stay.

Thanks,
Mark.

[1] https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git/commit/?id=5f0c3b2d6235dec65fff1628a97f45e21680b36d
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
