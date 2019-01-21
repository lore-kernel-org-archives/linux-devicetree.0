From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: display: armada: Add display subsystem binding
Date: Mon, 21 Jan 2019 17:58:50 -0600
Message-ID: <CAL_Jsq+6N6y=2ZmXL37G9o=w1wcP_qnCt=g6HJot=CwrJc0zNw@mail.gmail.com>
References: <20190120172534.24617-1-lkundrak@v3.sk> <20190120172534.24617-5-lkundrak@v3.sk>
 <CAL_JsqLT7jEdwi7o7RR_3OcbMTxeNXmSzif8Ez2psjhu24No5Q@mail.gmail.com>
 <3191cdde84978adf98d200a9db6f3c18e0a46390.camel@v3.sk> <CAL_JsqJBh9=J+m-eCFXvKw62Fj1Y9aFCNY=Vqo0LfyKoXKSXow@mail.gmail.com>
 <20190121175301.lremzw6dul7dyff4@e5254000004ec.dyn.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121175301.lremzw6dul7dyff4@e5254000004ec.dyn.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Lubomir Rintel <lkundrak@v3.sk>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 11:53 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 21, 2019 at 10:07:11AM -0600, Rob Herring wrote:
> > On Mon, Jan 21, 2019 at 9:46 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > >
> > > On Mon, 2019-01-21 at 09:35 -0600, Rob Herring wrote:
> > > > On Sun, Jan 20, 2019 at 11:26 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > > The Marvell Armada DRM master device is a virtual device needed to list all
> > > > > nodes that comprise the graphics subsystem.
> > > > >
> > > > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > > > ---
> > > > >  .../display/armada/marvell-armada-drm.txt     | 24 +++++++++++++++++++
> > > > >  1 file changed, 24 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > > index de4cca9432c8..3dbfa8047f0b 100644
> > > > > --- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > > +++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > > @@ -1,3 +1,27 @@
> > > > > +Marvell Armada DRM master device
> > > > > +================================
> > > > > +
> > > > > +The Marvell Armada DRM master device is a virtual device needed to list all
> > > > > +nodes that comprise the graphics subsystem.
> > > > > +
> > > > > +Required properties:
> > > > > +
> > > > > + - compatible: value should be "marvell,dove-display-subsystem",
> > > > > +   "marvell,armada-display-subsystem"
> > > > > + - ports: a list of phandles pointing to display interface ports of CRTC
> > > > > +   devices
> > > > > + - memory-region: phandle to a node describing memory to be used for the
> > > > > +   framebuffer
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +       display-subsystem {
> > > > > +               compatible = "marvell,dove-display-subsystem",
> > > > > +                            "marvell,armada-display-subsystem";
> > > > > +               memory-region = <&display_reserved>;
> > > > > +               ports = <&lcd0_port>;
> > > >
> > > > If there is only one device, you don't need this virtual node.
> > >
> > > By "one device" you mean one LCD controller (CRTC)?
> >
> > Yes.
>
> How does that work (as far as the Linux implementation) ?  I can't see
> a way that could work, while allowing the flexibility that Armada DRM
> allows (two completely independent LCD controllers as two separate DRM
> devices vs one DRM device containing both LCD controllers.)
>
> > > I suppose in the (single CRTC) example case, the display-subsystem node
> > > used to associate it with the memory region reserved for allocating the
> > > frame buffers from. Could that be done differently?
> >
> > Move memory-region to the LCD controller node.
>
> That doesn't work - it would appear in the wrong part of the driver.

Why? You can fetch properties from other nodes.

If you have 2 CRTCs, do you have 1 or 2 reserved memory regions? I'd
think 2 with each one in the corresponding LCDC that uses them would
be more flexible.

Or just get the data out of the /reserved-memory node directly. Surely
it has a compatible that you can find it with.

> > > Also, if the node is indeed made optional, then it's going to
> > > complicate things on the DRM side. Currently the driver that binds to
> > > the node creates the DRM device once it sees all the components
> > > connected to the ports appear. If we loose it, then the LCD controller
> > > driver would somehow need to find out that it's alone and create the
> > > DRM device itself.
> >
> > DT is not the only way to create devices. The DRM driver can bind to
> > the LCDC node and then create a child CRTC device (or even multiple
> > ones for h/w with multiple pipelines).
>
> That seems completely upside down and rediculous to me - are you
> really suggesting that we should have some kind of virtual device
> in DT, and omit the _real_ physical devices for that, having the
> driver create the device with all the appropriate SoC resources?

We create child platform devices that inherit from the parent in DT
all the time. MFD child drivers are a common case. Sometime the child
devices have DT nodes and sometimes they don't.

Otherwise, do it the other way around. Create a virtual DRM device
conditioned on the SoC:

if (of_machine_is_compatible("foo,bar"))
  platform_device_register_simple(...)

>
> > You'll also notice that there are only 3 cases of this virtual node in
> > the tree: STi, i.MX IPU, and Rockchip. That's because we've deprecated
> > doing these virtual nodes for some time now. IOW, there are several
> > examples of how to do this without a virtual node.
>
> This driver has been in-tree with this setup for some time, although
> the documentation has been missing (we actually have a _lot_ of
> instances of that.)  However, we have no in-tree DT using it.

The current Armada DRM driver has no binding to DT at all, so no, it
is not just missing documentation or a dts file.

> I don't really see how to satisfy your comments without totally
> restructuring the driver, which is going to be quite a big chunk
> of work.  I'm not sure I have the motivation to do that right now.

It's not a big chunk of work. Look at commit 246774d17fc0
("drm/etnaviv: remove the need for a gpu-subsystem DT node") for an
example.

Rob
