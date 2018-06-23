Return-Path: <vkoul@kernel.org>
Date: Sat, 23 Jun 2018 10:04:06 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 4/5] input: pm8941-pwrkey: Abstract register offsets and
 event code
Message-ID: <20180623043406.GU27187@vkoul-mobl>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-5-vkoul@kernel.org>
 <20180622211005.GI3402@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180622211005.GI3402@tuxbook-pro>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 22-06-18, 14:10, Bjorn Andersson wrote:
> On Mon 18 Jun 07:35 PDT 2018, Vinod Koul wrote:
> > diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> [..]
> >  struct pm8941_pwrkey {
> >  	struct device *dev;
> > @@ -52,6 +57,9 @@ struct pm8941_pwrkey {
> >  
> >  	unsigned int revision;
> >  	struct notifier_block reboot_notifier;
> > +
> > +	unsigned int code;
> 
> pwrkey->code is passed into of_property_read_u32(), so make it u32 here
> instead.

yes will do

> >  	pwrkey->irq = platform_get_irq(pdev, 0);
> > @@ -190,8 +209,13 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
> >  
> >  	error = of_property_read_u32(pdev->dev.of_node, "reg",
> >  				     &pwrkey->baseaddr);
> > -	if (error)
> > -		return error;
> > +	if (error) {
> 
> I agree with Dmitry's comment here.
> 
> The order of these operations are not significant, so you can easily
> move this into above "fallback" and read "reg" from the dev itself in
> and else block.

Agreed we can do in a single block and check only once

> 
> > +		/* check if parent has reg before bailing */
> > +		error = of_property_read_u32(pdev->dev.parent->of_node,
> > +					     "reg", &pwrkey->baseaddr);
> > +		if (error)
> > +			return error;
> > +	}
> 
> Apart from this the patch looks good.

Thanks

-- 
~Vinod
