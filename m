From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v6 02/39] [media] dt-bindings: Add bindings for i.MX
 media driver
Date: Wed, 29 Mar 2017 09:39:05 +0100
Message-ID: <20170329083904.GZ7909@n2100.armlinux.org.uk>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-3-git-send-email-steve_longerbeam@mentor.com>
 <CAL_JsqJm_JjuVPcOBERCqsnjTDdNoKr9xRE9MXMO4ivxGath2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJm_JjuVPcOBERCqsnjTDdNoKr9xRE9MXMO4ivxGath2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Nick Dyer <nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org>, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Simon Horman <horms+renesas@>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 07:21:34PM -0500, Rob Herring wrote:
> On Mon, Mar 27, 2017 at 7:40 PM, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Add bindings documentation for the i.MX media driver.
> >
> > Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/media/imx.txt | 74 +++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/imx.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
> > new file mode 100644
> > index 0000000..3059c06
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/imx.txt
> > @@ -0,0 +1,74 @@
> > +Freescale i.MX Media Video Device
> > +=================================
> > +
> > +Video Media Controller node
> > +---------------------------
> > +
> > +This is the media controller node for video capture support. It is a
> > +virtual device that lists the camera serial interface nodes that the
> > +media device will control.
> > +
> > +Required properties:
> > +- compatible : "fsl,imx-capture-subsystem";
> > +- ports      : Should contain a list of phandles pointing to camera
> > +               sensor interface ports of IPU devices
> > +
> > +example:
> > +
> > +capture-subsystem {
> > +       compatible = "fsl,imx-capture-subsystem";
> > +       ports = <&ipu1_csi0>, <&ipu1_csi1>;
> > +};
> > +
> > +fim child node
> > +--------------
> > +
> > +This is an optional child node of the ipu_csi port nodes. If present and
> > +available, it enables the Frame Interval Monitor. Its properties can be
> > +used to modify the method in which the FIM measures frame intervals.
> > +Refer to Documentation/media/v4l-drivers/imx.rst for more info on the
> > +Frame Interval Monitor.
> > +
> > +Optional properties:
> > +- fsl,input-capture-channel: an input capture channel and channel flags,
> > +                            specified as <chan flags>. The channel number
> > +                            must be 0 or 1. The flags can be
> > +                            IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, or
> > +                            IRQ_TYPE_EDGE_BOTH, and specify which input
> > +                            capture signal edge will trigger the input
> > +                            capture event. If an input capture channel is
> > +                            specified, the FIM will use this method to
> > +                            measure frame intervals instead of via the EOF
> > +                            interrupt. The input capture method is much
> > +                            preferred over EOF as it is not subject to
> > +                            interrupt latency errors. However it requires
> > +                            routing the VSYNC or FIELD output signals of
> > +                            the camera sensor to one of the i.MX input
> > +                            capture pads (SD1_DAT0, SD1_DAT1), which also
> > +                            gives up support for SD1.
> > +
> > +
> > +mipi_csi2 node
> > +--------------
> > +
> > +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
> > +CSI-2 sensors.
> > +
> > +Required properties:
> > +- compatible   : "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";
> 
> As I mentioned in v5, there's a DW CSI2 binding in progress. This
> needs to be based on that.

Maybe someone can provide some kind of reference to it, and it's
associated driver?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
