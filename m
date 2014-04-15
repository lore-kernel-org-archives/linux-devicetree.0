From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/6] mfd: arizona: Factor out read of device tree GPIOs
Date: Tue, 15 Apr 2014 14:01:40 +0100
Message-ID: <20140415130140.GA27294@opensource.wolfsonmicro.com>
References: <1396340845-24060-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1396340845-24060-2-git-send-email-ckeepax@opensource.wolfsonmicro.com> <20140415102527.GD27091@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140415102527.GD27091@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 15, 2014 at 11:25:27AM +0100, Lee Jones wrote:
> On Tue, 01 Apr 2014, Charles Keepax wrote:
> 
> > This patch factors out the reading of GPIOs for the Arizona devices
> > into a helper function.
> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  drivers/mfd/arizona-core.c       |   33 ++++++++++++++++++++++++---------
> >  include/linux/mfd/arizona/core.h |    3 +++
> >  2 files changed, 27 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> > index a45aab9..8ad4373 100644
> > --- a/drivers/mfd/arizona-core.c
> > +++ b/drivers/mfd/arizona-core.c
> > @@ -512,19 +512,34 @@ int arizona_of_get_type(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(arizona_of_get_type);
> >  
> > +int arizona_of_get_named_gpio(struct arizona *arizona, const char *prop,
> > +			      bool mandatory, int *gpio)
> > +{
> > +	int ret;
> > +
> > +	ret = of_get_named_gpio(arizona->dev->of_node, prop, 0);
> > +	*gpio = ret;
> > +	if (ret >= 0)
> > +		return ret;
> > +
> > +	*gpio = 0;
> > +
> > +	if (mandatory)
> > +		dev_err(arizona->dev,
> > +			"Mandatory DT gpio %s missing/malformed: %d\n",
> > +			prop, ret);
> > +
> > +	return ret;
> > +}
> 
> Hmm.. me no likey!
> 
> How about:
> 
> +void arizona_of_get_named_gpio(struct arizona *arizona, const char *prop,
> +				bool mandatory, int *gpio)
> +{
> +	*gpio = of_get_named_gpio(arizona->dev->of_node, prop, 0);
> +	if (*gpio < 0) {
> +	 	if (mandatory)
> +			dev_err(arizona->dev,
> +				"Mandatory DT gpio %s missing/malformed: %d\n",
> +				prop, *gpio);
> +		*gpio = 0;
> +	}
> +}

Indeed that is nicer I will respin and change it.

> 
> > +EXPORT_SYMBOL_GPL(arizona_of_get_named_gpio);
> > +
> 
> Are you sure you're going to use this externally?
> 
> NB: I haven't looked at the remainder of the set yet.

Yeah we move the ldoena gpio into the LDO driver, and later we
will be adding a polarity GPIO into the extcon driver.

> 
> >  static int arizona_of_get_core_pdata(struct arizona *arizona)
> >  {
> > +	struct arizona_pdata *pdata = &arizona->pdata;
> >  	int ret, i;
> >  
> > -	arizona->pdata.reset = of_get_named_gpio(arizona->dev->of_node,
> > -						 "wlf,reset", 0);
> > -	if (arizona->pdata.reset < 0)
> > -		arizona->pdata.reset = 0;
> > -
> > -	arizona->pdata.ldoena = of_get_named_gpio(arizona->dev->of_node,
> > -						  "wlf,ldoena", 0);
> > -	if (arizona->pdata.ldoena < 0)
> > -		arizona->pdata.ldoena = 0;
> > +	arizona_of_get_named_gpio(arizona, "wlf,reset", true, &pdata->reset);
> > +	arizona_of_get_named_gpio(arizona, "wlf,ldoena", true, &pdata->ldoena);
> 
> I guess this pdata is populated by DT?

Yeah that is correct, the Arizona driver populates the pdata from
the DT then the rest of the driver just uses the pdata in both DT
and pdata cases.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
