From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 4/6] dt-bindings: display: bridge: Add ICN6211 MIPI-DSI to
 RGB convertor bridge
Date: Mon, 18 Mar 2019 22:28:10 +0530
Message-ID: <CAMty3ZBn=MjB-VxwadkEDaM_==hGu1pzTv2A47cKitv0Vb5VXw@mail.gmail.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-5-jagan@amarulasolutions.com> <20190315133414.5zwc5qtrivrbrzow@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315133414.5zwc5qtrivrbrzow@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 7:04 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Mar 15, 2019 at 06:38:23PM +0530, Jagan Teki wrote:
> > ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> > It has a flexible configuration of MIPI DSI signal input
> > and produce RGB565, RGB666, RGB888 output format.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../display/bridge/chipone,icn6211.txt        | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> > new file mode 100644
> > index 000000000000..7f13efd7ee7f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> > @@ -0,0 +1,36 @@
> > +Chipone ICN6211 MIPI-DSI to RGB Convertor Bridge
> > +
> > +ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> > +It has a flexible configuration of MIPI DSI signal input
> > +and produce RGB565, RGB666, RGB888 output format.
> > +
> > +Required properties for RGB:
> > +- compatible: must be "chipone,icn6211" and one of:
> > +  * "bananapi,icn6211"
>
> Why is that compatible needed?

chipone,icn6211 - generic compatible bridge controller IC
bananapi,icn6211 -  compatible for icn6211 bridge using on bananapi panel

I hope this would be proper bindings in terms of controller IC with
associate device, anything wrong? Infact I used similar reference from
Ilitek Bananapi panel from here
Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt

This is what I understood based on dt-binding, correct if I'm wrong.

ilitek,ili9881c - generic ilitek,ili9881c compatable
bananapi,lhr050h41 - compatible for bananapi panel associated with
this ilitek IC

>
> > +- reg: the virtual channel number of a DSI peripheral
> > +- reset-gpios: a GPIO phandle for the reset pin
> > +
> > +The device node can contain following 'port' child nodes,
> > +according to the OF graph bindings defined in [1]:
> > +  0: DSI Input, not required, if the bridge is DSI controlled
> > +  1: RGB Output, mandatory
>
> Your example doesn't have that input port

Yes, I intentionally did this by referring existing bridge binding.
Documentation/devicetree/bindings/display/bridge/toshiba,tc35876*.txt

Do we really need? since the input port can be part of panel binding.
