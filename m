From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v12 1/2] dt-bindings: media: Add Allwinner
 V3s Camera Sensor Interface (CSI)
Date: Fri, 23 Nov 2018 16:33:22 +0800
Message-ID: <20181123163322.318fd61d2dad525683a58ff1@magewell.com>
References: <1540887143-27904-1-git-send-email-yong.deng@magewell.com>
	<308184907.pMD7ZDI2dr@avalon>
	<20181123074514.GB6788@w540>
	<20181123160117.7eed41aac3e7e31e4e6d98be@magewell.com>
	<20181123081300.GC6788@w540>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBV7W33PQKGQEUBZTPUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181123081300.GC6788@w540>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Sakari Ailus <sakari.ailus-VuQAYsv1562vlLw7lfJaRg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi jacopo,

On Fri, 23 Nov 2018 09:13:00 +0100
jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:

> Hi Yong,
> 
> On Fri, Nov 23, 2018 at 04:01:17PM +0800, Yong wrote:
> > Hi jacopo,
> >
> > On Fri, 23 Nov 2018 08:45:14 +0100
> > jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> >
> > > Hi Yong,
> > >
> > > On Tue, Oct 30, 2018 at 03:06:24PM +0200, Laurent Pinchart wrote:
> > > > Hi Yong,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Tuesday, 30 October 2018 10:12:23 EET Yong Deng wrote:
> > > > > Add binding documentation for Allwinner V3s CSI.
> > > > >
> > > > > Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > > > > Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > > > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > >
> > > > > ---
> > > > >  .../devicetree/bindings/media/sun6i-csi.txt        | 56 +++++++++++++++++++
> > > > >  1 file changed, 56 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > > b/Documentation/devicetree/bindings/media/sun6i-csi.txt new file mode
> > > > > 100644
> > > > > index 000000000000..443e18c181b3
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > > > > @@ -0,0 +1,56 @@
> > > > > +Allwinner V3s Camera Sensor Interface
> > > > > +-------------------------------------
> > > > > +
> > > > > +Allwinner V3s SoC features a CSI module(CSI1) with parallel interface.
> > > > > +
> > > > > +Required properties:
> > > > > +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> > > > > +  - reg: base address and size of the memory-mapped region.
> > > > > +  - interrupts: interrupt associated to this IP
> > > > > +  - clocks: phandles to the clocks feeding the CSI
> > > > > +    * bus: the CSI interface clock
> > > > > +    * mod: the CSI module clock
> > > > > +    * ram: the CSI DRAM clock
> > > > > +  - clock-names: the clock names mentioned above
> > > > > +  - resets: phandles to the reset line driving the CSI
> > > > > +
> > > > > +The CSI node should contain one 'port' child node with one child 'endpoint'
> > > > > +node, according to the bindings defined in
> > > > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > > +
> > > > > +Endpoint node properties for CSI
> > > > > +---------------------------------
> > > > > +See the video-interfaces.txt for a detailed description of these
> > > > > properties. +- remote-endpoint	: (required) a phandle to the bus receiver's
> > > > > endpoint +			   node
> > > > > +- bus-width:		: (required) must be 8, 10, 12 or 16
> > > > > +- pclk-sample		: (optional) (default: sample on falling edge)
> > > > > +- hsync-active		: (required; parallel-only)
> > > > > +- vsync-active		: (required; parallel-only)
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +csi1: csi@1cb4000 {
> > > > > +	compatible = "allwinner,sun8i-v3s-csi";
> > > > > +	reg = <0x01cb4000 0x1000>;
> > > > > +	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +	clocks = <&ccu CLK_BUS_CSI>,
> > > > > +		 <&ccu CLK_CSI1_SCLK>,
> > > > > +		 <&ccu CLK_DRAM_CSI>;
> > > > > +	clock-names = "bus", "mod", "ram";
> > > > > +	resets = <&ccu RST_BUS_CSI>;
> > > > > +
> > > > > +	port {
> > > > > +		/* Parallel bus endpoint */
> > > > > +		csi1_ep: endpoint {
> > > > > +			remote-endpoint = <&adv7611_ep>;
> > > > > +			bus-width = <16>;
> > > > > +
> > > > > +			/* If hsync-active/vsync-active are missing,
> > > > > +			   embedded BT.656 sync is used */
> > >
> > > Am I confused? The properties description defines [v|h]sync-active as
> > > required, but the example reports that they can be omitted to use
> > > BT.656 synchronization.
> > >
> > > Which one of the following is correct?
> > > 1) [h|v]sync-active are mandatory: no BT.656 support can be selected.
> > > 2) [h|v]sync-active are optional, and if not specified BT.656 is
> > >    selected.
> > > 3) I am confused.
> > >
> >
> > hsync-active		: (required; parallel-only)
> > vsync-active		: (required; parallel-only)
> >
> > Here, parallel means seperate sync signal, BT.656 means embedded sync
> > signal. Kernel use these two properties to detect if the bus type is
> > parallel or Bt656. So [h|v]sync-active are mandatory only if your bus
> > type is parallel and must not be specified if your bus type is Bt656.
> 
> Well, BT.565 sync mode applies to parallel data transmission busses as
> BT.601 sync mode does... I don't want to bikeshed on terms though, I'm
> sorry...
> 
> I would have write here:
> 
> hsync-active		: Required when using explicit HSYNC synchronism
>                           signal. Default valuse is "high"/"low".
> vsync-active		: Required when using explicit VSYNC synchronism
>                           signal. Default valuse is "high"/"low".
> When both vsync-active and hsync-active are omitted BT.565 implicit
> synchronization mode is used.
> 
> To avoid confusing people already confused as I am :)
> 
> I got this patch is already in, right? Feel free to ignore my comment or
> either send an incremental patch if you think it is appropriate.
> 

As Laurent's mentioned in this thread, this is a problem in 
Documentation/devicetree/bindings/media/video-interfaces.txt in the 
first place. And he said he'll try to submit a patch for 
video-interfaces.txt.

Thanks,
Yong
