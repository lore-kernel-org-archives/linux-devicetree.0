From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 15:44:28 +0100
Message-ID: <56571ACC.9080306@free.fr>
References: <56570620.3070106@free.fr>
 <20151126135957.GC8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151126135957.GC8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/11/2015 14:59, Russell King - ARM Linux wrote:
> On Thu, Nov 26, 2015 at 02:16:16PM +0100, Mason wrote:
>> #define SCU_BASE 0x20000000
>>
>> 	scu: scu@XXX {
>> 		compatible = "arm,cortex-a9-scu";
>> 		reg = <SCU_BASE 0x100>;
>> 	
>> 	gic: interrupt-controller@XXX {
>> 		compatible = "arm,cortex-a9-gic";
>> 		reg = <SCU_BASE+0x1000 0x1000>, <SCU_BASE+0x100 0x0100>;
> 
> You don't get preprocessor arithmetic here.  What you get is this passed
> to DTC:
> 
> 		reg = <0x20000000+0x1000 0x1000>...
> 
> The only time the preprocessor does arithmetic is when it needs to
> evaluate an expression, eg, in an #if statement.

Doh! Brain malfunction. No arithmetic indeed.
Working with the preprocessor would have to involve token-pasting.

#define SCU_BASE(OFFSET)	2000##OFFSET
#define SCU_BASEX(OFFSET)	0x2000##OFFSET

	gic: interrupt-controller@SCU_BASE(1000) {
		reg = <SCU_BASEX(1000) 0x1000>, <SCU_BASEX(0100) 0x0100>;
	};

My very own abomination!

Regards.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
