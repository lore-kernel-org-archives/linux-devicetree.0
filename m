From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
Date: Mon, 15 Apr 2019 10:11:38 +0200
Message-ID: <CAJiuCceTS=+PM9CLiU6JrfxpPNC5m3XB+j46K6efuM6tYG45Cw@mail.gmail.com>
References: <20190411214422.2267-1-peron.clem@gmail.com> <20190411214422.2267-2-peron.clem@gmail.com>
 <20190415080443.frubh4ln4agrdsfe@flea> <CAJiuCcc0Q8rh8u_30gKi8o07k0+e35UR99ZBHtCjx-DPkJEtdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiuCcc0Q8rh8u_30gKi8o07k0+e35UR99ZBHtCjx-DPkJEtdw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, 15 Apr 2019 at 10:09, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Hi,
>
> On Mon, 15 Apr 2019 at 10:04, Maxime Ripard <maxime.ripard@bootlin.com> w=
rote:
> >
> > Hi,
> >
> > On Thu, Apr 11, 2019 at 11:44:19PM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Allwinner H6 has a SPDIF controller with an increase of the fifo
> > > size and the possibility to output the master clock.
> > > However it's still compatible with the already existing driver for
> > > Allwiner H3.
> > >
> > > Add this compatible in the device-tree bindings documentation.
> >
> > How was this tested?
>
> Using Alsa utils on a Beelink GS1 and I check correct output sound on
> my home cinema.
> >
> > After looking at the datasheet, it looks like it's still significantly
> > different. In particular:
> >
> >   - The MCLK divider isn't at the same offset
> We don't use the MCLK
> >   - The bits to flush the FIFO aren't at the same offset
> >   - The FIFO trigger levels aren't at the same offset
> >   - The FIFO status register layout is almost entirely different
> We use DMA not FIFO

And also only SPDIF Tx has been tested.

>
> Clement
> >
> > So it doesn't really look compatible to me
> >
> > Maxime
> >
> > --
> > Maxime Ripard, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
