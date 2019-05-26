From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: media: sunxi-ir: Add A64 compatible
Date: Sun, 26 May 2019 21:15:49 +0200
Message-ID: <CAJiuCceHhxYt=BY0Jvfv6+80ekKcMLUSv5UWBorYuvtO-DkOtg@mail.gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com> <20190525180923.6105-5-peron.clem@gmail.com>
 <20190526190410.ngrvrclp5ge5rdqy@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526190410.ngrvrclp5ge5rdqy@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Sun, 26 May 2019 at 21:04, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 25, 2019 at 08:09:17PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > There is some minor differences between A31 and A64 driver.
> >
> > But A31 IR driver is compatible with A64.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Doc=
umentation/devicetree/bindings/media/sunxi-ir.txt
> > index 53e88ebb53fe..da5aeba843de 100644
> > --- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > @@ -5,6 +5,7 @@ Required properties:
> >       "allwinner,sun4i-a10-ir"
> >       "allwinner,sun5i-a13-ir"
> >       "allwinner,sun6i-a31-ir"
> > +     "allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
>
> I guess resets is mandatory for the A31 onwards too, right?

Indeed, I will add this information in the device-tree bindings.
Ideally, we should also introduce a quirks with a "has_reset" property.

Thanks for your review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
