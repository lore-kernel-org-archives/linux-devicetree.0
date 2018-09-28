From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v11 1/2] dt-bindings: media: Add Allwinner
 V3s Camera Sensor Interface (CSI)
Date: Fri, 28 Sep 2018 15:36:42 +0200
Message-ID: <20180928133642.3vmjm766cdm2oh6e@flea>
References: <1537951204-24672-1-git-send-email-yong.deng@magewell.com>
 <20180928093833.gwmskm2jvby6x4s6@paasikivi.fi.intel.com>
 <14114604.4rraf0qJLU@avalon>
 <20180928102345.r2g342tg5mgcwfw6@paasikivi.fi.intel.com>
 <CAGb2v65YpPRHb5YiGJhC8NX5F5i3+1rW5y6Dq5L+pNN3U_uLdQ@mail.gmail.com>
 <20180928125601.6ye5tvrmh57amvh5@paasikivi.fi.intel.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4W4XDOQKGQEK4N2KOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180928125601.6ye5tvrmh57amvh5-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-s
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for taking the time to review.

On Fri, Sep 28, 2018 at 03:56:01PM +0300, Sakari Ailus wrote:
> Hi Chen-Yu,
> 
> On Fri, Sep 28, 2018 at 07:10:58PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Sep 28, 2018 at 6:23 PM Sakari Ailus
> > <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> > >
> > > Hi Laurent,
> > >
> > > On Fri, Sep 28, 2018 at 12:45:12PM +0300, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > >
> > > > On Friday, 28 September 2018 12:38:33 EEST Sakari Ailus wrote:
> > > > > On Wed, Sep 26, 2018 at 04:40:04PM +0800, Yong Deng wrote:
> > > > > > Add binding documentation for Allwinner V3s CSI.
> > > > > >
> > > > > > Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > > > > > Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > > >
> > > > > I know... but I have a few more comments.
> > > > >
> > > > > > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > > > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > > > > > ---
> > > > > >
> > > > > >  .../devicetree/bindings/media/sun6i-csi.txt        | 59 +++++++++++++++++
> > > > > >  1 file changed, 59 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > > > b/Documentation/devicetree/bindings/media/sun6i-csi.txt new file mode
> > > > > > 100644
> > > > > > index 000000000000..2ff47a9507a6
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > > > @@ -0,0 +1,59 @@
> > > > > > +Allwinner V3s Camera Sensor Interface
> > > > > > +-------------------------------------
> > > > > > +
> > > > > > +Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
> > > > > > +interface and CSI1 is used for parallel interface.
> > > > > > +
> > > > > > +Required properties:
> > > > > > +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> > > > > > +  - reg: base address and size of the memory-mapped region.
> > > > > > +  - interrupts: interrupt associated to this IP
> > > > > > +  - clocks: phandles to the clocks feeding the CSI
> > > > > > +    * bus: the CSI interface clock
> > > > > > +    * mod: the CSI module clock
> > > > > > +    * ram: the CSI DRAM clock
> > > > > > +  - clock-names: the clock names mentioned above
> > > > > > +  - resets: phandles to the reset line driving the CSI
> > > > > > +
> > > > > > +Each CSI node should contain one 'port' child node with one child
> > > > > > 'endpoint' +node, according to the bindings defined in
> > > > > > +Documentation/devicetree/bindings/media/video-interfaces.txt. As
> > > > > > mentioned
> > > > > > +above, the endpoint's bus type should be MIPI CSI-2 for CSI0 and parallel
> > > > > > or +Bt656 for CSI1.
> > > > >
> > > > > Which port represents CSI0 and which one is CSI1? That needs to be
> > > > > documented.
> > > >
> > > > There are two CSI devices, named CSI0 and CSI1, with one port each. The CSI0
> > > > device supports CSI-2 only, and the CSI1 device parallel (BT.601 or BT.656)
> > > > only.
> > > >
> > > > > > +
> > > > > > +Endpoint node properties for CSI1
> > > > >
> > > > > How about CSI0? I'd expect at least data-lanes, and clock-lanes as well if
> > > > > the hardware supports lane mapping.
> > > >
> > > > I enquired about that too. As far as I understand, CSI0 isn't supported yet in
> > > > the driver due to lack of documentation and lack of open-source vendor-
> > > > provided source code. While DT bindings are not tied to driver
> > > > implementations, it's not the best idea to design DT bindings without at least
> > > > one working implementation to test them. I thus proposed just listing CSI0 as
> > > > being unsupported for now.
> > >
> > > Ack.
> > >
> > > We should still define which receiver corresponds to a given port. Probably
> > > 1 for CSI1 would make sense, in order to avoid changing the order the
> > > hardware already uses. 0 doesn't need to be documented no IMO.
> > >
> > > What do you think?
> > 
> > AFAICT it would be a completely seperate node, since they have different address
> > spaces, clocks and reset controls. So there's no possibility of confusion.
> > 
> > According to Yong, CSI0 is tied internally to some unknown MIPI CSI2-receiver,
> > which is the undocumented part. CSI1 has its parallel data pins exposed to the
> > outside.
> 
> Thanks for clearing up the confusion. If these are truly different kinds of
> devices, then don't they also deserve different compatible strings? And
> possibly also different DT binding documentation in a separate file.

It can, and will if it's ever supported, but I'm not quite sure what's
confusing you about those bindings. It never claims to support CSI0,
and we will only add a new document and compatible and whatever is
needed when we'll have the need for it?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
