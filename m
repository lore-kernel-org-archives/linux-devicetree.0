From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add xylon logicvc bindings documentation
Date: Fri, 13 Sep 2019 20:16:28 +0100
Message-ID: <CAL_Jsq+dzT1xrfBy2QQHLx9MUNukWWq5eXyOecVV8h0z5ziC8g@mail.gmail.com>
References: <20190910153409.111901-1-paul.kocialkowski@bootlin.com>
 <20190910153409.111901-2-paul.kocialkowski@bootlin.com> <20190913143510.GA9504@bogus>
 <20190913155815.GA1554@aptenodytes>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913155815.GA1554@aptenodytes>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2019 at 4:58 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Rob and thanks for the review!
>
> On Fri 13 Sep 19, 15:35, Rob Herring wrote:
> > On Tue, Sep 10, 2019 at 05:34:08PM +0200, Paul Kocialkowski wrote:
> > > The Xylon LogiCVC is a display controller implemented as programmable
> > > logic in Xilinx FPGAs.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../bindings/display/xylon,logicvc.txt        | 188 ++++++++++++++++++
> > >  1 file changed, 188 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc.txt
> >
> > Consider converting this to DT schema format. See
> > Documentation/devicetree/writing-schema.rst (.md in 5.3).
>
> Oh right, that would certainly be much more future-proof!
>
> > > diff --git a/Documentation/devicetree/bindings/display/xylon,logicvc.txt b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > > new file mode 100644
> > > index 000000000000..eb4b1553888a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > > @@ -0,0 +1,188 @@
> > > +Xylon LogiCVC display controller
> > > +
> > > +The Xylon LogiCVC is a display controller that supports multiple layers.
> > > +It is usually implemented as programmable logic and was optimized for use
> > > +with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
> > > +
> > > +Because the controller is intended for use in a FPGA, most of the configuration
> > > +of the controller takes place at logic configuration bitstream synthesis time.
> > > +As a result, many of the device-tree bindings are meant to reflect the
> > > +synthesis configuration. These do not allow configuring the controller
> > > +differently than synthesis configuration.
> > > +
> > > +Layers are declared in the "layers" sub-node and have dedicated configuration.
> > > +In version 3 of the controller, each layer has fixed memory offset and address
> > > +starting from the video memory base address for its framebuffer. With version 4,
> > > +framebuffers are configured with a direct memory address instead.
> > > +
> > > +Matching synthesis parameters are provided when applicable.
> > > +
> > > +Required properties:
> > > +- compatible: Should be one of:
> > > +  "xylon,logicvc-3.02.a-display"
> > > +  "xylon,logicvc-4.01.a-display"
> > > +- reg: Physical base address and size for the controller registers.
> > > +- clocks: List of phandle and clock-specifier pairs, one for each entry
> > > +  in 'clock-names'
> > > +- clock-names: List of clock names that should at least contain:
> > > +  - "vclk": The VCLK video clock input.
> > > +- interrupts: The interrupt to use for VBLANK signaling.
> > > +- xylon,display-interface: Display interface in use, should be one of:
> > > +  - "lvds-4bits": 4-bit LVDS interface (C_DISPLAY_INTERFACE == 4).
> > > +- xylon,display-colorspace: Display output colorspace in use, should be one of:
> > > +  - "rgb": RGB colorspace (C_DISPLAY_COLOR_SPACE == 0).
> > > +- xylon,display-depth: Display output depth in use (C_PIXEL_DATA_WIDTH).
> > > +- xylon,row-stride: Fixed number of pixels in a framebuffer row (C_ROW_STRIDE).
> > > +- xylon,layers-count: The number of available layers (C_NUM_OF_LAYERS).
> >
> > Presumably some of this is determined by the display attached. Isn't it
> > safe to assume the IP was configured correctly for the intended display
> > and you can just get this from the panel?
>
> Layers are what corresponds to DRM planes, which are not actually indicated
> by the panel but are a charasteristic of the display controller. In our case,
> this is directly selected at bitstream synthesis time for the controller.
>
> So I'm afraid there is no way we can auto-detect this from the driver.

Sorry, I referring to the set of properties above. In particular,
xylon,display-interface and xylon,display-colorspace, though I don't
know if the latter is talking in memory format or on the wire format.

Actually for xylon,layers-count, You should just count the child nodes
of 'layers'.

