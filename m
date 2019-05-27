From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 03/10] ARM: dts: sunxi: prefer A31 instead of A13 for ir
Date: Mon, 27 May 2019 10:15:05 +0200
Message-ID: <CAJiuCcd7Ekg5fHQy0sLaiJLdPtH2U0UaMgHkCfhZQOmPg=0RHw@mail.gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190526222536.10917-4-peron.clem@gmail.com>
 <20190527074745.5oyt5tyuoc75ntiq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527074745.5oyt5tyuoc75ntiq@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi Maxime,


On Mon, 27 May 2019 at 09:47, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, May 27, 2019 at 12:25:29AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Since A31, memory mapping of the IR driver has changed.
> >
> > Prefer the A31 bindings instead of A13.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm/boot/dts/sun6i-a31.dtsi   | 2 +-
> >  arch/arm/boot/dts/sun8i-a83t.dtsi  | 2 +-
> >  arch/arm/boot/dts/sun9i-a80.dtsi   | 2 +-
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
>
> Can you split the H3 in a separate patch? this will go through a
> separate branch.

Ok I will,
Thanks,
Cl=C3=A9ment

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
