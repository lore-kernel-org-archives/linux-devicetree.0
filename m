From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
Date: Tue, 16 Apr 2019 10:30:58 +0200
Message-ID: <CAJiuCcdXeaXPD9k8QTL3C+CYnMhSgrx-We=s0pVBhS2rprcDNw@mail.gmail.com>
References: <20190411214422.2267-1-peron.clem@gmail.com> <20190411214422.2267-2-peron.clem@gmail.com>
 <20190415080443.frubh4ln4agrdsfe@flea> <CAJiuCcc0Q8rh8u_30gKi8o07k0+e35UR99ZBHtCjx-DPkJEtdw@mail.gmail.com>
 <20190415081816.2pay4pioc5d4mojf@flea> <CAJiuCcedNF0xYSa_+Zfwj-vqYsbjfEpRqisOhEvuitYALMsyjw@mail.gmail.com>
 <20190415145135.fjbcaldwy7w3eqcs@flea> <CAJiuCcdrQ64jC8UH1eDKKhFdcOtk=bkWTAzoYOQ1ut3He+j2GQ@mail.gmail.com>
 <20190416073449.qzl3uyjgvjgd3tai@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416073449.qzl3uyjgvjgd3tai@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 16 Apr 2019 at 09:34, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, Apr 15, 2019 at 06:30:10PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > > > I didn't change the driver and the SPDIF is working what's irreleva=
nt
> > > > in declaring the driver as compatible ?
> > >
> > > It's working by accident.
> > >
> > > This won't work for example:
> > > https://elixir.bootlin.com/linux/latest/source/sound/soc/sunxi/sun4i-=
spdif.c#L181
> > >
> > > > If some feature are missing they can be introduce later as there is=
 a
> > > > special binding for H6 no ?
> > >
> > > Again, that's irrelevant. The only question you need to ask yourself
> > > is whether, if you take an imaginary source code that would support
> > > all the H3 SPDIF features and run it on an H6, it works just as well.
> > >
> > > The examples above that it's not the case, so you can't claim that th=
e
> > > device is compatible.
> >
> > Is it ok if I fix the TX Fifo flush bit and remove the compatible with =
H3 ?
> > (Looking at the driver this is the only bit used that is incompatible w=
ith H6)
>
> Sure
>
> > Or should I send a new driver with the correct mapping ?
>
> No, we definitely don't want to duplicate a driver just for a single
> bit offset that changes.

Thanks for the advice, I will try to submit a new version with this fix.
Clement

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
