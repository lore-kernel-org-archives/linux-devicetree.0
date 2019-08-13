From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] mfd: madera: Add support for requesting the supply
 clocks
Date: Tue, 13 Aug 2019 08:59:23 +0100
Message-ID: <20190813075923.GN54126@ediswmail.ad.cirrus.com>
References: <20190806151321.31137-1-ckeepax@opensource.cirrus.com>
 <20190806151321.31137-2-ckeepax@opensource.cirrus.com>
 <20190812103853.GM26727@dell>
 <20190812160937.GM54126@ediswmail.ad.cirrus.com>
 <20190813071814.GY26727@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813071814.GY26727@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 08:18:14AM +0100, Lee Jones wrote:
> On Mon, 12 Aug 2019, Charles Keepax wrote:
> > On Mon, Aug 12, 2019 at 11:38:53AM +0100, Lee Jones wrote:
> > > On Tue, 06 Aug 2019, Charles Keepax wrote:
> > > 
> > > > Add the ability to get the clock for each clock input pin of the chip
> > > > and enable MCLK2 since that is expected to be a permanently enabled
> > > > 32kHz clock.
> > > > 
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > >  int madera_dev_init(struct madera *madera)
> > > >  {
> > > > +	static const char * const mclk_name[] = { "mclk1", "mclk2", "mclk3" };
> > > >  	struct device *dev = madera->dev;
> > > >  	unsigned int hwid;
> > > >  	int (*patch_fn)(struct madera *) = NULL;
> > > > @@ -450,6 +451,17 @@ int madera_dev_init(struct madera *madera)
> > > >  		       sizeof(madera->pdata));
> > > >  	}
> > > >  
> > > > +	BUILD_BUG_ON(ARRAY_SIZE(madera->mclk) != ARRAY_SIZE(mclk_name));
> > > 
> > > Not sure how this could happen.  Surely we don't need it.
> > > 
> > 
> > mclk_name is defined locally in this function and the mclk array in
> > include/linux/mfd/madera/core.h. This is to guard against one of
> > them being updated but not the other. It is by no means essential
> > but it feels like a good trade off given there is really limited
> > downside.
> 
> It's fine in general I guess.  How likely would it be for anyone to
> update either of the definitions?  Can there be more/less clocks on a
> supported platform?
> 

It's not super likely but if the hardware guys make a new spin
out chip with an extra clock pin which is possible. But my
problem here is there really is no down side to this check, we
have two things that need to be in sync and if the compiler can
warn me if they are not in sync that is clearly a win.

> > > > +	for (i = 0; i < ARRAY_SIZE(madera->mclk); i++) {
> > > > +		madera->mclk[i] = devm_clk_get_optional(madera->dev,
> > > > +							mclk_name[i]);
> > > > +		if (IS_ERR(madera->mclk[i])) {
> > > > +			dev_warn(madera->dev, "Failed to get %s: %ld\n",
> > > > +				 mclk_name[i], PTR_ERR(madera->mclk[i]));
> > > 
> > > Do we even want to warn on the non-acquisition of an optional clock?
> > > 
> > > Especially with a message that looks like something actually failed.
> > > 
> > 
> > devm_clk_get_optional will return NULL if the clock was not
> > specified, so this is silent in that case. A warning in the case
> > something actually went wrong seems reasonable even if the clock
> > is optional as the user tried to do something and it didn't
> > behave as they intended.
> 
> If something actually went wrong, then doesn't then become and error
> and should be reported (returned)?
> 

Yeah I guess its a judgement call but there is not really any
reason we need to proceed in the case of an error. I will update
to fail probe here.

> > > > +			madera->mclk[i] = NULL;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = madera_get_reset_gpio(madera);
> > > >  	if (ret)
> > > >  		return ret;
> > > > @@ -660,13 +672,19 @@ int madera_dev_init(struct madera *madera)
> > > >  	}
> > > >  
> > > >  	/* Init 32k clock sourced from MCLK2 */
> > > > +	ret = clk_prepare_enable(madera->mclk[MADERA_MCLK2]);
> > > > +	if (ret != 0) {
> > > > +		dev_err(madera->dev, "Failed to enable 32k clock: %d\n", ret);
> > > > +		goto err_reset;
> > > > +	}
> > > 
> > > What happened to this being optional?
> > > 
> > 
> > The device needs the clock but specifying it through DT is
> > optional (the clock framework functions are no-ops and return
> > success if the clock pointer is NULL). Normally the 32kHz
> > clock is always on, and more importantly no existing users of
> > the driver will be specifying one.
> > 
> > We could remove the optional status for MCLK2, but it could break
> > existing users who don't yet specify the clock until they update
> > their DT and it will complicate the code as the other clocks are
> > definitely optional, so MCLK2 will need special handling.
> 
> I'd prefer the code to reflect the actual situation.  If the clock is
> not optional it doesn't sound correct to specify it as such.  Maybe as
> an intermediary step we attempt to obtain it, but ignore missing
> clocks (with a message and comment) if it is not yet specified.  We
> can look to change the behaviour once users have had the chance to
> update their DTs.
> 

Ok I will add a print for a missing MCLK2.

Thanks,
Charles
