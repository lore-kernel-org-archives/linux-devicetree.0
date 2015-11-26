From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 13:59:57 +0000
Message-ID: <20151126135957.GC8644@n2100.arm.linux.org.uk>
References: <56570620.3070106@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56570620.3070106-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 02:16:16PM +0100, Mason wrote:
> #define SCU_BASE 0x20000000
> 
> 	scu: scu@XXX {
> 		compatible = "arm,cortex-a9-scu";
> 		reg = <SCU_BASE 0x100>;
> 	
> 	gic: interrupt-controller@XXX {
> 		compatible = "arm,cortex-a9-gic";
> 		reg = <SCU_BASE+0x1000 0x1000>, <SCU_BASE+0x100 0x0100>;

You don't get preprocessor arithmetic here.  What you get is this passed
to DTC:

		reg = <0x20000000+0x1000 0x1000>...

The only time the preprocessor does arithmetic is when it needs to
evaluate an expression, eg, in an #if statement.

The @XXX are part of the requirements from ePAPR, and are required to
be conformant with the spec.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
