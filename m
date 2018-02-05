From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fbdev: simplefb: add support for 'memory-region'
 property on DT node
Date: Mon, 5 Feb 2018 00:09:14 -0600
Message-ID: <20180205060914.4wherneafj6dfnev@rob-hp-laptop>
References: <CGME20180123113510epcas1p1fc8a6e3ad50127bb84fe350b156a8c07@epcas1p1.samsung.com>
 <1516707296-23667-1-git-send-email-hayashi.kunihiko@socionext.com>
 <2359956.Z9lQWSAgHb@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2359956.Z9lQWSAgHb@amdc3058>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 04:56:08PM +0100, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Tuesday, January 23, 2018 08:34:56 PM Kunihiko Hayashi wrote:
> > Enables 'memory-region' property referring to the memory description on
> > the reserved-memory node in case of devicetree use.
> > If there is no 'reg' property that specifies the address and size of
> > the framebuffer, the address and size written in the memory description
> > on the reserved-memory node can be used for the framebuffer.
> > 
> > Furthermore, the reserved-memory node needs to have "no-map" attributes
> > because simplefb driver maps the region by ioremap_wc().
> > 
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> 
> This needs an ACK from Rob or Mark (DT bindings Maintainers).
> 
> > ---
> >  .../bindings/display/simple-framebuffer.txt        |  3 ++
> >  drivers/video/fbdev/simplefb.c                     | 32 ++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.txt b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
> > index 5a9ce51..be5139f 100644
> > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.txt
> > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
> > @@ -56,6 +56,9 @@ Optional properties:
> >    framebuffer remains active.
> >  
> >  - display : phandle pointing to the primary display hardware node
> > +- memory-region: phandle to a node describing memory region as framebuffer
> > +		 memory instead of reg property. The node should include
> > +		 'no-map'.

This should also state when it's appropriate to use this instead of reg. 
The memory would only be reclaimed if reg is used.

Though I'm wondering what keeps the simple fb memory from getting used 
by the OS if reserved memory is not always used.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
