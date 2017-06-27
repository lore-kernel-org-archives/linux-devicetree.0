From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Date: Tue, 27 Jun 2017 15:07:40 -0700
Message-ID: <20170627220740.GA19461@roeck-us.net>
References: <20170627211734.60477-1-cbostic@linux.vnet.ibm.com>
 <20170627211734.60477-2-cbostic@linux.vnet.ibm.com>
 <20170627213216.GA4132@roeck-us.net>
 <6f2a77e0-e64c-70b7-812a-6a5e8a0b5e6f@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6f2a77e0-e64c-70b7-812a-6a5e8a0b5e6f-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 04:42:24PM -0500, Christopher Bostic wrote:
> 
> 
> On 6/27/17 4:32 PM, Guenter Roeck wrote:
> >On Tue, Jun 27, 2017 at 04:17:33PM -0500, Christopher Bostic wrote:
> >>Describe device tree optional properties:
> >>
> >>   * aspeed,arm-reet - ARM CPU reset on signal
> >>   * aspeed,soc-reset - SOC reset on signal
> >>   * aspeed,sys-reset - System reset on signal
> >>           Disabling system reset may be required in situations where
> >>           one of the other watchdog engines in the system is responsible
> >>           for this.
> >>   * aspeed,interrupt - Interrupt CPU on signal
> >>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
> >>   * aspeed,alt-boot - Boot from alternate block on signal
> >>
> >>Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> >>---
> >>v2 - Add 'aspeed,' prefix to all optional properties
> >>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> >>---
> >>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 25 ++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>index c5e74d7..555b8b4 100644
> >>--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>@@ -8,9 +8,34 @@ Required properties:
> >>   - reg: physical base address of the controller and length of memory mapped
> >>     region
> >>+Optional properties:
> >>+   Signal behavior - Whenever a timeout occurs, the watchdog can be programmed
> >>+   to generate 6 types of signals:
> >>+
> >>+ - aspeed,arm-reset:  If property is present then reset ARM CPU only.
> >>+
> >>+ - aspeed,soc-reset:  If property is present then reset SOC.
> >>+
> >>+ - aspeed,sys-reset:  If property is present then reset the entire chip.
> >>+                      In cases where one of the other watchdog engines
> >>+                      in the system is responsible for system reset it
> >>+                      may be required to not specify this property.
> >>+
> >>+ - aspeed,interrupt:  If property is present then interrupt CPU.
> >>+
> >>+ - aspeed,external-signal: If property is present then signal is sent to
> >>+                           external reset counter (only WDT1 and WDT2).
> >>+ - aspeed,alt-boot:    If property is present then boot from alternate block.
> >>+
> >>  Example:
> >>  	wdt1: watchdog@1e785000 {
> >>  		compatible = "aspeed,ast2400-wdt";
> >>  		reg = <0x1e785000 0x1c>;
> >>+		aspeed,arm-reset;
> >>+		aspeed,soc-reset;
> >>+		aspeed,sys-reset;
> >>+		aspeed,interrupt;
> >>+		aspeed,external-signal;
> >>+		aspeed,alt-boot;
> >Is that a bit mask or a value ? I would have thought that,
> >for example, a complete system reset would include the SoC reset,
> >and a SoC reset would include the ARM reset. Generating an
> >interrupt while at the same time resetting the system (or
> >part of it) doesn't seem to make much sense either.
> 
> No these aren't bitmasks.   The example was intended to indicate what could
> be used.
> In practice only a subset of each of these properties would make any sense.
> How
> would you suggest the example be formatted to convey that? Multiple examples
> I suppose.
> 

I would just pick one (which is perfectly fine). After all, it is an example.

Reminds me: Is there a default (eg the chip's default configuration) ?
In other words, what is expected to happen if none of the properties
is specified ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
