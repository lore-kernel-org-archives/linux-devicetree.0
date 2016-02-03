From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 17/26] drm: sun4i: Add DT bindings documentation
Date: Wed, 3 Feb 2016 20:59:19 +0100
Message-ID: <20160203195919.GB3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-18-git-send-email-maxime.ripard@free-electrons.com>
 <20160115031515.GA19797@rob-hp-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBGNYZG2QKGQECASZTRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160115031515.GA19797@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Rob,

On Thu, Jan 14, 2016 at 09:15:15PM -0600, Rob Herring wrote:
> On Thu, Jan 14, 2016 at 04:25:00PM +0100, Maxime Ripard wrote:
> > The display pipeline of the Allwinner A10 is involving several loosely
> > coupled components.
> > 
> > Add a documentation for the bindings.
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../bindings/display/sunxi/sun4i-drm.txt           | 228 +++++++++++++++++++++
> 
> drm is a linuxism. It shouldn't be used for binding doc.

Ack

> >  1 file changed, 228 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > new file mode 100644
> > index 000000000000..061bc87147a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -0,0 +1,228 @@
> > +Allwinner A10 Display Pipeline
> > +==============================
> > +
> > +The Allwinner A10 Display pipeline is composed of several components
> > +that are going to be documented below:
> > +
> > +TV Encoder
> > +----------
> > +
> > +The TV Encoder supports the composite and VGA output. It is one end of
> > +the pipeline.
> > +
> > +Required properties:
> > + - compatible: value should be "allwinner,sun4i-a10-tv-encoder".
> > + - reg: base address and size of memory-mapped region
> > + - clocks: the clocks driving the TV encoder
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoint.
> > +
> > +TCON
> > +----
> > +
> > +The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
> > +
> > +Required properties:
> > + - compatible: value should be "allwinner,sun4i-a10-tcon".
> > + - reg: base address and size of memory-mapped region
> > + - interrupts: interrupt associated to this IP
> > + - clocks: phandles to the clocks feeding the TCON. Three are needed:
> > +   - 'ahb': the interface clocks
> > +   - 'tcon-ch0': The clock driving the TCON channel 0
> > +   - 'tcon-ch1': The clock driving the TCON channel 1
> > +
> > + - clock-names: the clock names mentioned above
> > + - clock-output-names: Name of the pixel clock created
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoint, the second one the output
> > +
> > +Optional properties:
> > +  - allwinner,panel: phandle to the panel used in our RGB interface
> > +
> > +
> > +Display Engine Backend
> > +----------------------
> > +
> > +The display engine backend exposes layers and sprites to the
> > +system.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-backend
> > +  - reg: base address and size of the memory-mapped region.
> > +  - clocks: phandles to the clocks feeding the frontend and backend
> > +    * ahb: the backend interface clock
> > +    * mod: the backend module clock
> > +    * ram: the backend DRAM clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset controllers driving the backend
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoints, the second one the output
> > +
> > +Display Engine Frontend
> > +-----------------------
> > +
> > +The display engine frontend does formats conversion, scaling,
> > +deinterlacing and color space conversion.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-frontend
> > +  - reg: base address and size of the memory-mapped region.
> > +  - interrupts: interrupt associated to this IP
> > +  - clocks: phandles to the clocks feeding the frontend and backend
> 
> > +    * ahb: the backend interface clock
> > +    * mod: the backend module clock
> > +    * ram: the backend DRAM clock
> 
> should be frontend?

Yeah, stupid copy/paste mistake :/

> 
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset controllers driving the backend
> 
> ditto
> 
> > +
> > +Display Engine Pipeline
> > +-----------------------
> > +
> > +The display engine pipeline (and its entry point, since it can be
> > +either directly the backend or the frontend) is represented as an
> > +extra node.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-engine
> > +  - allwinner,pipelines: list of phandle to the entry points of the
> > +    pipelines (either to the frontend or backend)
> > +
> > +Example:
> > +
> > +panel: panel {
> > +	compatible = "olimex,lcd-olinuxino-43-ts";
> 
> This should either be a child of what it is attached to or use of-graph.

You had a similar discussion with Thierry last time I sent it, and it
seemed to settle on keeping that property:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/382115.html

Has that changed?

> > +};
> > +
> > +tve0: tv-encoder@01c0a000 {
> > +	compatible = "allwinner,sun4i-a10-tv-encoder";
> > +	reg = <0x01c0a000 0x1000>;
> > +	clocks = <&ahb_gates 34>;
> > +
> > +	port {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		tve0_in_tcon0: endpoint@0 {
> > +			reg = <0>;
> 
> I would drop the reg where you only have 1 node for ports or endpoints.

Ok

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--4bRzO86E/ozDv8r1--
