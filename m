From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
Date: Wed, 13 Jan 2016 03:39:17 +0100
Message-ID: <201601130339.17520.marex@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <20160113022608.GA17483@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113022608.GA17483@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
> On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
> > From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > 
> > Add binding document for the Cadence QSPI controller.
> > 
> > Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>
> > Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > 
> >  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56
> >  ++++++++++++++++++++++ 1 file changed, 56 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > 
> > V2: Add cdns prefix to driver-specific bindings.
> > V3: Use existing property "is-decoded-cs" instead of creating a
> > 
> >     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
> >     not master reference clocks. Remove bus-num completely.
> > 
> > V4: Add new properties fifo-width and trigger-address
> > V7: - Prefix all of the Cadence-specific properties with cdns prefix,
> > 
> >       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
> >       "cdns,fifo-width", "cdns,trigger-address".
> >     
> >     - Drop bogus properties which were not used and were incorrect.
> > 
> > V8: Align lines to 80 chars.
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt new file
> > mode 100644
> > index 0000000..f248056
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > @@ -0,0 +1,56 @@
> > +* Cadence Quad SPI controller
> > +
> > +Required properties:
> > +- compatible : Should be "cdns,qspi-nor".
> 
> Fine, but I expect to see SOCs using this block add their own compatible
> strings. It wouldn't surprise me that we already have some using this
> block.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I finally got an Ack on this, I am so happy :-)

As for the SoCs, there is Altera SoCFPGA Gen 5 and Gen 10 which uses this.
Then there is some TI SoC, but I don't know the model. Vignesh (on CC) would.
Then there is some ST SoC, but I have no idea what that's all about, sorry.

All these SoCs should be capable of tweaking the block to fit their needs
by just the DT properties. I believe they differ only in the FIFO depth and
sometimes someone is greedy and uses 4:16 CS multiplexer, which is an external
passive component, but that's all.

Would we need soc-specific compatible strings if this is the case?

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
