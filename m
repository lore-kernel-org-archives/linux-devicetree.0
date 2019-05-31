From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
Date: Fri, 31 May 2019 12:51:23 +0530
Message-ID: <CAMty3ZBTu5DqcL+u6KTUC=Ofe9Gwdcu8VT-kSwWb2O3n9gnrWQ@mail.gmail.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
 <20190529105615.14027-2-jagan@amarulasolutions.com> <20190531065928.4wfr3kjngefy4q2b@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531065928.4wfr3kjngefy4q2b@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>, Sergey Suloev <ssuloev@orpaltech.com>, Ryan Pannell <ryan@osukl.com>, Bhushan Shah <bshah@mykolab.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 12:29 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Wed, May 29, 2019 at 04:26:07PM +0530, Jagan Teki wrote:
> > The MIPI DSI controller in Allwinner A64 is similar to A33.
> >
> > But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> > to with separate compatible for A64 on the same driver.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > index 1cc40663b7a2..9877398be69a 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > @@ -12,6 +12,7 @@ The DSI Encoder generates the DSI signal from the TCON's.
> >  Required properties:
> >    - compatible: value must be one of:
> >      * allwinner,sun6i-a31-mipi-dsi
> > +    * allwinner,sun50i-a64-mipi-dsi
> >    - reg: base address and size of memory-mapped region
> >    - interrupts: interrupt associated to this IP
> >    - clocks: phandles to the clocks feeding the DSI encoder
>
> We've switch to YAML now, and the compatible should be expressed that
> way now:

Yes, I have seen it few days back will update on top of that, thanks!
