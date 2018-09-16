Return-Path: <robherring2@gmail.com>
Message-ID: <5b9f3f61.1c69fb81.f4e64.f592@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
References: <20180905104120.17252-1-ckeepax@opensource.cirrus.com>
 <CACRpkdakAAAFKfRFeB_8kUCyGts_7sojVwyexe4aL4QQo2CcGg@mail.gmail.com>
 <20180906144834.GD1653@imbe.wolfsonmicro.main>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180906144834.GD1653@imbe.wolfsonmicro.main>
Date: Sun, 16 Sep 2018 18:11:08 -0500
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 06, 2018 at 03:48:34PM +0100, Charles Keepax wrote:
> On Thu, Sep 06, 2018 at 03:46:12PM +0200, Linus Walleij wrote:
> > On Wed, Sep 5, 2018 at 12:41 PM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > 
> > > From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > >
> > > Lochnagar is an evaluation and development board for Cirrus
> > > Logic Smart CODEC and Amp devices. It allows the connection of
> > > most Cirrus Logic devices on mini-cards, as well as allowing
> > > connection of various application processor systems to provide a
> > > full evaluation platform.  Audio system topology, clocking and
> > > power can all be controlled through the Lochnagar, allowing the
> > > device under test to be used in a variety of possible use cases.
> > >
> > > As the Lochnagar is a fairly complex device this MFD driver
> > > allows the drivers for the various features to be bound
> > > in. Initially clocking, regulator and pinctrl will be added as
> > > these are necessary to configure the system. But in time at least
> > > audio and voltage/current monitoring will also be added.
> > >
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > 
> > It's a bit confusing, maybe you can clear it up:
> > it appears to be an I2C device, so when you say this is a
> > "development board" is there something like a board
> > controller that is accessed over I2C and this is what the
> > driver really probes to, not the board per se?
> > 
> > I guess jamming this card into the I2C slot of any other
> > system (would work fine with a 96Boards LS connector
> > as it seems, actually)  also involves connecting some
> > I2S or similar on the side for high-datarate traffic?
> > 
> > This driver seems to only concern itself with the I2C
> > board controller per se, not the board is that right?
> > 
> 
> Yeah I have poorly phrased that, these patches are very much
> just dealing with the board controller chip.

How would the codec I2C connect to the host? Is there one I2C bus or 
2? The binding looks mostly fine to me, but I think we need to 
understand that part.

> 
> You could connect just the I2C to something like the 96Boards LS
> connector, and control all the functionality accessed by this
> driver. Although if you want to send audio between your 96Boards
> device and the Lochnagar you would need to connect up some I2S as
> well.
> 
> Thanks,
> Charles
