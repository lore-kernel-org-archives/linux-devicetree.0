From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: madera: Add support for requesting the supply
 clocks
Date: Tue, 13 Aug 2019 08:18:14 +0100
Message-ID: <20190813071814.GY26727@dell>
References: <20190806151321.31137-1-ckeepax@opensource.cirrus.com>
 <20190806151321.31137-2-ckeepax@opensource.cirrus.com>
 <20190812103853.GM26727@dell>
 <20190812160937.GM54126@ediswmail.ad.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812160937.GM54126@ediswmail.ad.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Mon, 12 Aug 2019, Charles Keepax wrote:

> On Mon, Aug 12, 2019 at 11:38:53AM +0100, Lee Jones wrote:
> > On Tue, 06 Aug 2019, Charles Keepax wrote:
> > 
> > > Add the ability to get the clock for each clock input pin of the chip
> > > and enable MCLK2 since that is expected to be a permanently enabled
> > > 32kHz clock.
> > > 
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >  int madera_dev_init(struct madera *madera)
> > >  {
> > > +	static const char * const mclk_name[] = { "mclk1", "mclk2", "mclk3" };
> > >  	struct device *dev = madera->dev;
> > >  	unsigned int hwid;
> > >  	int (*patch_fn)(struct madera *) = NULL;
> > > @@ -450,6 +451,17 @@ int madera_dev_init(struct madera *madera)
> > >  		       sizeof(madera->pdata));
> > >  	}
> > >  
> > > +	BUILD_BUG_ON(ARRAY_SIZE(madera->mclk) != ARRAY_SIZE(mclk_name));
> > 
> > Not sure how this could happen.  Surely we don't need it.
> > 
> 
> mclk_name is defined locally in this function and the mclk array in
> include/linux/mfd/madera/core.h. This is to guard against one of
> them being updated but not the other. It is by no means essential
> but it feels like a good trade off given there is really limited
> downside.

It's fine in general I guess.  How likely would it be for anyone to
update either of the definitions?  Can there be more/less clocks on a
supported platform?

> > > +	for (i = 0; i < ARRAY_SIZE(madera->mclk); i++) {
> > > +		madera->mclk[i] = devm_clk_get_optional(madera->dev,
> > > +							mclk_name[i]);
> > > +		if (IS_ERR(madera->mclk[i])) {
> > > +			dev_warn(madera->dev, "Failed to get %s: %ld\n",
> > > +				 mclk_name[i], PTR_ERR(madera->mclk[i]));
> > 
> > Do we even want to warn on the non-acquisition of an optional clock?
> > 
> > Especially with a message that looks like something actually failed.
> > 
> 
> devm_clk_get_optional will return NULL if the clock was not
> specified, so this is silent in that case. A warning in the case
> something actually went wrong seems reasonable even if the clock
> is optional as the user tried to do something and it didn't
> behave as they intended.

If something actually went wrong, then doesn't then become and error
and should be reported (returned)?

> > > +			madera->mclk[i] = NULL;
> > > +		}
> > > +	}
> > > +
> > >  	ret = madera_get_reset_gpio(madera);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -660,13 +672,19 @@ int madera_dev_init(struct madera *madera)
> > >  	}
> > >  
> > >  	/* Init 32k clock sourced from MCLK2 */
> > > +	ret = clk_prepare_enable(madera->mclk[MADERA_MCLK2]);
> > > +	if (ret != 0) {
> > > +		dev_err(madera->dev, "Failed to enable 32k clock: %d\n", ret);
> > > +		goto err_reset;
> > > +	}
> > 
> > What happened to this being optional?
> > 
> 
> The device needs the clock but specifying it through DT is
> optional (the clock framework functions are no-ops and return
> success if the clock pointer is NULL). Normally the 32kHz
> clock is always on, and more importantly no existing users of
> the driver will be specifying one.
> 
> We could remove the optional status for MCLK2, but it could break
> existing users who don't yet specify the clock until they update
> their DT and it will complicate the code as the other clocks are
> definitely optional, so MCLK2 will need special handling.

I'd prefer the code to reflect the actual situation.  If the clock is
not optional it doesn't sound correct to specify it as such.  Maybe as
an intermediary step we attempt to obtain it, but ignore missing
clocks (with a message and comment) if it is not yet specified.  We
can look to change the behaviour once users have had the chance to
update their DTs.

> > >  	ret = regmap_update_bits(madera->regmap,
> > >  			MADERA_CLOCK_32K_1,
> > >  			MADERA_CLK_32K_ENA_MASK | MADERA_CLK_32K_SRC_MASK,
> > >  			MADERA_CLK_32K_ENA | MADERA_32KZ_MCLK2);
> > >  	if (ret) {
> > >  		dev_err(madera->dev, "Failed to init 32k clock: %d\n", ret);
> > > -		goto err_reset;
> > > +		goto err_clock;
> > >  	}
> > >  
> > >  	pm_runtime_set_active(madera->dev);
> > > @@ -687,6 +705,8 @@ int madera_dev_init(struct madera *madera)
> > >  
> > >  err_pm_runtime:
> > >  	pm_runtime_disable(madera->dev);
> > > +err_clock:
> > > +	clk_disable_unprepare(madera->mclk[MADERA_MCLK2]);
> > 
> > Where are the other clocks consumed?
> 
> Other clocks will be consumed by the ASoC part of the driver for
> clocking the audio functionality and running the FLLs. I haven't
> sent those patches yet, but was planning on doing so once this
> was merged.

Okay.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
