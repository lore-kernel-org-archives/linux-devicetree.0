From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 4/6] dt-bindings: display: armada: Add display subsystem
 binding
Date: Sun, 24 Feb 2019 17:15:30 +0100
Message-ID: <4e89406842c4821d590dc6518076cfe6f19cc6b9.camel@v3.sk>
References: <20190120172534.24617-1-lkundrak@v3.sk>
         <20190120172534.24617-5-lkundrak@v3.sk>
         <CAL_JsqLT7jEdwi7o7RR_3OcbMTxeNXmSzif8Ez2psjhu24No5Q@mail.gmail.com>
         <b92426e9f5c50c71fa89ea5b53396c1885cc396f.camel@v3.sk>
         <CAL_JsqJsfwC4fAJaVEvKwtZkZwapu5jojEFn6Ddx34a6jZ_dSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJsfwC4fAJaVEvKwtZkZwapu5jojEFn6Ddx34a6jZ_dSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-22 at 14:23 -0600, Rob Herring wrote:
> On Wed, Feb 13, 2019 at 4:37 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > On Mon, 2019-01-21 at 09:35 -0600, Rob Herring wrote:
> > > On Sun, Jan 20, 2019 at 11:26 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > The Marvell Armada DRM master device is a virtual device needed to list all
> > > > nodes that comprise the graphics subsystem.
> > > > 
> > > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > > ---
> > > >  .../display/armada/marvell-armada-drm.txt     | 24 +++++++++++++++++++
> > > >  1 file changed, 24 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > index de4cca9432c8..3dbfa8047f0b 100644
> > > > --- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > +++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> > > > @@ -1,3 +1,27 @@
> > > > +Marvell Armada DRM master device
> > > > +================================
> > > > +
> > > > +The Marvell Armada DRM master device is a virtual device needed to list all
> > > > +nodes that comprise the graphics subsystem.
> > > > +
> > > > +Required properties:
> > > > +
> > > > + - compatible: value should be "marvell,dove-display-subsystem",
> > > > +   "marvell,armada-display-subsystem"
> > > > + - ports: a list of phandles pointing to display interface ports of CRTC
> > > > +   devices
> > > > + - memory-region: phandle to a node describing memory to be used for the
> > > > +   framebuffer
> > > > +
> > > > +Example:
> > > > +
> > > > +       display-subsystem {
> > > > +               compatible = "marvell,dove-display-subsystem",
> > > > +                            "marvell,armada-display-subsystem";
> > > > +               memory-region = <&display_reserved>;
> > > > +               ports = <&lcd0_port>;
> > > 
> > > If there is only one device, you don't need this virtual node.
> > 
> > Before I follow up on this and submit a version without the virtual
> > node, I'm wondering: is it okay that the bindings for the LCDC and the
> > framebuffer are in the same file, or would it be preferrable if they
> > were separate? Both styles seem to be used for the display bindings.
> 
> framebuffer as in the kernel fbdev? Really, that should be the same
> binding. It's the same h/w after all. However, there have been cases
> where things deviated. So I don't have a good answer.

No, not the fbdev device, that one is managed by drmfb and is not
expressed in DT. I meant the reserved-memory node that sets aside
memory for the framebuffers.

See patch "[RFC 03/16] dt-bindings: display: armada: Add framebuffer
reserved-mem binding". Perhaps that part should even go to
Documentation/devicetree/bindings/reserved-memory/.

Lubo
