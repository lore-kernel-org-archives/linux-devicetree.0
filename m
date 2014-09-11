From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 8/8] rtc: at91sam9: add DT bindings documentation
Date: Thu, 11 Sep 2014 11:56:28 +0200
Message-ID: <20140911115628.110a403b@bbrezillon>
References: <1410425767-17874-1-git-send-email-boris.brezillon@free-electrons.com>
	<1410425767-17874-9-git-send-email-boris.brezillon@free-electrons.com>
	<20140911094213.GC12295@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140911094213.GC12295@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Sep 2014 11:42:13 +0200
Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Thu, Sep 11, 2014 at 10:56:07AM +0200, Boris BREZILLON wrote:
> > Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> > new file mode 100644
> > index 0000000..258a036
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> > @@ -0,0 +1,24 @@
> > +Atmel AT91SAM9260 Real Time Timer
> > +
> > +Required properties:
> > +- compatible: should be: "atmel,at91sam9260-rtt"
> > +- reg: should encode the memory region of the RTT controller
> > +- interrupts: rtc alarm/event interrupt
> > +- clocks: should contain one clock pointing the the slow clk
> > +- atmel,time-reg: should encode the GPBR register used to store the RTC
> > +		  time. The first cell should point to the GPBR node and
> > +		  the second one encode the offset within the GPBR block
> > +		  (or in other terms, the GPBR register used to store the
> > +		  current time value).
> > +
> > +
> > +
> > +Example:
> > +
> > +rtc@fffffe00 {
> 
> This should be rtt@
> 
> > +	compatible = "atmel,at91sam9260-rtt";
> > +	reg = <0xfffffd20 0x10>;
> > +	interrupts = <1 4 7>;
> > +	clocks = <&clk32k>;
> > +	atmel,time-reg = <&gpbr 0x0>;
> 
> I think the property name could be more descriptive as it is specific to
> when the RTT is used as an RTC. Perhaps, atmel,rtt-rtc-time-reg?

No problem, I'll change both names for the next version.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
