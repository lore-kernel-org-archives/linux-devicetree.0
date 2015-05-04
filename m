From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/6] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock/reset controllers
Date: Mon, 4 May 2015 10:38:52 +0200
Message-ID: <20150504083852.GJ4946@pengutronix.de>
References: <1429778143-2074-1-git-send-email-s.hauer@pengutronix.de>
 <1429778143-2074-7-git-send-email-s.hauer@pengutronix.de>
 <20150501012039.GG32407@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150501012039.GG32407-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, YH Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <Yingjoe.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 06:20:39PM -0700, Stephen Boyd wrote:
> On 04/23, Sascha Hauer wrote:
> > This adds the binding documentation for the apmixedsys, perisys and
> > infracfg controllers found on Mediatek SoCs.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Please Cc devicetree reviewers on bindings (CCed now).
> 
> > ---
> >  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  | 23 +++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,infracfg.txt    | 30 ++++++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,pericfg.txt     | 30 ++++++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,topckgen.txt    | 23 +++++++++++++++++
> >  4 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> > new file mode 100644
> > index 0000000..5af6d73
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> > @@ -0,0 +1,23 @@
> > +Mediatek apmixedsys controller
> > +==============================
> > +
> > +The Mediatek apmixedsys controller provides the PLLs to the system.
> > +
> > +Required Properties:
> > +
> > +- compatible: Should be:
> > +	- "mediatek,mt8135-apmixedsys"
> > +	- "mediatek,mt8173-apmixedsys"
> > +- #clock-cells: Must be 1
> > +
> > +The apmixedsys controller uses the common clk binding from
> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> > +
> > +Example:
> > +
> > +apmixedsys: apmixedsys@10209000 {
> 
> apmixedsys: clock-controller@10209000 {
> 
> would be more standard. The same comment applies throughout this
> patch. Otherwise it looks good to me.

For apmixed this I agree, but the others are also reset controllers, so
I'm not sure if clock-controller is appropriate. Personally I don't care
much, I'll change to whatever you like.

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
