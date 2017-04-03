From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 02/39] [media] dt-bindings: Add bindings for i.MX
 media driver
Date: Mon, 3 Apr 2017 09:07:43 -0500
Message-ID: <20170403140743.trxep36s4z4piyl3@rob-hp-laptop>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-3-git-send-email-steve_longerbeam@mentor.com>
 <CAL_JsqJm_JjuVPcOBERCqsnjTDdNoKr9xRE9MXMO4ivxGath2Q@mail.gmail.com>
 <70bacfb5-aef1-76d1-37d2-23a524903d45@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <70bacfb5-aef1-76d1-37d2-23a524903d45-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Nick Dyer <nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org>, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 05:35:52PM -0700, Steve Longerbeam wrote:
> 
> 
> On 03/28/2017 05:21 PM, Rob Herring wrote:
> > On Mon, Mar 27, 2017 at 7:40 PM, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > Add bindings documentation for the i.MX media driver.
> > > 
> > > <snip>
> > > +
> > > +mipi_csi2 node
> > > +--------------
> > > +
> > > +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
> > > +CSI-2 sensors.
> > > +
> > > +Required properties:
> > > +- compatible   : "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";
> > 
> > As I mentioned in v5, there's a DW CSI2 binding in progress. This
> > needs to be based on that.
> 
> Hi Rob, I'm not sure what you are asking me to do.
> 
> I assume if there's another binding doc in progress, it means
> someone is working on another Synopsys DW CSI-2 subdevice driver.

Yes. see http://patchwork.ozlabs.org/patch/736177/

> Unfortunately I don't have the time to contribute and switch to
> this other subdevice, and do test/debug.

>From a DT perspective, I'm not asking that you share the subdevice 
driver, only the binding. Simply put, there's 1 h/w block here, so there 
should only be 1 binding. The binding is an ABI, so you can't just merge 
it and change it later.

The driver side is a decision for the V4L2 maintainers.

> For now I would prefer if this patchset is merged as is, and
> then contribute/switch to another CSI-2 subdev later. It is
> also getting very difficult managing all these patches (39 as
> of this version), and I'd prefer not to spam the lists with
> such large patchsets for too much longer.

Then maybe you should figure out how to split up the series. I've not 
looked at it to provide suggestions.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
