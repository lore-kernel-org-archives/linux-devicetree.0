From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: sun50i: h6: Introduce Beelink GS1 board
Date: Fri, 5 Apr 2019 18:40:23 +0200
Message-ID: <CAJiuCcdVsiKRxLFKnmAPnApi2EJANbuQf9WUESGE+LBP8zpD+A@mail.gmail.com>
References: <20190405122446.2101-1-peron.clem@gmail.com> <20190405122446.2101-5-peron.clem@gmail.com>
 <CAJiuCcfbnR+Jfj8Je_4HwgycCBEe92sx6zqwqgXpeiMe2jKL-Q@mail.gmail.com> <20190405151100.jjjg55z7sg35ijxw@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405151100.jjjg55z7sg35ijxw@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 5 Apr 2019 at 17:11, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> On Fri, Apr 05, 2019 at 02:53:35PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > Adding this r_pio regulators make a new error in the bootlog :
> >
> > [    0.346843] sun50i-h6-r-pinctrl 7022000.pinctrl: Couldn't get bank
> > PL regulator
> > [    0.346853] sun50i-h6-r-pinctrl 7022000.pinctrl: request() failed fo=
r pin 352
> > [    0.346862] sun50i-h6-r-pinctrl 7022000.pinctrl: pin-352
> > (7081400.i2c) status -517
> > [    0.346871] sun50i-h6-r-pinctrl 7022000.pinctrl: could not request
> > pin 352 (PL0) from group PL0  on device 7022000.pinctrl
> > [    0.346878] mv64xxx_i2c 7081400.i2c: Error applying setting,
> > reverse things back
> >
> > PL0 and PL1 are SCK/SDA for the PMIC :(
>
> How was this DT tested then?

There was a mistake when I tested the patch v2 and only saw this after
posting the patch.

Can I submit a V3 without pio / r_pio regulators ? (+ the yaml patch separa=
ted)

Thanks,

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
