From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 5/5] Documentation: dt-bindings: phy: add YAML TI PHY
 binding
Date: Tue, 8 Sep 2015 09:47:00 -0400
Message-ID: <20150908134700.GC17267@beef>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-6-git-send-email-mporter@konsulko.com>
 <CA+bK7J5jz0wxgA-0jY4LFUWWoTk4YzGaGSQZsdF83BnomoBx6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+bK7J5jz0wxgA-0jY4LFUWWoTk4YzGaGSQZsdF83BnomoBx6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 01, 2015 at 10:42:25AM -0700, Tim Bird wrote:
> On Thu, Aug 27, 2015 at 10:23 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Convert the ti-phy.txt binding to standard YAML DT binding
> > format. This binding references the YAML generic PHY binding.
> >
> > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/phy/ti-phy.yaml | 166 ++++++++++++++++++++++
> >  1 file changed, 166 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/ti-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/ti-phy.yaml b/Documentation/devicetree/bindings/phy/ti-phy.yaml
> > new file mode 100644
> > index 0000000..ec93501
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/ti-phy.yaml
> > @@ -0,0 +1,166 @@
> > +%YAML 1.2
> > +---
> > +id: omap-control-phy
> > +
> > +title: OMAP Control PHY
> > +
> > +compatible:
> > +  - name: "ti,control-phy-otghs"
> > +    description: if it has otghs_control mailbox register as on OMAP4.
> > +  - name: "ti,control-phy-usb2"
> > +    description: if it has Power down bit in control_dev_conf register
> > +                 e.g. USB2_PHY on OMAP5.
> > +  - name: "ti,control-phy-pipe3"
> > +    description: if it has DPLL and individual Rx & Tx power control
> > +                 e.g. USB3 PHY and SATA PHY on OMAP5.
> > +  - name: "ti,control-phy-pcie"
> > +    description: for pcie to support external clock for pcie and to
> > +                 set PCS delay value. e.g. PCIE PHY in DRA7x
> > +  - name: "ti,control-phy-usb2-dra7"
> > +    description: if it has power down register like USB2 PHY on DRA7
> > +                 DRA7 platform.
> > +  - name: "ti,control-phy-usb2-am437"
> > +    description: if it has power down register like USB2 PHY on AM437
> > +                 platform.
> 
> I'm confused.  If these descriptions are multi-line, don't they need the '>'
> syntax?

Consider that a bug ;) Yes, they should have '>'. Since I'm just using
the default core yaml schema validator this is perfectly legal when I
run it through yaml. It would mess up formating when output to a
document.


> Also, I'm still confused by the "name:" field in this section.  These are
> possible *values* for the compatible property, not the name of the field,
> as all other property descriptions are.

Ok, so that's a legacy artifact of several incarnations of these tags
before I posted initially. I agree, it should be "string" or "value",
probably the latter as you suggest.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
