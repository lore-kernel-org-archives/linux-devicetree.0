From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 25 Oct 2018 13:49:05 +0100
Message-ID: <20181025124905.GF16508@imbe.wolfsonmicro.main>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025114205.GC4870@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 12:42:05PM +0100, Lee Jones wrote:
> On Thu, 25 Oct 2018, Richard Fitzgerald wrote:
> > On 25/10/18 09:26, Charles Keepax wrote:
> > > On Thu, Oct 25, 2018 at 08:44:59AM +0100, Lee Jones wrote:
> > > > On Mon, 08 Oct 2018, Charles Keepax wrote:
> > > > > From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > > > > +static const struct reg_default lochnagar1_reg_defaults[] = {
> > > > > +	{ LOCHNAGAR1_CDC_AIF1_SEL,    0x00 },
> > > > > +	{ LOCHNAGAR1_CDC_AIF2_SEL,    0x00 },
> > > ...
> > > > > +	{ LOCHNAGAR1_LED1,            0x00 },
> > > > > +	{ LOCHNAGAR1_LED2,            0x00 },
> > > > > +	{ LOCHNAGAR1_I2C_CTRL,        0x01 },
> > > > > +};
> > > > 
> > > > Why do you need to specify each register value?
> > > 
> > > The way regmap operates it needs to know the starting value of
> > > each register. It will use this to initialise the cache and to
> > > determine if writes need to actually update the hardware on
> > > cache_syncs after devices have been powered back up.
> 
> That sounds crazy to me.  Some devices have thousands of registers.
> At a line per register, that's thousands of lines of code/cruft.
> Especially seeing as most (sane?) register layouts I've seen default
> to zero.  Then default values can be changed at the leisure of the
> s/w.
> 
> Even if it is absolutely critical that you have to supply these to
> Regmap up-front, instead of on first use/read, why can't you just
> supply the oddball non-zero ones?
> 

I don't think you can sensibly get away with not supplying
default values. You say most sane register layouts have zero
values, alas again you may not be the biggest fan of our hardware
guys. The Lochnagar actually does have mostly zero defaults but
that is very much not generally the case with our hardware.

One of the main aims of regmap is to avoid bus accesses when
possible but I guess on the first write/read to any register you
could insert a read to pull the default, although I do worry
there is some corner case/flexibility that is going to cause
headaches later.

I am not sure that dynamically constructing the defaults would be
possible from a table of non-zero ones, or at least doing so would
probably require a fairly major change to the way registers are
specified since with the current callback based approach and a
sparse regmap you could need to iterate over billions of
potential registers to build the table.

