From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] dt-bindings: add binding
 documentation for Allwinner CSI
Date: Wed, 19 Jul 2017 09:22:49 +0800
Message-ID: <20170719092249.2fb6ec720ba1b194cea320c8@magewell.com>
References: <1498561654-14658-1-git-send-email-yong.deng@magewell.com>
	<1498561654-14658-3-git-send-email-yong.deng@magewell.com>
	<20170718115530.ssy7g5vv4siqnfpo@tarshish>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBB5HIXLFQKGQEKO4MA2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170718115530.ssy7g5vv4siqnfpo@tarshish>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org, kieran+renesas-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 18 Jul 2017 14:55:30 +0300
Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:

> Hi Yong,
> 
> I am trying to get this driver working on the Olimex A33 OLinuXino. I didn't 
> get it working yet, but I had some progress. See the comment below on one 
> issue I encountered.
> 
> On Tue, Jun 27, 2017 at 07:07:34PM +0800, Yong Deng wrote:
> > Add binding documentation for Allwinner CSI.
> > 
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/sunxi-csi.txt        | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/sunxi-csi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/sunxi-csi.txt b/Documentation/devicetree/bindings/media/sunxi-csi.txt
> > new file mode 100644
> > index 0000000..770be0e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/sunxi-csi.txt
> > @@ -0,0 +1,51 @@
> > +Allwinner V3s Camera Sensor Interface
> > +------------------------------
> > +
> > +Required properties:
> > +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> > +  - reg: base address and size of the memory-mapped region.
> > +  - interrupts: interrupt associated to this IP
> > +  - clocks: phandles to the clocks feeding the CSI
> > +    * ahb: the CSI interface clock
> > +    * mod: the CSI module clock
> > +    * ram: the CSI DRAM clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset line driving the CSI
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoints, the second one the outputs
> > +
> > +Example:
> > +
> > +	csi1: csi@01cb4000 {
> > +		compatible = "allwinner,sun8i-v3s-csi";
> > +		reg = <0x01cb4000 0x1000>;
> 
> You use platform_get_resource_byname() to get this IO resource. This requires 
> adding mandatory
> 
>   reg-names = "csi";
> 
> But is it actually needed? Wouldn't a simple platform_get_resource() be 
> enough?

You are right.
This will be fixed in the next version.
I am waiting for more comments for the sunxi-csi.h. It's pleasure if
you have any suggestions about it.
