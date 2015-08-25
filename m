From: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] watchdog: bcm7038: add device tree binding
 documentation
Date: Tue, 25 Aug 2015 10:55:40 -0700
Message-ID: <20150825175538.GA16266@Justins-MacBook-Pro.local>
References: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
 <1440092486-16905-2-git-send-email-justinpopo6@gmail.com>
 <55DA9045.2060107@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DA9045.2060107-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 23, 2015 at 08:32:21PM -0700, Guenter Roeck wrote:
> Hi Justin,
> 
> On 08/20/2015 10:41 AM, Justin Chen wrote:
> >Add device tree binding docmentation for the watchdog hardware block
> >on bcm7038 and newer SoCs.
> >
> >Signed-off-by: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >---
> >  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> >
> >diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> >new file mode 100644
> >index 0000000..adb8260
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> >@@ -0,0 +1,19 @@
> >+BCM7038 Watchdog timer
> >+
> >+Required properties:
> >+
> >+- compatible : should be "brcm,bcm7038-wdt"
> >+- reg : Specifies base physical address and size of the registers.
> >+
> >+Optional properties:
> >+
> >+- clocks: the clock running the watchdog
> >+- clock-frequency: the rate of the clock
> 
> Is 'clock-frequency' really needed (and useful), or would it make more sense
> to expect the user to configure a fixed clock if nothing else is available ?
> How do other drivers handle this ?
> 
> Thanks,
> Guenter
> 
> >+
> >+Example:
> >+
> >+watchdog {
> >+	compatible = "brcm,bcm7038-wdt";
> >+	clocks = <&upg_fixed>;
> >+	reg = <0xf040a7e8 0x16>;
> >+};
> >
>

Hello Guenter,

> Is 'clock-frequency' really needed (and useful), or would it make more sense
> to expect the user to configure a fixed clock if nothing else is available ?
> How do other drivers handle this ?

The reason for 'clock-frequency' was for a case where our device tree did not
have clocks. Creating a new fixed clock for a single device seems unnecessary
compared to a 'clock-frequency' property. Their is a use for 'clock-frequency',
but it is not really necessary. However, this is my first linux patch, so I do 
not fully trust my judgement on this...

Looking at other drivers, none of them have both clock and clock-frequency.

Thank you for your time on reviewing the patch Guenter. Much appreciated!

Thanks,
Justin Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
