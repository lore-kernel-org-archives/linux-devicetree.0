From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 7 Mar 2018 14:15:09 +0000
Message-ID: <20180307141509.e3dpxteodxeoy2k3@localhost.localdomain>
References: <20180220163540.6704-1-ckeepax@opensource.cirrus.com>
 <20180307132812.r5epcs26clpnh72t@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180307132812.r5epcs26clpnh72t@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 01:28:12PM +0000, Lee Jones wrote:
> On Tue, 20 Feb 2018, Charles Keepax wrote:
> > +	if (IS_ERR(pdata->reset)) {
> > +		ret = PTR_ERR(pdata->reset);
> > +		switch (ret) {
> > +		case -ENOENT:
> > +		case -ENOSYS:
> > +			break;
> > +		case -EPROBE_DEFER:
> > +			return ret;
> > +		default:
> > +			dev_err(arizona->dev, "Reset GPIO malformed: %d\n",
> > +				ret);
> > +			break;
> > +		}
> 
> I haven't seen a switch statement used in the error handling path
> before.  There is probably good reason for that.
> 

There are a fair few of them "grep -rI "switch (ret)" | wc -l" ==
205. Although to be fair that has rarely been an argument in
somethings favour.

> What is the 'default' case?  -EINVAL?
> 

I would guess most of the time yes, but I would rather not assume
that. I can redo this as if's if you prefer it that way? The if is
slightly less lines although I do think the switch is much
clearer as to intent.

if (ret == -EPROBE_DEFER) {
	return ret;
} else if (ret != -ENOENT && ret != -ENOSYS {
	dev_err(arizona->dev, ....);
}

> > -	if (arizona->pdata.reset) {
> > +	if (!arizona->pdata.reset) {
> >  		/* Start out with /RESET low to put the chip into reset */
> > -		ret = devm_gpio_request_one(arizona->dev, arizona->pdata.reset,
> > -					    GPIOF_DIR_OUT | GPIOF_INIT_LOW,
> > -					    "arizona /RESET");
> > -		if (ret != 0) {
> > -			dev_err(dev, "Failed to request /RESET: %d\n", ret);
> > -			goto err_dcvdd;
> > +		arizona->pdata.reset = devm_gpiod_get(arizona->dev, "reset",
> > +						      GPIOD_OUT_LOW);
> > +		if (IS_ERR(arizona->pdata.reset)) {
> > +			ret = PTR_ERR(arizona->pdata.reset);
> > +			if (ret == -EPROBE_DEFER)
> > +				goto err_dcvdd;
> > +			else
> > +				dev_err(arizona->dev,
> > +					"Reset GPIO missing/malformed: %d\n",
> > +					ret);
> 
> You don't need the else.

Happy to drop.

> > --- a/include/linux/mfd/arizona/pdata.h
> > +++ b/include/linux/mfd/arizona/pdata.h
> > @@ -56,6 +56,7 @@
> >  #define ARIZONA_MAX_PDM_SPK 2
> >  
> >  struct regulator_init_data;
> > +struct gpio_desc;
> >  
> >  struct arizona_micbias {
> >  	int mV;                    /** Regulated voltage */
> > @@ -77,7 +78,7 @@ struct arizona_micd_range {
> >  };
> >  
> >  struct arizona_pdata {
> > -	int reset;      /** GPIO controlling /RESET, if any */
> > +	struct gpio_desc *reset;      /** GPIO controlling /RESET, if any */
> >  
> >  	/** Regulator configuration for MICVDD */
> >  	struct arizona_micsupp_pdata micvdd;
> 
> I know it doesn't have much to do with this patch, but it's probably
> better to use a Kerneldoc header for this struct.
> 

Indeed I would agree that would be better, not sure what the
commenting style there is about. I should be able to find time to
make a patch for this soon, but seems unrelated to this series.

Thanks,
Charles
