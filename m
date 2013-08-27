From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 09/33] ARM: ux500: Supply the I2C clocks lookup to the
 DBX500 DT
Date: Tue, 27 Aug 2013 09:06:35 +0100
Message-ID: <20130827080635.GC6152@lee--X1>
References: <1370521041-32318-10-git-send-email-lee.jones@linaro.org>
 <CACRpkdbE86HgPr+7LZD9BFU_OsDFFFWTaFHW_i2fNXivKZ-3Dw@mail.gmail.com>
 <20130820093034.GL31036@pengutronix.de>
 <20130822133730.GB23152@e106331-lin.cambridge.arm.com>
 <20130822141900.GB17154@lee--X1>
 <20130822151723.GE23152@e106331-lin.cambridge.arm.com>
 <20130822154116.GC17154@lee--X1>
 <20130822211912.GE31036@pengutronix.de>
 <20130823075607.GD17154@lee--X1>
 <20130823165539.GD7015@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130823165539.GD7015@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Aug 2013, Mark Rutland wrote:

> On Fri, Aug 23, 2013 at 08:56:07AM +0100, Lee Jones wrote:
> > I had a short chat with Rob last night about this. I'm going to loo=
p
> > him in to the conversation, as he wrote the binding.
> >=20
> > > > When most of the other clocks that we deal with are being reque=
sted,
> > > > they rely on being index zero:
> > > >=20
> > > >   drivers/i2c/busses/i2c-nomadik.c: dev->clk =3D clk_get(&adev-=
>dev, NULL);
> > >=20
> > > Look at drivers/clk/clkdev.c, there's some fuzzy matching
> > > involved when you pass NULL as connection id.
> >=20
> > Yes, I've been looking at that. This is why it works currently. I
> > think I need to change all of the drivers to specify which clock th=
ey
> > want. At the moment that 'fuzzy matching' is what's saving us. If
> > anyone were to change our DTS file to match what the binding says,
> > then it would cease to work. I'm guessing this is the same for all
> > other DTS files too:
>=20
> I think if anything, the binding document(s) should be updated to
> describe that apb_pclk is referred to by name, and the names of the
> other clocks should be described in the specific device bindings. We =
can
> then modify the drivers which grab clock 0 to explicitly grab the fir=
st
> clock by name, and backwards compatibility should not be broken.
>=20
> I don't believe any other OS has implemented the common clock binding=
s,
> and we've never supported the binding as described. Let's correct the
> de-facto standard into a standard by decree.

I think we need to respect, or at least take into consideration the
reason for the original 'de-facto' standard. Other OSes shouldn't be
forced to provide a named clock request in order to obtain
'apb_pclk'. If the binding says it should be first, then perhaps we
should do just that. It's simply a matter of naming all subsequent
clocks related to AMBA devices.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
