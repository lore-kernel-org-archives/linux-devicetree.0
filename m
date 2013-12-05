From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] DT: ATA: Add missing documentation of clocks to marvell
 binding.
Date: Thu, 5 Dec 2013 13:50:03 +0100
Message-ID: <20131205125003.GC15321@lunn.ch>
References: <1386244271-16127-1-git-send-email-andrew@lunn.ch>
 <20131205122254.GN29200@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131205122254.GN29200-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 12:22:54PM +0000, Mark Rutland wrote:
> On Thu, Dec 05, 2013 at 11:51:11AM +0000, Andrew Lunn wrote:
> > The marvell SATA driver can optionally make use of clocks specified in
> > the DT node. This has been available in the driver since Febuary 2012,
> > but the documentation is missing from the binding. Add it.
> > 
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> > FYI: This will cause merge conflicts with the SATA PHY driver comming soon.
> > ---
> >  Documentation/devicetree/bindings/ata/marvell.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ata/marvell.txt b/Documentation/devicetree/bindings/ata/marvell.txt
> > index b5cdd20cde9c..f6c68d157749 100644
> > --- a/Documentation/devicetree/bindings/ata/marvell.txt
> > +++ b/Documentation/devicetree/bindings/ata/marvell.txt
> > @@ -6,11 +6,17 @@ Required Properties:
> >  - interrupts    : Interrupt controller is using
> >  - nr-ports      : Number of SATA ports in use.
> >  
> > +Optional Properties:
> > +- clocks        : List of pHandles to clocks
> 
> s/pHandle/phandle/. Don't forget the clock-specifier too!
> 
> > +- clock-names   : Must be "0", "1", mapping port number to clock.
> 
> This line leads to the erroneous impression that the clocks can be in
> arbitrary order (as is generally true for bindings with clock-names
> properties). The driver doesn't request clocks by name, and doesn't even
> look at clock-names.

The driver does:

                sprintf(port_number, "%d", port);
                hpriv->port_clks[port] = clk_get(&pdev->dev, port_number);

and:

153 struct clk *clk_get(struct device *dev, const char *con_id)
154 {
155         const char *dev_id = dev ? dev_name(dev) : NULL;
156         struct clk *clk;
157 
158         if (dev) {
159                 clk = of_clk_get_by_name(dev->of_node, con_id);
160                 if (!IS_ERR(clk) && __clk_get(clk))
161                         return clk;
162         }
163 
164         return clk_get_sys(dev_id, con_id);
165 }

So the names are used. And since names are used, the ordering is
arbitrary.

> I also think the names could be improved, albeit slightly ("port0" is a
> little clearer than "0").

I could do this, but this binding has been in use for well over a year
now. I'm just retro-actively documenting it. I can add support for
both "0" and "port0", in order to keep backwards compatibility, but it
obviously makes the driver messy. Is it worth it?

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
