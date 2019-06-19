MIME-Version: 1.0
Date: Wed, 19 Jun 2019 07:46:05 -0600
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
	<20190527161938.31871-1-leif.middelschulte@klsmartin.com>
	<20190527161938.31871-5-leif.middelschulte@klsmartin.com>
	<20190614195859.GA6351@bogus>
	<aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
In-Reply-To: <aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
Message-ID: <CAL_JsqJBqxfSJh0Htm3esnF9DnbnNHKFMxj=iLyGcuL88qepBw@mail.gmail.com>
Subject: Re: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 19, 2019 at 6:47 AM Middelschulte, Leif
<Leif.Middelschulte@klsmartin.com> wrote:
>
> Am Freitag, den 14.06.2019, 13:58 -0600 schrieb Rob Herring:
> > On Mon, May 27, 2019 at 06:19:37PM +0200, Leif Middelschulte wrote:
> > > The tracking index is a "minimum" distance two touch
> > > points need to have in order for the second to be valid.
> > > This adds the corresponding binding property documentation.
> > >
> > > Signed-off-by: Leif Middelschulte <
> > > leif.middelschulte@klsmartin.com
> > > >
> > > ---
> > >  .../bindings/input/touchscreen/stmpe.txt          | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > index 09d2d4f288cc..8696af35a7b8 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > @@ -42,6 +42,21 @@ Optional properties:
> > >                             The given window also affects the value range (limits) set
> > >                             within the input subsystem which, in turn, affects
> > >                             the input resolution calculation on both axes.
> > > +- st,tracking-index        : Minimal distance between the current touch position and the previous
> > > +                           touch position. If the distance is shorter than the tracking
> > > +                           index, it is discarded. The tracking is calculated by summation
> > > +                           of the horizontal and vertical movement.
> > > +                           If pressure reporting is enabled (X/Y/Z), an increase in pressure
> > > +                           override the movement tracking and report the new data set, even
> > > +                           if X/Y is within the previous tracking index.
> > > +                           0 -> disabled
> > > +                           1 -> 4
> > > +                           4 -> 8
> > > +                           3 -> 16
> > > +                           4 -> 32
> > > +                           5 -> 64
> > > +                           6 -> 92
> > > +                           7 -> 127
> >
> > This is what touchscreen-fuzz-x/y is for.
>
> The stmpe touchcontroller does not support handling each axis separately.
> Also it is not to be mistaken in its specific behavior (i.e. override)
> for the general `fuzz` parameter. However, should I rename it to `st,fuzz-x-y` or similar?
>
> AFAICS there[0] is no generic combined devicetree property, is there?

Can't you set both properties and require them to be the same value?

Rob
