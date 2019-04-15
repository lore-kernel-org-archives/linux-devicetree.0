From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
Date: Mon, 15 Apr 2019 18:30:10 +0200
Message-ID: <CAJiuCcdrQ64jC8UH1eDKKhFdcOtk=bkWTAzoYOQ1ut3He+j2GQ@mail.gmail.com>
References: <20190411214422.2267-1-peron.clem@gmail.com> <20190411214422.2267-2-peron.clem@gmail.com>
 <20190415080443.frubh4ln4agrdsfe@flea> <CAJiuCcc0Q8rh8u_30gKi8o07k0+e35UR99ZBHtCjx-DPkJEtdw@mail.gmail.com>
 <20190415081816.2pay4pioc5d4mojf@flea> <CAJiuCcedNF0xYSa_+Zfwj-vqYsbjfEpRqisOhEvuitYALMsyjw@mail.gmail.com>
 <20190415145135.fjbcaldwy7w3eqcs@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415145135.fjbcaldwy7w3eqcs@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 15 Apr 2019 at 16:51, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, Apr 15, 2019 at 10:30:38AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Mon, 15 Apr 2019 at 10:18, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > >
> > > On Mon, Apr 15, 2019 at 10:09:11AM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Hi,
> > > >
> > > > On Mon, 15 Apr 2019 at 10:04, Maxime Ripard <maxime.ripard@bootlin.=
com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu, Apr 11, 2019 at 11:44:19PM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:
> > > > > > Allwinner H6 has a SPDIF controller with an increase of the fif=
o
> > > > > > size and the possibility to output the master clock.
> > > > > > However it's still compatible with the already existing driver =
for
> > > > > > Allwiner H3.
> > > > > >
> > > > > > Add this compatible in the device-tree bindings documentation.
> > > > >
> > > > > How was this tested?
> > > >
> > > > Using Alsa utils on a Beelink GS1 and I check correct output sound =
on
> > > > my home cinema.
> > > >
> > > > > After looking at the datasheet, it looks like it's still signific=
antly
> > > > > different. In particular:
> > > > >
> > > > >   - The MCLK divider isn't at the same offset
> > > >
> > > > We don't use the MCLK
> > > >
> > > > >   - The bits to flush the FIFO aren't at the same offset
> > > > >   - The FIFO trigger levels aren't at the same offset
> > > > >   - The FIFO status register layout is almost entirely different
> > > >
> > > > We use DMA not FIFO
> > >
> > > Well, DMA still uses the FIFOs. And even then, you're kind of missing
> > > the point. The device tree's compatible is about whether a particular
> > > device can be used as another one. How you are using it in the driver
> > > is completely irrelevant.
> >
> > Sorry I meant " We use DMA not PIO".
>
> I'm still not quite sure what you mean. Both DMA and PIO would be
> using the FIFOs.

Just correcting myself but yes we use FIFO with the DMA.

>
> > I didn't change the driver and the SPDIF is working what's irrelevant
> > in declaring the driver as compatible ?
>
> It's working by accident.
>
> This won't work for example:
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sunxi/sun4i-spdi=
f.c#L181
>
> > If some feature are missing they can be introduce later as there is a
> > special binding for H6 no ?
>
> Again, that's irrelevant. The only question you need to ask yourself
> is whether, if you take an imaginary source code that would support
> all the H3 SPDIF features and run it on an H6, it works just as well.
>
> The examples above that it's not the case, so you can't claim that the
> device is compatible.

Is it ok if I fix the TX Fifo flush bit and remove the compatible with H3 ?
(Looking at the driver this is the only bit used that is incompatible with =
H6)

Or should I send a new driver with the correct mapping ?

Thanks
Cl=C3=A9ment


>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
