From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v5 2/4] drm: bridge: add support for TI ths8135
Date: Wed, 07 Dec 2016 16:23:16 +0200
Message-ID: <2593175.GXXQ1USl1T@avalon>
References: <1481107365-24839-1-git-send-email-bgolaszewski@baylibre.com> <1481107365-24839-3-git-send-email-bgolaszewski@baylibre.com> <CAMpxmJX9b3UqNz_nERH-N58Yw3jkSZ1P+PjjA51x3wTC0So7mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMpxmJX9b3UqNz_nERH-N58Yw3jkSZ1P+PjjA51x3wTC0So7mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

Thank you for the patch.

On Wednesday 07 Dec 2016 11:45:11 Bartosz Golaszewski wrote:
> 2016-12-07 11:42 GMT+01:00 Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>:
> > THS8135 is a configurable video DAC. Add DT bindings for this chip and
> > use the dumb-vga-dac driver for now as no configuration is required to
> > make it work.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> > 
> >  .../bindings/display/bridge/ti,ths8135.txt         | 52 +++++++++++++++++
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c              |  1 +

You might be asked by DT maintainers to split this in two, but regardless of 
whether it's one patch or two, you can add my

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> >  2 files changed, 53 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
> > b/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt new
> > file mode 100644
> > index 0000000..23cd8ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
> > @@ -0,0 +1,52 @@
> > +THS8135 Video DAC
> > +-----------------
> > +
> > +This is the binding for Texas Instruments THS8135 Video DAC bridge.
> > +
> > +Required properties:
> > +
> > +- compatible: Must be "ti,ths8135"
> > +
> > +Required nodes:
> > +
> > +This device has two video ports. Their connections are modelled using the
> > OF +graph bindings specified in
> > Documentation/devicetree/bindings/graph.txt. +
> > +- Video port 0 for RGB input
> > +- Video port 1 for VGA output
> > +
> > +Example
> > +-------
> > +
> > +vga-bridge {
> > +       compatible = "ti,ths8135";
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +
> > +       ports {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               port@0 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0>;
> > +
> > +                       vga_bridge_in: endpoint@0 {
> > +                               reg = <0>;
> > +                               remote-endpoint = <&lcdc_out_vga>;
> > +                       };
> > +               };
> > +
> > +               port@1 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <1>;
> > +
> > +                       vga_bridge_out: endpoint@0 {
> > +                               reg = <0>;
> > +                               remote-endpoint = <&vga_con_in>;
> > +                       };
> > +               };
> > +       };
> > +};
> > diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > b/drivers/gpu/drm/bridge/dumb-vga-dac.c index afec232..498fa75 100644
> > --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > @@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device
> > *pdev)> 
> >  static const struct of_device_id dumb_vga_match[] = {
> >  
> >         { .compatible = "dumb-vga-dac" },
> > 
> > +       { .compatible = "ti,ths8135" },
> > 
> >         {},
> >  
> >  };
> >  MODULE_DEVICE_TABLE(of, dumb_vga_match);
> > 
> > --
> > 2.9.3
> 
> + Maxime
> 
> Sorry, I forgot to include your e-mail.
> 
> Bartosz

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
