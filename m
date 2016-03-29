From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 13/19] drm: sun4i: Add DT bindings documentation
Date: Tue, 29 Mar 2016 12:33:14 +0200
Message-ID: <20160329103314.GL30977@lukather>
References: <1458751122-23976-1-git-send-email-maxime.ripard@free-electrons.com>
 <1458751122-23976-14-git-send-email-maxime.ripard@free-electrons.com>
 <20160325141118.GA26927@rob-hp-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DLjW/zgzzl4LEtEW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB25T5G3QKGQEK2CN27Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160325141118.GA26927@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--DLjW/zgzzl4LEtEW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Rob,

On Fri, Mar 25, 2016 at 09:11:18AM -0500, Rob Herring wrote:
> On Wed, Mar 23, 2016 at 05:38:36PM +0100, Maxime Ripard wrote:
> > The display pipeline of the Allwinner A10 is involving several loosely
> > coupled components.
> > 
> > Add a documentation for the bindings.
> > 
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../bindings/display/sunxi/sun4i-drm.txt           | 254 +++++++++++++++++++++
> >  1 file changed, 254 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > new file mode 100644
> > index 000000000000..378edb919eae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -0,0 +1,254 @@
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
> > + - resets: phandle to the reset controller driving the encoder
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
> > + - compatible: value should be "allwinner,sun5i-a13-tcon".
> > + - reg: base address and size of memory-mapped region
> > + - interrupts: interrupt associated to this IP
> > + - clocks: phandles to the clocks feeding the TCON. Three are needed:
> > +   - 'ahb': the interface clocks
> > +   - 'tcon-ch0': The clock driving the TCON channel 0
> > +   - 'tcon-ch1': The clock driving the TCON channel 1
> > + - resets: phandles to the reset controllers driving the encoder
> > +   - "lcd": the reset line for the TCON channel 0
> > +
> > + - clock-names: the clock names mentioned above
> > + - reset-names: the reset names mentioned above
> > + - clock-output-names: Name of the pixel clock created
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoint, the second one the output
> 
> The example shows 2 output endpoints. Your diagram shows up to 4 
> outputs. The number should be how ever many could coexist in a given h/w 
> design. In other words, I'm assuming all 4 can't be used simultaneously, 
> but can all 4 be wired up in a h/w design and switched in s/w? 
> 
> Just be clear on the numbering.

Yes, each TCON has two channels, the first one being usable for
RGB/LVDS, the second one for TV/VGA. HDMI is basically implemented
using an in-SoC RGB-to-HDMI bridge, so it would use the first channel
as well.

I don't see how a particular design could use several devices on the
first channel, because they would share the same timings, and I don't
really see how it would work out.

> > +
> > +Endpoints optional property:
> > +  - allwinner,panel: boolean to indicate that the endpoint is a panel
> 
> This can be determined by the endpoint not being TV Encoder (or HDMI).

It wouldn't really scale if you start to consider the bridges
too. Then, you would have to duplicate and maintain a list of all the
bridges supported in Linux and a list of all the panels supported in
Linux, and try to match that to see if it's a panel, a bridge or an
element of our pipeline.

> 
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
> > +    * ahb: the backend interface clock
> > +    * mod: the backend module clock
> > +    * ram: the backend DRAM clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset controllers driving the backend
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
> 
> Seems like using FE or BE would be a function of your framebuffers' 
> formats and shouldn't be defined in DT.

Well, they are different IP blocks, so it should be defined in DT,
shouldn't it?

> 
> > +
> > +Example:
> > +
> > +panel: panel {
> > +	compatible = "olimex,lcd-olinuxino-43-ts";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	port@0 {
> > +		reg = <0>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		panel_input: endpoint@0 {
> > +			reg = <0>;
> > +			remote-endpoint = <&tcon0_out_panel>;
> 
> You can drop the unit-addresses and reg when there is only 1 (or 
> leaving is fine too).
> 
> > +		};
> > +	};
> > +};
> > +
> > +tve0: tv-encoder@01c0a000 {
> 
> Drop the leading 0.

Ok.

> 
> > +	compatible = "allwinner,sun4i-a10-tv-encoder";
> > +	reg = <0x01c0a000 0x1000>;
> > +	clocks = <&ahb_gates 34>;
> > +	resets = <&tcon_ch0_clk 0>;
> > +
> > +	port {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		tve0_in_tcon0: endpoint@0 {
> > +			reg = <0>;
> > +			remote-endpoint = <&tcon0_out_tve0>;
> > +		};
> > +	};
> > +};
> > +
> > +tcon0: lcd-controller@01c0c000 {
> 
> ditto...

Ok.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--DLjW/zgzzl4LEtEW--
