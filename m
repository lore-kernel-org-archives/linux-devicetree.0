From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 2/8] regulator: Support ROHM BD71847 power management IC
Date: Wed, 12 Sep 2018 09:37:41 +0300
Message-ID: <20180912062201.GA2381@localhost.localdomain>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <9fa1da19c69d3dab33234d8f06ffae91fb56672f.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <20180911134808.GP4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911134808.GP4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hello Lee,

Thanks again for the review! I see you did bunch of them... I really
admire your devotion. For me reviewing is hard work. I do appreciate
it. So nice to see you're back in the business =)

On Tue, Sep 11, 2018 at 02:48:08PM +0100, Lee Jones wrote:
> On Wed, 29 Aug 2018, Matti Vaittinen wrote:
> 
> > +static const u8 bd71837_supported_revisions[] = { 0xA2 };
> > +static const u8 bd71847_supported_revisions[] = { 0xA0 };
> 
> I haven't seen anything like this before.
> 
> Is this really required?
> 
> Especially since you only have 1 of each currently.

Valid question. I did ask the same thing myself. Reason why I ended up
doing this is simple though. I have no idea what may change if "chip
revision" is changed. I only know that I have chip(s) with these
revisions on my table - and I have a data sheet which mentions these
revisions. So I can only test that driver works with these revisions. I
however assume there will be new revisions and I thought that with this
approach marking them as supported will only require adding the revisio
to these arrays.

But as you have said - this makes code slightly more complex - even if I
disagree with you regarding how complex is too complex =) The use case
and intention of tables is quite obvious, right? That makes following
the loops in probe pretty easy after all...

But I won't start arguing with you - let's assume the register interface
won't get changed - and if it does, well, let's handle that then. So
I'll drop whole revision check.

> 
> > -static const u8 supported_revisions[] = { 0xA2 /* BD71837 */ };
> > +struct known_revisions {
> > +	const u8 (*revisions)[];
> > +	unsigned int known_revisions;
> 
> I didn't initially know what this was at first glance.
> 
> Please re-name it to show that it is the number of stored revisions.

This will be fixed as I'll drop the revision check

> > +static const struct known_revisions supported_revisions[BD718XX_TYPE_AMNT] = {
> > +	[BD718XX_TYPE_BD71837] = {
> > +		.revisions = &bd71837_supported_revisions,
> > +		.known_revisions = ARRAY_SIZE(bd71837_supported_revisions),
> > +	},
> > +	[BD718XX_TYPE_BD71847] = {
> > +		.revisions = &bd71847_supported_revisions,
> > +		.known_revisions = ARRAY_SIZE(bd71847_supported_revisions),
> > +	},
> > +};
> >  
> > @@ -91,13 +104,19 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
> >  {
> >  	struct bd71837 *bd71837;
> >  	int ret, i;
> > +	const unsigned int *type;
> >  
> > +	type = of_device_get_match_data(&i2c->dev);
> > +	if (!type || *type >= BD718XX_TYPE_AMNT) {
> > +		dev_err(&i2c->dev, "Bad chip type\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	bd71837->chip_type = *type;

> > +	ret = regmap_read(bd71837->regmap, BD718XX_REG_REV, &bd71837->chip_rev);

> > +	for (i = 0;
> > +	     i < supported_revisions[bd71837->chip_type].known_revisions; i++)
> > +		if ((*supported_revisions[bd71837->chip_type].revisions)[i] ==
> > +		    bd71837->chip_rev)
> >  			break;
> >  
> > +	if (i == supported_revisions[bd71837->chip_type].known_revisions) {
> > +		dev_err(&i2c->dev, "Unrecognized revision 0x%02x\n",
> > +			bd71837->chip_rev);
> > +		return -EINVAL;
> >  	}
> 
> This has become a very (too) elaborate way to see if the current
> running version is supported.  Please find a way to solve this (much)
> more succinctly.  There are lots of examples of this.

I cut out pieces of quoted patch to shorten it to relevant bits.

As I said above - I think this is not as bad as you say - it is quite
obvious what it does after all. And adding new revision would be just
adding new entry to the revision array. But yes, I am not sure if this
is needed so I'll drop this. Let's work the compatibility issues between
revisions only if such ever emerge =)
> 
> In fact, since you are using OF, it is not possible for this driver to
> probe with an unsupported device.  You can remove the whole lot.
> 
I don't really see how the OF helps me with revisions - as chip revision
is not presented in DT. The type of chip of course is. So you're right.
Check for invalid chip_type can be dropped.

> > +static const unsigned int chip_types[] = {
> > +	[BD718XX_TYPE_BD71837] = BD718XX_TYPE_BD71837,
> > +	[BD718XX_TYPE_BD71847] = BD718XX_TYPE_BD71847,
> > +};
> >  
> >  static const struct of_device_id bd71837_of_match[] = {
> > -	{ .compatible = "rohm,bd71837", },
> > +	{
> > +		.compatible = "rohm,bd71837",
> > +		.data = &chip_types[BD718XX_TYPE_BD71837]
> > +	},
> > +	{
> > +		.compatible = "rohm,bd71847",
> > +		.data = &chip_types[BD718XX_TYPE_BD71847]
> 
> Again, way too complex.  Why not simply:
> 
>        .data = (void *)BD718XX_TYPE_BD71847?
> 

Ugh. That's horrible on my eyes. I dislike delivering data in addresses.
That's why I rather did array with IDs and used pointer to array member
here. But this is again not the battle I must win - so I'll do as you
suggested even if it looks ugly to me. I think we alreadt  had discussion
about vomitting on keyboard last summer - so let's not go back to that
now. ;)

> [...]
> 
> > -	BD71837_REGULATOR_CNT,
> > +	BD718XX_TYPE_BD71837,
> > +	BD718XX_TYPE_BD71847,
> > +	BD718XX_TYPE_AMNT // Keep this as last item
> 
> No C++ comments please.
> 
> What does AMNT mean?  I'm guessing it means amount, which isn't a
> valid type. I suggest MAX_BOARD_TYPES or similar instead.

You're not bad at guessing! =)

Well, what I like here is keeping the beginning of enum member the same.
When you see BD718XX_TYPE_AMNT used in driver you know that the enum value
belongs to this enum defining all BD718XX_TYPEs. And I like the amount
rather than MAX because MAX suggests that the value is last valid value.
Which is not the case here. And as the numbering begins from zero, this
enum really is amount of valid types. Thus I like the amount. Do you
think BD718XX_TYPE_AMOUNT would do? I know it is a bit Yodaish language
but it still should be clear enough and it would maintain the same enum
name prefix as other members in this enum.

> > +	BD718XX_LDO7,
> > +	BD718XX_REGULATOR_MAX,
> 
> Closer.
> 
> Whatever you choose to use, please ensure the last entries of the
> enums use a similar format.

Fair point. I'll cook new patch which fixes the define naming (just please
give me your opinion on using "BD718XX_TYPE_AMOUNT") and drops the
revision check from probe. Oh, and uses the .data pointer to contain the
chip type and not location where chip type is stored (even if my heart
burns, eyes bleed and <invent more things here by yourself>) ;)

Br,
	Matti Vaittinen
