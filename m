From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 04/13] media: rc: sunxi: Add RXSTA bits definition
Date: Wed, 5 Jun 2019 14:44:06 +0200
Message-ID: <CAJiuCceZa=WEiF8_LK+jDdiXOn1i8+z8Smr6YKCpo9_XftgueQ@mail.gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com> <20190604162959.29199-5-peron.clem@gmail.com>
 <20190605095141.psrq6mhk63zto77s@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605095141.psrq6mhk63zto77s@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Wed, 5 Jun 2019 at 11:51, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> On Tue, Jun 04, 2019 at 06:29:50PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > We are using RXINT bits definition when looking at RXSTA register.
> >
> > These bits are equal but it's not really proper.
> >
> > Introduce the RXSTA bits and use them to have coherency.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.=
c
> > index 0504ebfc831f..572bd2257d35 100644
> > --- a/drivers/media/rc/sunxi-cir.c
> > +++ b/drivers/media/rc/sunxi-cir.c
> > @@ -48,11 +48,11 @@
> >
> >  /* Rx Interrupt Enable */
> >  #define SUNXI_IR_RXINT_REG    0x2C
> > -/* Rx FIFO Overflow */
> > +/* Rx FIFO Overflow Interrupt Enable */
> >  #define REG_RXINT_ROI_EN             BIT(0)
> > -/* Rx Packet End */
> > +/* Rx Packet End Interrupt Enable */
> >  #define REG_RXINT_RPEI_EN            BIT(1)
> > -/* Rx FIFO Data Available */
> > +/* Rx FIFO Data Available Interrupt Enable */
> >  #define REG_RXINT_RAI_EN             BIT(4)
> >
> >  /* Rx FIFO available byte level */
> > @@ -60,6 +60,12 @@
> >
> >  /* Rx Interrupt Status */
> >  #define SUNXI_IR_RXSTA_REG    0x30
> > +/* Rx FIFO Overflow */
> > +#define REG_RXSTA_ROI                        BIT(0)
> > +/* Rx Packet End */
> > +#define REG_RXSTA_RPE                        BIT(1)
> > +/* Rx FIFO Data Available */
> > +#define REG_RXSTA_RA                 BIT(4)
>
> I'm fine with it on principle, but if the consistency needs to be
> maintained then we could just reuse the above defines

There is no comment why we can reuse them, they can also be some wrong
case for example the RXINT_DRQ_EN bit is not present in RXSTA and same
for STAT bit present in RXSTA and not present in RXINT.

I have discover and read this code a month ago and this logic is
really not obvious nor explain.

Maybe this hack could be done when we will introduce a quirks, but for
the moment I really think that it's more proper and readable to
introduce them properly.

Regards,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
