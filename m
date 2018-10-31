From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 17/25] dt-bindings: panel: Add Bananapi
 S070WV20-CT16 ICN6211 MIPI-DSI to RGB bridge
Date: Wed, 31 Oct 2018 16:58:34 +0800
Message-ID: <CAGb2v66ENhmNXPz4PfdRJjNUNdpDNZYX2a3SH8AD6SMe9g2zLA@mail.gmail.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <CGME20181029111305epcas5p2ee0ca644470de4e036762e000afbb71b@epcas5p2.samsung.com>
 <20181026144344.27778-18-jagan@amarulasolutions.com> <3c4c8a08-8c1e-1ac6-2b53-81389d69c97b@samsung.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBSO54XPAKGQEAULA5DA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3c4c8a08-8c1e-1ac6-2b53-81389d69c97b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2018 at 4:53 PM Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On 26.10.2018 16:43, Jagan Teki wrote:
> > Bananapi S070WV20-CT16 ICN6211 is 800x480, 4-lane MIPI-DSI to RGB
> > bridge panel, which is available on same PCB with 24-bit RGB interface.
> >
> > So, this patch adds DSI specific binding details on existing
> > dt-bindings file.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> > Changes for v3:
> > - Use existing binding doc and update dsi details
> > Changes for v2:
> > - none
> >
> >  .../display/panel/bananapi,s070wv20-ct16.txt  | 31 +++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > index 35bc0c839f49..b7855dc7c66f 100644
> > --- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> > @@ -1,12 +1,39 @@
> >  Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
> >
> > +S070WV20-CT16 is 7" 800x480 panel connected through a 24-bit RGB interface.
> > +
> > +Depending on the variant, the PCB attached to the panel module either
> > +supports DSI, or DSI + 24-bit RGB. DSI is converted to 24-bit RGB via
> > +an onboard ICN6211 MIPI DSI - RGB bridge chip, then fed to the panel
> > +itself
>
> As I understand this is display board, which contains 'pure' RGB panel
> S070WV20-CT16 and optionally ICN6211 DSI->RGB bridge.
> These are separate devices, just connected by vendor to simplify its
> assembly. Why don't you create then bridge driver for ICN6211 and RGB
> panel driver for S070WV20-CT16 - it looks more generic.
> Then you can describe both in dts and voila.
> Creating drivers for every combo of devices (panel + bridge), just
> because some vendor sells them together seems incorrect - we have
> devicetree for it.

Rob suggested this, and also the opposite: using the same
"bananapi,s070wv20-ct16"
compatible string for both types of connections, and have the driver deal with
detecting the bus type.

The thing about the bridge chip is that there's no available datasheet that
describes all the parts of the init sequence, in fact none at all. I managed
to work out some bits, but the others remain a mystery and must be hard-coded
to match the panel. That would work against having a generic bridge driver.

ChenYu

>
> Regards
> Andrzej
>
>
> > +
> >  Required properties:
> > -- compatible: should be "bananapi,s070wv20-ct16"
> > +- compatible:
> > +  for 24-bit RGB interface, use "bananapi,s070wv20-ct16"
> > +  for ICN6211 MIPI-DSI to RGB bridge, use "bananapi,s070wv20-ct16-icn6211"
> > +
> > +Required properties for RGB:
> >  - power-supply: see ./panel-common.txt
> >
> > +Required properties for MIPI-DSI to RGB:
> > +- reg: for DSI virtual channel used by that screen
> > +- avdd-supply: analog regulator dc1 switch
> > +- dvdd-supply: 3v3 digital regulator
> > +- reset-gpios: a GPIO phandle for the reset pin
> > +
> >  Optional properties:
> > -- enable-gpios: see ./simple-panel.txt
> > +- enable-gpios: see ./simple-panel.txt(not available in MIPI-DSI to RGB bridge)
> >  - backlight: see ./simple-panel.txt
> >
> >  This binding is compatible with the simple-panel binding, which is specified
> >  in ./simple-panel.txt.
> > +
> > +Example:
> > +panel@0 {
> > +     compatible = "bananapi,s070wv20-ct16-icn6211";
> > +     reg = <0>;
> > +     avdd-supply = <&reg_dc1sw>;
> > +     dvdd-supply = <&reg_dldo1>;
> > +     reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> > +     backlight = <&backlight_dsi>;
> > +};
>
>
