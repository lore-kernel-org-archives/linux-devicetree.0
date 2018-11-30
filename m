From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 07/15] arm64: dts: allwinner: h5: Add
 system-control node with SRAM C1
Date: Fri, 30 Nov 2018 11:38:23 +0800
Message-ID: <CAGb2v65yNKnqbeQmUYjMzDtydYL=7kxmtPrAEEU9U=a5XbMiFg@mail.gmail.com>
References: <20181115145013.3378-1-paul.kocialkowski@bootlin.com>
 <20181115145013.3378-8-paul.kocialkowski@bootlin.com> <CAGb2v64t6t3Bwf4nc8gQWRDkdv4zGRF1-+Q7snqX6bkEVqirvA@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQHBQLQAKGQEQYFBXSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64t6t3Bwf4nc8gQWRDkdv4zGRF1-+Q7snqX6bkEVqirvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 12:52 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Thu, Nov 15, 2018 at 10:50 PM Paul Kocialkowski
> <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Add the H5-specific system control node description to its device-tree
> > with support for the SRAM C1 section, that will be used by the video
> > codec node later on.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 22 ++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > index b41dc1aab67d..c2d14b22b8c1 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> > @@ -94,6 +94,28 @@
> >         };
> >
> >         soc {
> > +               system-control@1c00000 {
> > +                       compatible = "allwinner,sun50i-h5-system-control";
> > +                       reg = <0x01c00000 0x1000>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges;
> > +
> > +                       sram_c1: sram@1d00000 {
> > +                               compatible = "mmio-sram";
> > +                               reg = <0x01d00000 0x80000>;
>
> I'll try to check this one tomorrow.
>
> I did find something interesting on the H3: there also seems to be SRAM at
> 0x01dc0000 to 0x01dcfeff , again mapped by the same bits as SRAM C1.
>
> And on the A33, the SRAM C1 range is 0x01d00000 to 0x01d478ff.
>
> This was found by mapping the SRAM to the CPU, then using devmem to poke
> around the register range. If there's SRAM, the first read would typically
> return random data, and a subsequent write to it would set some value that
> would be read back correctly. If there's no SRAM, a read either returns 0x0
> or some random data that can't be overwritten.
>
> You might want to check the other SoCs.

This range seems to contain stuff other than SRAM, possibly fixed lookup
tables. Since this is entirely unknown, lets just stick to the known full
range instead.

ChenYu

> > +                               #address-cells = <1>;
> > +                               #size-cells = <1>;
> > +                               ranges = <0 0x01d00000 0x80000>;
> > +
> > +                               ve_sram: sram-section@0 {
> > +                                       compatible = "allwinner,sun50i-h5-sram-c1",
> > +                                                    "allwinner,sun4i-a10-sram-c1";
> > +                                       reg = <0x000000 0x80000>;
> > +                               };
> > +                       };
> > +               };
> > +
> >                 mali: gpu@1e80000 {
> >                         compatible = "allwinner,sun50i-h5-mali", "arm,mali-450";
> >                         reg = <0x01e80000 0x30000>;
> > --
> > 2.19.1
> >
