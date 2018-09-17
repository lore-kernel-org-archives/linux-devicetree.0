From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Mon, 17 Sep 2018 14:50:16 +0100
Message-ID: <20180917135016.GK1653@imbe.wolfsonmicro.main>
References: <20180905104120.17252-1-ckeepax@opensource.cirrus.com>
 <CACRpkdakAAAFKfRFeB_8kUCyGts_7sojVwyexe4aL4QQo2CcGg@mail.gmail.com>
 <20180906144834.GD1653@imbe.wolfsonmicro.main>
 <5b9f3f61.1c69fb81.f4e64.f592@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5b9f3f61.1c69fb81.f4e64.f592@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Sun, Sep 16, 2018 at 06:11:08PM -0500, Rob Herring wrote:
> On Thu, Sep 06, 2018 at 03:48:34PM +0100, Charles Keepax wrote:
> > On Thu, Sep 06, 2018 at 03:46:12PM +0200, Linus Walleij wrote:
> > > On Wed, Sep 5, 2018 at 12:41 PM Charles Keepax
> > > <ckeepax@opensource.cirrus.com> wrote:
> > > It's a bit confusing, maybe you can clear it up:
> > > it appears to be an I2C device, so when you say this is a
> > > "development board" is there something like a board
> > > controller that is accessed over I2C and this is what the
> > > driver really probes to, not the board per se?
> > > 
> > > I guess jamming this card into the I2C slot of any other
> > > system (would work fine with a 96Boards LS connector
> > > as it seems, actually)  also involves connecting some
> > > I2S or similar on the side for high-datarate traffic?
> > > 
> > > This driver seems to only concern itself with the I2C
> > > board controller per se, not the board is that right?
> > > 
> > 
> > Yeah I have poorly phrased that, these patches are very much
> > just dealing with the board controller chip.
> 
> How would the codec I2C connect to the host? Is there one I2C bus or 
> 2? The binding looks mostly fine to me, but I think we need to 
> understand that part.
> 

If the CODEC is I2C based then both the CODEC and the controller
IC will be on the same I2C bus. If the CODEC is connected over
SPI that is obviously a separate bus as the board controller
chip is I2C only.

There are some additional I2C interfaces but they are not
currently used on any mini-cards, and they are intended for
secondary purposes not control of the CODEC itself.

Thanks,
Charles
