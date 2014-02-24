From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt/bindings: fsl-fec: add clock properties
Date: Mon, 24 Feb 2014 16:34:24 +0800
Message-ID: <20140224083422.GG25011@S2101-09.ap.freescale.net>
References: <1393206490-25234-1-git-send-email-shawn.guo@linaro.org>
 <20140224075337.GN17250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140224075337.GN17250-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 08:53:37AM +0100, Sascha Hauer wrote:
> On Mon, Feb 24, 2014 at 09:48:10AM +0800, Shawn Guo wrote:
> > Update fsl-fec.txt to add 'clocks' and 'clock-names' properties.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > Changes since v1:
> >  - Leave compatible change out, which should probably be addressed by
> >    another patch
> >  - Move clock properties into 'Optional properties:' section
> 
> As mentioned in the reply to v1: Marking the clocks as optional doesn't
> make sense when the driver actually requires them (Or be prepared when
> somebody sends in a patch 'fixing' the driver according to the binding).
> IMO we should just mention the clocks are optional on PowerPC.

Okay, the whole thing becomes quite uncertain to me.  The reason of this
v2 is that I got reminded by Gerhard's comment that we've had a time the
driver works with DT without these properties.  At that time, the clock
driver provides the clock lookups for the device by calling
clk_register_clkdev().  But on the other hand, I agree with you that it
does not make sense to binding users, because the IP requires these
clock inputs when it gets integrated on a SoC, and the driver requires
these clocks to work.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