> > > +Optional properties:
> > > +- memory-region: phandle to a node describing memory, as specified in:
> > > +  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > +- clock-names: List of clock names that can optionally contain:
> > > +  - "vclk2": The VCLK2 doubled-rate video clock input.
> > > +  - "lvdsclk": The LVDS clock.
> > > +  - "lvdsclkn": The LVDS clock inverted.
> >
> > How are these really optional?
>
> Well, the controller currently only supports LVDS, but more interfaces may be
> added later, so the lvdsclk clock will be optional when another interface
> is used instead. Maybe I'm mistaken about how to categorize them though.
>
> My understanding is that the need for vclk2 and lvdsclkn depend on the target
> FPGA family. I've developped the driver without the need for them, but the
> datasheet states that they may be needed (but doesn't provide significant
> details about their role though).

Not sure what to tell you then. You'll see it becomes a bit messy to
describe in schema. Ideally we define the exact number, order, and
values possible (or sets of those).

> > > +- xylon,syscon: Syscon phandle representing the logicvc instance.
> > > +- xylon,dithering: Dithering module is enabled (C_XCOLOR).
> > > +- xylon,background-layer: The last layer is used to display a black background
> > > +  (C_USE_BACKGROUND). It must still be registered.
> > > +- xylon,layers-configurable: Configuration of layers' size, position and offset
> > > +  is enabled (C_USE_SIZE_POSITION).
> >
> > I would think this will effectively have to be enabled to make this
> > usable with DRM. I'm not sure if a "standard" userspace would use any of
> > the layers if all this is fixed.
>
> I was going with the same assumption, but drm_atomic_helper_check_plane_state
> has a can_position parameter, which will check that the plane covers the
> whole CRTC if set to false. So I guess it is somewhat expected that this can
> be the case and some drivers (e.g. arm/hdlcd_crtc.c) also set this to false.

Certainly atomic can fail on anything not supported. My question is
more whether userspace has some minimum requirements. A cursor
couldn't deal with can_position=false for example.

> I guess this falls under a more generic discussion of what should be expected
> by userspace when it comes to DRM. Since drivers may reject commits because of
> any hardware-specific limitation, there is definitely a significant grey area
> there and apparently no common rule.
>
> > > +
> > > +Required sub-nodes:
> > > +- layers: The description of the display controller layers, containing layer
> > > +  sub-nodes that each describe a registered layer.
> > > +- ports: The LogiCVC connection to an encoder input port. The connection
> > > +  is modeled using the OF graph bindings, as specified in:
> > > +  Documentation/devicetree/bindings/graph.txt
> > > +
> > > +Required layer properties:
> > > +- reg: Layer index (from front to back, starting at 0).
> > > +- xylon,layer-depth: Layer depth in use (C_LAYER_0_DATA_WIDTH).
> > > +- xylon,layer-colorspace: Layer colorspace in use, should be one of:
> > > + - "rgb": RGB colorspace (C_LAYER_*_TYPE == 0).
> >
> > Why is this needed if there's only 1?
>
> The hardware supports more but support is no implemented yet, so the binding
> document may be enriched along with the driver in the future.
>
> Should I describe other colorspaces even if they are not currently supported?

Document what the h/w supports to the extent you can. Then we can make
better decisions.

> > > +- xylon,layer-alpha-mode: Alpha mode for the layer, should be one of:
> > > + - "layer": Alpha is configured layer-wide (C_LAYER_*_ALPHA_MODE == 0).
> > > + - "pixel": Alpha is configured per-pixel (C_LAYER_*_ALPHA_MODE == 1).
> >
> > Could just be boolean.
>
> In this instance too, there are other modes that are not yet implemented but
> supported by the hardware, so I did not describe them yet but they may be added
> later.
>
> > > +- xylon,layer-base-offset: offset in number of lines (C_LAYER_*_OFFSET) starting
> > > +  from the video RAM base (C_VMEM_BASEADDR), only for version 3.
> > > +- xylon,layer-buffer-offset: offset in number of lines (C_BUFFER_*_OFFSET)
> > > +  starting from the layer base offset for the second buffer used in
> > > +  double-buffering.
> >
> > It might be better to define all this in terms of byte offsets. I'd
> > guess that is what CPU accesses are going to need.
>
> I agree that it is more convenient from a driver's perspective, but the
> rationale is that this allows copying parameters directly from the synthesis
> configuration file, where these are expressed as a number of lines.
>
> I would like to keep both delcarations as close to eachother as possible, as to
> facilitate integration work for future users of the driver. But maybe this is a
> bit too much in that case. What do you think?

Fair enough. I'd feel differently if I thought this would be common,
but this seems to be a pretty specific usecase. I guess there could be
other fixed at synthesis h/w.

Rob
