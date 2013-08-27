From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 09/33] ARM: ux500: Supply the I2C clocks lookup to the
 DBX500 DT
Date: Tue, 27 Aug 2013 15:08:05 +0100
Message-ID: <20130827140805.GB10210@lee--X1>
References: <20130820093034.GL31036@pengutronix.de>
 <20130822133730.GB23152@e106331-lin.cambridge.arm.com>
 <20130822141900.GB17154@lee--X1>
 <20130822151723.GE23152@e106331-lin.cambridge.arm.com>
 <20130822154116.GC17154@lee--X1>
 <20130822211912.GE31036@pengutronix.de>
 <20130823075607.GD17154@lee--X1>
 <20130823165539.GD7015@e106331-lin.cambridge.arm.com>
 <20130827080635.GC6152@lee--X1>
 <20130827134621.GJ19893@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130827134621.GJ19893@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 Aug 2013, Mark Rutland wrote:

> On Tue, Aug 27, 2013 at 09:06:35AM +0100, Lee Jones wrote:
> > On Fri, 23 Aug 2013, Mark Rutland wrote:
> >=20
> > > On Fri, Aug 23, 2013 at 08:56:07AM +0100, Lee Jones wrote:
> > > > I had a short chat with Rob last night about this. I'm going to=
 loop
> > > > him in to the conversation, as he wrote the binding.
> > > >=20
> > > > > > When most of the other clocks that we deal with are being r=
equested,
> > > > > > they rely on being index zero:
> > > > > >=20
> > > > > >   drivers/i2c/busses/i2c-nomadik.c: dev->clk =3D clk_get(&a=
dev->dev, NULL);
> > > > >=20
> > > > > Look at drivers/clk/clkdev.c, there's some fuzzy matching
> > > > > involved when you pass NULL as connection id.
> > > >=20
> > > > Yes, I've been looking at that. This is why it works currently.=
 I
> > > > think I need to change all of the drivers to specify which cloc=
k they
> > > > want. At the moment that 'fuzzy matching' is what's saving us. =
If
> > > > anyone were to change our DTS file to match what the binding sa=
ys,
> > > > then it would cease to work. I'm guessing this is the same for =
all
> > > > other DTS files too:
> > >=20
> > > I think if anything, the binding document(s) should be updated to
> > > describe that apb_pclk is referred to by name, and the names of t=
he
> > > other clocks should be described in the specific device bindings.=
 We can
> > > then modify the drivers which grab clock 0 to explicitly grab the=
 first
> > > clock by name, and backwards compatibility should not be broken.
> > >=20
> > > I don't believe any other OS has implemented the common clock bin=
dings,
> > > and we've never supported the binding as described. Let's correct=
 the
> > > de-facto standard into a standard by decree.
> >=20
> > I think we need to respect, or at least take into consideration the
> > reason for the original 'de-facto' standard. Other OSes shouldn't b=
e
> > forced to provide a named clock request in order to obtain
> > 'apb_pclk'. If the binding says it should be first, then perhaps we
> > should do just that. It's simply a matter of naming all subsequent
> > clocks related to AMBA devices.
>=20
> Ideally, yes. However, we have to be careful to not break compatibili=
ty.
>=20
> I took a look at existing primecell drivers and what they do. The
> situation isn't so bad (with the exception of the
> half-dt/half-platform-code mess):
>=20
> * Some don't deal with clocks at all (no clk* in the driver). pl320 i=
s
>   in the ecx-common dtsi with only apb_pclk but has no binding
>   defined. Some have no clocks defined in the dt and are presumably f=
ew
>   clocks by platform data or are non-functional.
>=20
>   I'm not sure how these DTs are going to be supported if and when we
>   remove the platform data they depend upon. If we're really going to=
 do
>   that, then they are clearly not supported as-is long term.
>=20
> * The pl022 driver grabs the first clock to figure out the rate of th=
e
>   spi bus (assuming it is SSPCLK). The SSPCLK input is not defined in
>   the binding. The ste-u300 dts has two clock-names, "apb_pclk" and
>   "spi_clk" (in that order), but they refer to the same clock.
>=20
>   Given the existing driver simply grabs the first clock and they're
>   both the same, we could re-order the names and make the driver grab
>   the second clock. That wouldn't break backwards compatibility with =
the
>   sole dts file we have using the binding, though this assumes no-one
>   else has a dt lying around with different clocks.
>=20
> * pl010 grabs the first clock given to it to figure out the uart rate
>   (assuming it is UARTCLK), but it's only in integratorap.dts, withou=
t
>   clocks, and is presumably fed by platform data. There is no binding
>   document.
>=20
>   pl011 grabs the first clock given to figure out the UART rate
>   (assuming it is UARTCLK). The binding explicitly states it's only
>   given apb_pclk, despite UARTCLK and PCLK being separate inputs to t=
he
>   IP block.
>=20
>   These two bindings don't describe the hardware, and should be fixed=
=2E
>   The only way I can think to make this work without breaknig backwar=
ds
>   compatibility would be to try to grab the second clock and then fal=
l
>   back to the first if there isn't one. The other option is to break
>   backwards compatibility, but I'm not sure that's much of an option.
>=20
> * pl111 has no driver or binding in mainline, but appears in dts file=
s.
>   Those dts files clcdclk and apb_pclk, in that order. We could fix
>   those before a driver starts using them.
>=20
> If you think those suggestions are OK, I can put together a series to
> fix this.

I think we need to hear from Rob before we proceed tbh, as he is the
original author and should have a chance to voice his opinion.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