> > > > > +static bool lochnagar2_readable_register(struct device *dev, unsigned int reg)
> > > > > +{
> > > > > +	switch (reg) {
> > > > > +	case LOCHNAGAR_SOFTWARE_RESET:
> > > > > +	case LOCHNAGAR_FIRMWARE_ID1:
> > > > > +	case LOCHNAGAR_FIRMWARE_ID2:
> > > ...
> > > > > +	case LOCHNAGAR2_MICVDD_CTRL2:
> > > > > +	case LOCHNAGAR2_VDDCORE_CDC_CTRL1:
> > > > > +	case LOCHNAGAR2_VDDCORE_CDC_CTRL2:
> > > > > +	case LOCHNAGAR2_SOUNDCARD_AIF_CTRL:
> > > > > +		return true;
> > > > > +	default:
> > > > > +		return false;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static bool lochnagar2_volatile_register(struct device *dev, unsigned int reg)
> > > > > +{
> > > > > +	switch (reg) {
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL1:
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL2:
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL3:
> > > ...
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL13:
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL14:
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL15:
> > > > > +	case LOCHNAGAR2_GPIO_CHANNEL16:
> > > > > +	case LOCHNAGAR2_ANALOGUE_PATH_CTRL1:
> > > > > +		return true;
> > > > > +	default:
> > > > > +		return false;
> > > > > +	}
> > > > > +}
> > > > 
> > > > This is getting silly now.  Can't you use ranges?
> > > 
> > > I can if you feel strongly about it? But it does make the drivers
> > > much more error prone and significantly more annoying to work
> > > with. I find it is really common to be checking that a register
> > > is handled correctly through the regmap callbacks and it is nice
> > > to just be able to grep for that. Obviously this won't work for
> > > all devices/regmaps as well since many will not have consecutive
> > > addresses on registers, for example having multi-byte registers
> > > that are byte addressed.
> > > 
> > > How far would you like me to take this as well? Is it just the
> > > numeric registers you want ranges for ie.
> > > 
> > > LOCHNAGAR2_GPIO_CHANNEL1...LOCHNAGAR_GPIO_CHANNEL16
> > > 
> > > Or is it all consecutive registers even if they are unrelated
> > > (exmaple is probably not accurate as I haven't checked the
> > > addresses):
> > > 
> > > LOCHNAGAR2_GPIO_CHANNEL1...LOCHNAGAR2_ANALOGURE_PATH_CTRL1
> > > 
> > > I don't mind the first at all but the second is getting really
> > > horrible in my opinion.
> 
> My issue is that we have one end of the scale, where contributors are
> submitting patches, trying to remove a line of code here, a line of
> code there, then there are patches like this one which describe the
> initial value, readable status, writable status and volatile status of
> each and every register.
> 

Removing code is one thing but I would argue that data tables are
somewhat less of a concern. I guess kernel size for very small
systems but then is someone going to be using Lochnagar on one of
those.

> The API is obscene and needs a re-work IMHO.
> 
> I really hope we do not really have to list every register, but *if we
> absolutely must*, let's do it once:
> 
>   REG_ADDRESS, WRV, INITIAL_VALUE
> 

It might be possible to combine all these into one thing,
although again its a fairly major core change.

> > > > > +static const struct reg_default lochnagar2_reg_defaults[] = {
> > > > > +	{ LOCHNAGAR2_CDC_AIF1_CTRL,         0x0000 },
> > > > > +	{ LOCHNAGAR2_CDC_AIF2_CTRL,         0x0000 },
> > > > > +	{ LOCHNAGAR2_CDC_AIF3_CTRL,         0x0000 },
> > > > > +	{ LOCHNAGAR2_DSP_AIF1_CTRL,         0x0000 },
> > > ...
> > > > > +	{ LOCHNAGAR2_MINICARD_RESETS,       0x0000 },
> > > > > +	{ LOCHNAGAR2_ANALOGUE_PATH_CTRL2,   0x0000 },
> > > > > +	{ LOCHNAGAR2_COMMS_CTRL4,           0x0001 },
> > > > > +	{ LOCHNAGAR2_SPDIF_CTRL,            0x0008 },
> > > > > +	{ LOCHNAGAR2_POWER_CTRL,            0x0001 },
> > > > > +	{ LOCHNAGAR2_SOUNDCARD_AIF_CTRL,    0x0000 },
> > > > > +};
> > > > 
> > > > OMG!  Vile, vile vile!
> > > 
> > > I really feel this isn't the driver you are objecting to as such
> > > but the way regmap operates and also we seem to always have the same
> > > discussions around regmap every time we push a driver.
> 
> Absolutely.  I didn't like it before.  I like it even less now.
> 

I guess the question from my side becomes do you want to block
this driver pending on major refactoring to regmap? I will have a
think about what I can do but its going to affect a LOT of drivers.

> > > > > +	ret = devm_of_platform_populate(dev);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Failed to populate child nodes: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > 
> > > > Please do not mix OF and MFD device registration strategies.
> > > > 
> > > > Pick one and register all devices through your chosen method.
> > > 
> > > Hmmm we use this to do things like register some fixed regulators
> > > and clocks that don't need any control but do need to be associated
> > > with the device. I could do that through the MFD although it is in
> > > direct conflict with the feedback on the clock patches I received
> > > to move the fixed clocks into devicetree rather than registering
> > > them manually (see v2 of the patch chain).
> 
> The I suggest moving everything to DT.
> 

I will have a look and see what that would look like.

Thanks,
Charles
