MIME-Version: 1.0
Date: Mon, 1 Jul 2019 09:11:02 -0600
References: <20190630203614.5290-1-robdclark@gmail.com>
	<20190630203614.5290-2-robdclark@gmail.com>
	<CAL_JsqKMULJJ9CERRBpqd7Y2dtovEJ6jcDKy6J4yR6rAdjibUg@mail.gmail.com>
	<CAF6AEGvRXZAannGisHjsaW4Pg3v2ma5WHK2phqg8TaF53pR8XQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvRXZAannGisHjsaW4Pg3v2ma5WHK2phqg8TaF53pR8XQ@mail.gmail.com>
Message-ID: <CAL_JsqKYpWM2VCGYCpFmUFYYrMcDesa+bQ6HweKrtgfEs1_YEg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, aarch64-laptops@lists.linaro.org, Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 1, 2019 at 8:42 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 1, 2019 at 7:03 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, Jun 30, 2019 at 2:36 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The panel-id property in chosen can be used to communicate which panel,
> > > of multiple possibilities, is installed.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> >
> > I need to update this file to say it's moved to the schema repository...
> >
> > But I don't think that will matter...
> >
> > > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > > index 45e79172a646..d502e6489b8b 100644
> > > --- a/Documentation/devicetree/bindings/chosen.txt
> > > +++ b/Documentation/devicetree/bindings/chosen.txt
> > > @@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
> > >  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
> > >  should only use the "stdout-path" property.
> > >
> > > +panel-id
> > > +--------
> > > +
> > > +For devices that have multiple possible display panels (multi-sourcing the
> > > +display panels is common on laptops, phones, tablets), this allows the
> > > +bootloader to communicate which panel is installed, e.g.
> >
> > How does the bootloader figure out which panel? Why can't the kernel
> > do the same thing?
>
> see jhugo's response, he has I guess more access to the bootloader than I
>
> > > +
> > > +/ {
> > > +       chosen {
> > > +               panel-id = <0xc4>;
> > > +       };
> > > +
> > > +       ivo_panel {
> > > +               compatible = "ivo,m133nwf4-r0";
> > > +               power-supply = <&vlcm_3v3>;
> > > +               no-hpd;
> > > +
> > > +               ports {
> > > +                       port {
> > > +                               ivo_panel_in_edp: endpoint {
> > > +                                       remote-endpoint = <&sn65dsi86_out_ivo>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +
> > > +       boe_panel {
> > > +               compatible = "boe,nv133fhm-n61";
> >
> > Both panels are going to probe. So the bootloader needs to disable the
> > not populated panel setting 'status' (or delete the node). If you do
> > that, do you even need 'panel-id'?
>
> I don't think we can rely on bootloader knowing a thing about DT on
> these devices..

But libstub 

> OTOH I don't really think it is a big problem for both panels to
> probe.  But I suppose it might be possible to have something somewhere
> in the kernel that realizes and disables the unused panels.

For starters, the refcount for regulator(s) would be off.

What does DRM do when multiple panels show up?

> > > +               power-supply = <&vlcm_3v3>;
> > > +               no-hpd;
> > > +
> > > +               ports {
> > > +                       port {
> > > +                               boe_panel_in_edp: endpoint {
> > > +                                       remote-endpoint = <&sn65dsi86_out_boe>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +
> > > +       display_or_bridge_device {
> > > +
> > > +               ports {
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +
> > > +                       ...
> > > +
> > > +                       port@0 {
> > > +                               #address-cells = <1>;
> > > +                               #size-cells = <0>;
> > > +                               reg = <0>;
> > > +
> > > +                               endpoint@c4 {
> > > +                                       reg = <0xc4>;
> >
> > What does this number represent? It is supposed to be defined by the
> > display_or_bridge_device, not a specific panel.
>
> it matches /chosen/panel-id.. in this case I'm not sure how the
> panel-id's are assigned, but for our purposes all that matters is that
> they are assigned.
>
> > We also need to consider how the DSI case with panels as children of
> > the DSI controller would work and how this would work with multiple
> > displays each having multiple panel options.
>
> In the non-bridge case (panel hooked directly to dsi controller), the
> dsi controller could use the same ports {} mechanism.

Perhaps, but that's not what we do today and I don't think that's necessary. We can have multiple panels as child nodes. However, we'd probably have colliding addresses (reg) and only 1 should be enabled.

> For multiple displays, we could extend, I suppose, /chosen/panel-id to
> be an array of id's indexed by display.  I think this is the type of
> extension we could do later when the use-case comes up.  Just having
> this solved upstream for single display would already be a huge
> advancement.  (You don't want to look at how this is solved downstream
> for android phones.)

Then you need some way to define which display is which index. Given this touches 

> Btw, if you are curious how this works on windows/ACPI, the ACPI
> tables have entries for each of the panels.  The kernel is expected to
> take the panel-id from that EFI variable that jhugo mentioned, and
> pass it to a _ROM method which returns the appropriate panel table.
> (Not entirely sure how the orchestrate reading the EFI variable early,
> since it does not appear to be available after ExitBootServices)

I do think the entire picture needs to be spelled out including how any display handoff is handled. I guess EFI FB is used here? My initial thought is just add a panel id property to each panel node and then the kernel w
