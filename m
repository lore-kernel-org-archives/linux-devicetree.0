From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 13/15] dt-bindings: sun6i-dsi: Add compatible for A64 DPHY
Date: Thu, 25 Oct 2018 18:22:51 +0530
Message-ID: <CAMty3ZC3jXKBVrrCSd0Un+ZNvNKPj4C0WpcpNOYJBK1=vehBQg@mail.gmail.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-14-jagan@amarulasolutions.com> <20181024180927.ejt7odo23ebzjgfg@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024180927.ejt7odo23ebzjgfg@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 11:39 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Tue, Oct 23, 2018 at 09:20:33PM +0530, Jagan Teki wrote:
> > The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
> > on the one on A31.
> >
> > Add A64 compatible and append A31 compatible as fallback.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - new patch
> >
> >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > index 9fa6e7a758ad..704fb31962f2 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > @@ -36,7 +36,7 @@ D-PHY
> >
> >  Required properties:
> >    - compatible: value must be one of:
> > -    * allwinner,sun6i-a31-mipi-dphy
> > +    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"
>
> No. you need both. The A64 MIPI DPHY one needs to be always set with
> the A31 fallback, but the A31 is also usable on its own.

Why wouldn't be, because we don't have any difference dphy right?
