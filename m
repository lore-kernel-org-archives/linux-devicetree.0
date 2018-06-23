Return-Path: <vkoul@kernel.org>
Date: Sat, 23 Jun 2018 10:02:58 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 4/5] input: pm8941-pwrkey: Abstract register offsets and
 event code
Message-ID: <20180623043258.GT27187@vkoul-mobl>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-5-vkoul@kernel.org>
 <20180622185236.GD92912@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180622185236.GD92912@dtor-ws>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 22-06-18, 11:52, Dmitry Torokhov wrote:

> >  static int pm8941_reboot_notify(struct notifier_block *nb,
> > @@ -124,7 +132,8 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
> >  	if (error)
> >  		return IRQ_HANDLED;
> >  
> > -	input_report_key(pwrkey->input, KEY_POWER, !!(sts & PON_KPDPWR_N_SET));
> > +	input_report_key(pwrkey->input, pwrkey->code,
> > +			 !!(sts & pwrkey->data->status_bit));
> 
> Since we are changing this: input core will normalize the value for you,
> no need for doing double negation here.

Okay will do, since this "should" be explained that input core handles
it, do you recommend and separate patch for that?

> > @@ -190,8 +209,13 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
> >  
> >  	error = of_property_read_u32(pdev->dev.of_node, "reg",
> >  				     &pwrkey->baseaddr);
> > -	if (error)
> > -		return error;
> > +	if (error) {
> > +		/* check if parent has reg before bailing */
> > +		error = of_property_read_u32(pdev->dev.parent->of_node,
> > +					     "reg", &pwrkey->baseaddr);
> > +		if (error)
> > +			return error;
> 
> I do not want us blindly look up into parent for individual properties.
> We need to decide early on if we are dealing with subnode or older
> binding and stick to it.

okay will do.

> >  	error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
> >  			    &pwrkey->revision);
> > @@ -200,13 +224,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
> >  		return error;
> >  	}
> >  
> > +	error = of_property_read_u32(pdev->dev.of_node, "linux,code",
> > +				     &pwrkey->code);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "no linux,code assuming power%d\n", error);
> 
> This is not an error. dev_dbg or dev_info at most.

okay will change
-- 
~Vinod
