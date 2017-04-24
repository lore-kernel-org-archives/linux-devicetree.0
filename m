From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: add support for NLT
 NL192108AC18-02D
Date: Mon, 24 Apr 2017 15:21:42 +0200
Message-ID: <1493040102.2891.15.camel@pengutronix.de>
References: <20170412171526.32393-1-l.stach@pengutronix.de>
         <20170412171526.32393-2-l.stach@pengutronix.de>
         <20170419211518.uie37orpqwda3qaa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419211518.uie37orpqwda3qaa@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Mittwoch, den 19.04.2017, 16:15 -0500 schrieb Rob Herring:
> On Wed, Apr 12, 2017 at 07:15:26PM +0200, Lucas Stach wrote:
> > This adds support for the NLT Technologies NL192108AC18-02D
> > 15.6" LVDS FullHD TFT LCD panel, which can be supported
> > by the simple panel driver.
> > 
> > Timings are taken from the preliminary datasheet, as a final
> > one is not yet available.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  .../display/panel/nlt,nl192108ac18-02d.txt         |  7 ++++++
> >  drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
> >  2 files changed, 36 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
> > new file mode 100644
> > index 000000000000..edc34fbd2131
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt
> > @@ -0,0 +1,7 @@
> > +NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> > +
> > +Required properties:
> > +- compatible: should be "nlt,nl192108ac18-02d"
> 
> Please define the power supply. Is power-supply used or are there 
> multiple supplies?

How would you like to have that done? I thought that the sentence below
is clear enough that this panel uses the simple panel binding where the
power-supply property is non-optional. To me it feels a bit redundant to
say in this binding document that, yes this panel is compatible to the
binding it claims to be compatible with.

And yes, this panel has a single supply for the digital logic.

> > +
> > +This binding is compatible with the simple-panel binding, which is specified
> > +in simple-panel.txt in this directory.

Regards,
Lucas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
