From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] mfd: arizona: Add DT options for
 max_channels_clocked and PDM speaker config
Date: Fri, 2 Sep 2016 16:56:24 +0100
Message-ID: <1472831784.4359.6.camel@rf-debian.wolfsonmicro.main>
References: <1472635543-21577-1-git-send-email-rf@opensource.wolfsonmicro.com>
         <20160902153458.GA28352@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160902153458.GA28352@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-09-02 at 10:34 -0500, Rob Herring wrote:
> On Wed, Aug 31, 2016 at 10:25:43AM +0100, Richard Fitzgerald wrote:
> > This patch adds DT settings for the max_channels_clocked, spk_fmt and
> > spk_mute pdata.
> > 
> > Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt | 11 ++++++++
> 
> Binding looks fine, but...
> 
> >  drivers/mfd/arizona-core.c                        | 31 +++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> 
> > diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> > index b95ff2d..36a9633 100644
> > --- a/drivers/mfd/arizona-core.c
> > +++ b/drivers/mfd/arizona-core.c
> > @@ -816,6 +816,37 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
> >  		count++;
> >  	}
> >  
> > +	count = 0;
> > +	of_property_for_each_u32(arizona->dev->of_node,
> > +				 "wlf,max-channels-clocked",
> > +				 prop, cur, val) {
> > +		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
> > +			break;
> > +
> > +		pdata->max_channels_clocked[count] = val;
> > +		count++;
> > +	}
> 
> of_property_read_u32_array doesn't work for you?

No, it doesn't, because it doesn't read a variable-sized array.

> 
> > +
> > +	count = 0;
> > +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-fmt", prop,
> > +				 cur, val) {
> > +		if (count == ARRAY_SIZE(pdata->spk_fmt))
> > +			break;
> > +
> > +		pdata->spk_fmt[count] = val;
> > +		count++;
> > +	}
> > +
> > +	count = 0;
> > +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-mute", prop,
> > +				 cur, val) {
> > +		if (count == ARRAY_SIZE(pdata->spk_mute))
> > +			break;
> > +
> > +		pdata->spk_mute[count] = val;
> > +		count++;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 1.9.1
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
