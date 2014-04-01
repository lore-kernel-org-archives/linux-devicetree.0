From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH RFC v4 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Tue, 1 Apr 2014 08:23:06 +0200
Message-ID: <20140401062306.GS17250@pengutronix.de>
References: <1396284116-19178-1-git-send-email-s.nawrocki@samsung.com>
 <1396284116-19178-3-git-send-email-s.nawrocki@samsung.com>
 <5339A036.6090703@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5339A036.6090703-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 06:04:54PM +0100, Ben Dooks wrote:
> On 31/03/14 17:41, Sylwester Nawrocki wrote:
> >This function adds a helper function to configure clock parents and rates
> >as specified in clock-parents, clock-rates DT properties for a consumer
> >device and a call to it before driver is bound to a device.
> 
> [snip]
> 
> tree/bindings/clock/clock-bindings.txt
> b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >index 700e7aa..59fbb4e 100644
> >--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >@@ -132,3 +132,45 @@ clock signal, and a UART.
> >    ("pll" and "pll-switched").
> >  * The UART has its baud clock connected the external oscillator and its
> >    register clock connected to the PLL clock (the "pll-switched" signal)
> >+
> >+==Assigned clock parents and rates==
> >+
> >+Some platforms require static initial configuration of parts of the clocks
> >+controller. Such a configuration can be specified in a clock consumer node
> >+through clock-parents and clock-rates DT properties. The former should
> >+contain a list of parent clocks in form of phandle and clock specifier pairs,
> >+the latter the list of assigned clock frequency values (one cell each).
> >+
> >+    uart@a000 {
> >+        compatible = "fsl,imx-uart";
> >+        reg = <0xa000 0x1000>;
> >+        ...
> >+        clocks = <&clkcon 0>, <&clkcon 3>;
> >+        clock-names = "baud", "mux";
> >+
> >+        clock-parents = <0>, <&pll 1>;
> >+        clock-rates = <460800>;
> >+    };
> >+
> >+In this example the pll is set as parent of "mux" clock and frequency of "baud"
> >+clock is specified as 460800 Hz.
> >+
> >+Configuring a clock parent and rate through the device node that uses
> >+the clock can be done only for clocks that have a single user. Specifying
> >+conflicting parent or rate configuration in multiple consumer nodes for
> >+a shared clock is forbidden.
> >+
> >+Configuration of common clocks, which affect multiple consumer devices
> >+can be specified in a dedicated 'assigned-clocks' subnode of a clock
> >+provider node, e.g.:
> >+
> >+    clkcon {
> >+        ...
> >+        #clock-cells = <1>;
> >+
> >+        assigned-clocks {
> >+            clocks = <&clkcon 16>, <&clkcon 17>;
> >+            clock-parents = <0>, <&clkcon 1>;
> >+            clock-rates = <200000>;
> >+        };
> >+    };
> 
> How do you support not-setting a rate for a clock?

Not setting a rate is supported by specifying the rate to 0. That should
be documented of course.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
