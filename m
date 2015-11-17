From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: DT: Add entry for ARM SP805-WDT
Date: Mon, 16 Nov 2015 18:14:39 -0600
Message-ID: <20151117001439.GA26823@rob-hp-laptop>
References: <1447683883-6600-1-git-send-email-bhupesh.sharma@freescale.com>
 <1447683883-6600-2-git-send-email-bhupesh.sharma@freescale.com>
 <20151116144525.GM20696@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151116144525.GM20696@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 02:45:25PM +0000, Mark Rutland wrote:
> On Mon, Nov 16, 2015 at 07:54:42PM +0530, Bhupesh Sharma wrote:
> > This patch adds a devicetree binding documentation for ARM's
> > SP805 WatchDog Timer.
> > 
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../devicetree/bindings/watchdog/sp805-wdt.txt     |   33 ++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt b/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> > new file mode 100644
> > index 0000000..ec70fe9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> > @@ -0,0 +1,33 @@
> > +* ARM SP805 Watchdog Timer (WDT) Controller
> > +
> > +SP805 WDT is a ARM Primecell Peripheral and has a standard-id register that
> > +can be used to identify the peripheral type, vendor, and revision.
> > +This value can be used for driver matching.
> > +
> > +Note that the current sp805_wdt driver relies on the 'drivers/amba/bus.c'
> > +framework to invoke the probe function of the sp805_wdt driver using the
> > +unique PRIMECELL identifiers of the sp805 wdt IP.
> 
> This paragraph can go. We shouldn't describe kernel internals.
> 
> > +As SP805 WDT is a primecell IP, it follows the base bindings specified in
> > +'arm/primecell.txt'
> > +
> > +Required properties:
> > +- compatible : Should be "arm,sp805-wdt", "arm,primecell"
> > +- reg : Base address and size of the watchdog timer registers.
> > +- interrupts : Should specify WDT interrupt number.
> > +
> > +Optional properties:
> > +- clocks : From common clock binding. First clock is phandle to clock for apb
> > +           pclk. Additional clocks are optional.
> > +- clock-names : From common clock binding. Shall be "apb_pclk" for first clock.
> 
> The hardware has "WDOGCLK", which is what the driver appears to expect
> first implicitly.

The h/w has 2 clocks, PCLK and WDOGCLK, so both should be described and 
neither should be optional.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
