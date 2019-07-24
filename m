From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: sunxi: add binding
 for Lichee Zero Plus core board
Date: Wed, 24 Jul 2019 16:14:25 +0200
Message-ID: <20190724141425.aycdkdwlgmljwpgr@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-8-icenowy@aosc.io>
 <20190720101318.cwrvv5r42wxx5k4r@flea>
 <BDF0C9F6-DD0D-4343-8E24-06A07055004C@aosc.io>
 <20190722192934.3jaf3r4rnyeslqyw@flea>
 <7d24576697521f4985617113dbc4cc41@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWVG43UQKGQE63KKE6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <7d24576697521f4985617113dbc4cc41-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 09:09:01PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2019-07-23 03:29=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Sat, Jul 20, 2019 at 07:39:08PM +0800, Icenowy Zheng wrote:
> > >
> > >
> > > =E4=BA=8E 2019=E5=B9=B47=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=886:13:18, Maxime Ripard
> > > <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> > > >On Sat, Jul 13, 2019 at 11:46:33AM +0800, Icenowy Zheng wrote:
> > > >> The Lichee Zero Plus is a core board made by Sipeed, with a microU=
SB
> > > >> connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI
> > > >Flash.
> > > >> It has a gold finger connector for expansion, and UART is availabl=
e
> > > >from
> > > >> reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 =
or
> > > >> Allwinner V3L SoCs.
> > > >>
> > > >> Add the device tree binding of the basic version of the core board=
 --
> > > >> w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.
> > > >>
> > > >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > >> ---
> > > >> No changes since v3.
> > > >>
> > > >> Patch introduced in v2.
> > > >>
> > > >>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> > > >>  1 file changed, 5 insertions(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> index 000a00d12d6a..48c126a7a848 100644
> > > >> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > >> @@ -353,6 +353,11 @@ properties:
> > > >>            - const: licheepi,licheepi-zero
> > > >>            - const: allwinner,sun8i-v3s
> > > >>
> > > >> +      - description: Lichee Zero Plus (with S3, without eMMC/SPI
> > > >Flash)
> > > >> +        items:
> > > >> +          - const: sipeed,lichee-zero-plus
> > > >> +          - const: allwinner,sun8i-s3
> > > >
> > > >If the S3 is just a rebranded V3, then we should have the v3 compati=
le
> > > >in that list too.
> > >
> > > S3 is V3 with copackaged DDR3 DRAM.
> > >
> > > It's pin incompatible w/ V3.
> >
> > Does it matter though?
> >
> > If the only thing that changes is the package, we're not manipulating
> > that, and any software that deals with the v3 can deal with the
> > s3. Which is what the compatible is about.
>
> Okay. Should the S3 compatible be kept befoer the V3 one?

Yep, something like (in the DT)

compatible =3D "sipeed,lichee-zero-plus", "allwinner,sun8i-s3", "allwinner,=
sun8i-v3"

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190724141425.aycdkdwlgmljwpgr%40flea.
