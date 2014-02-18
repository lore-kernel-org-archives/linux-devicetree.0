From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt/bindings: update fsl-fec regarding compatible and
 clocks
Date: Tue, 18 Feb 2014 10:09:04 +0800
Message-ID: <20140218020901.GA15716@S2101-09.ap.freescale.net>
References: <1392033008-20752-1-git-send-email-shawn.guo@linaro.org>
 <20140217212439.GZ4524@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217212439.GZ4524-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 10:24:39PM +0100, Gerhard Sittig wrote:
> On Mon, Feb 10, 2014 at 19:50 +0800, Shawn Guo wrote:
> > 
> > Update fsl-fec to explicitly list the supported compatible strings
> > and add missing 'clocks' and 'clock-names' properties.  It does not
> > change anything about how kernel drive works.  Instead, it just reflects
> > how kernel driver works today.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/net/fsl-fec.txt |   19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
> > index 845ff84..3ebd395 100644
> > --- a/Documentation/devicetree/bindings/net/fsl-fec.txt
> > +++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
> > @@ -1,9 +1,26 @@
> >  * Freescale Fast Ethernet Controller (FEC)
> >  
> >  Required properties:
> > -- compatible : Should be "fsl,<soc>-fec"
> > +- compatible : Should contain one of the following:
> > +		"fsl,imx25-fec"
> > +		"fsl,imx27-fec"
> > +		"fsl,imx28-fec"
> > +		"fsl,imx6q-fec"
> > +		"fsl,mvf600-fec"
> 
> This appears to miss all the PowerPC based SoCs.  See
>   git grep 'fsl,.*-fec' arch/*/boot/dts

Hmm, this is a binding for IMX FEC/ENET, and the driver is
drivers/net/ethernet/freescale/fec_main.c.  I think I've listed all the
compatibles that the driver supports.

> 
> >  - reg : Address and length of the register set for the device
> >  - interrupts : Should contain fec interrupt
> > +- clocks: phandle to the clocks feeding the FEC controller and phy. The
> > +  following two are required:
> > +   - "ipg": the peripheral access clock
> > +   - "ahb": the bus clock for MAC
> > +  The following two are optional:
> > +   - "ptp": the sampling clock for PTP (IEEE 1588).  On SoC like i.MX6Q,
> > +     the clock could come from either the internal clock control module
> > +     or external oscillator via pad depending on board design.
> > +   - "enet_out": the phy reference clock provided by SoC via pad, which
> > +     is available on SoC like i.MX28.
> > +- clock-names: Must contain the clock names described just above
> > +
> 
> Listing 'clocks' under the "required properties" all of a sudden
> invalidates existing device trees, if they don't carry the
> property which before the change was not required, not even
> documented.

Since the day we move to device tree clock lookup, the driver fec_main
does not probe at all if the property is absent.

> 
> The PowerPC based chips probably have differing sets of clocks.
> I'm aware of the MPC512x, where one "per" clock is sufficient,
> and even this spec is optional.  Other machines may not have yet
> been converted to CCF.

Again, the binding is created for IMX FEC/ENET controller and the driver
fec_main, so I'm not sure you should look at this binding for
PowerPC/MPC512x stuff at all.

> 
> Your description needs to get rephrased, it triggers Mark
> Rutland's regular "clocks are not just phandles" reply.  See how
> he suggested quite a few times a better wording.

Can you give a pointer or good example?  I worded it following an
example [1] found on recent linux-next/spi tree. 

Shawn

[1] https://git.kernel.org/cgit/linux/kernel/git/broonie/spi.git/commit/?h=topic/sunxi&id=3558fe900e8af6c3bfadeff24a12ffb19ac9b108

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
