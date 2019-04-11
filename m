From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: gpu: mali-midgard: Add h6 mali gpu compatible
Date: Thu, 11 Apr 2019 10:03:29 +0200
Message-ID: <CAJiuCcdo2etQhiVpLS98cv=dt1N+2p-+fGhieBDS2iaBCeORPg@mail.gmail.com>
References: <20190410232543.13297-1-peron.clem@gmail.com> <20190410232543.13297-4-peron.clem@gmail.com>
 <20190411072724.qdhfvdhjce5sopzi@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411072724.qdhfvdhjce5sopzi@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 11 Apr 2019 at 09:27, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Thu, Apr 11, 2019 at 01:25:38AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > This add the H6 mali compatible in the dt-bindings to later support
> > specific implementation.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../devicetree/bindings/gpu/arm,mali-midgard.txt          | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt=
 b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > index 2e8bbce35695..9e71146b5c8a 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > @@ -15,6 +15,7 @@ Required properties:
> >      + "arm,mali-t860"
> >      + "arm,mali-t880"
> >    * which must be preceded by one of the following vendor specifics:
> > +    + "allwinner,sun50i-h6-mali"
> >      + "amlogic,meson-gxm-mali"
> >      + "rockchip,rk3288-mali"
> >      + "rockchip,rk3399-mali"
> > @@ -49,9 +50,14 @@ Vendor-specific bindings
> >  ------------------------
> >
> >  The Mali GPU is integrated very differently from one SoC to
> > -another. In order to accomodate those differences, you have the option
> > +another. In order to accommodate those differences, you have the optio=
n
> >  to specify one more vendor-specific compatible, among:
> >
> > +- "allwinner,sun50i-h6-mali"
> > +  Required properties:
> > +  - resets: Should contain phandle of :
> > +    + GPU reset line
> > +
>
> And clocks, I assume?
Yes you're right clocks are also required for the H6.

Clement
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
