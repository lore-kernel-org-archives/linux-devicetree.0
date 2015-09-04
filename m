From: Gilad Avidov <gavidov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] spmi-pmic-arb: support configurable number of
 peripherals
Date: Fri, 4 Sep 2015 12:04:59 -0600
Message-ID: <20150904120459.034920a6@gavidov-lnx.qualcomm.com>
References: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
	<20150904001630.GJ15099@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904001630.GJ15099-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 3 Sep 2015 17:16:30 -0700
Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> On 09/03, Gilad Avidov wrote:
> > +			 supported by HW. Default (minimum
> > supported) is 128. +
> > +Example V1 PMIC-Arbiter:
> >  
> >  	spmi {
> >  		compatible = "qcom,spmi-pmic-arb";
> > @@ -62,4 +66,32 @@ Example:
> >  
> >  		interrupt-controller;
> >  		#interrupt-cells = <4>;
> > +
> > +		qcom,max-peripherals = <256>;
> 
> If it's v1 isn't it always 128? So having 256 here is just
> confusing.

Hi Stephen,

Actually some v1 chipsets, such as Dragonboard APQ8074, support 256
peripherals.

> 
> > +	};
> > +
> > @@ -129,14 +131,15 @@ struct spmi_pmic_arb_dev {
> >  	u8			channel;
> >  	int			irq;
> >  	u8			ee;
> > -	u8			min_apid;
> > -	u8			max_apid;
> > -	u32
> > mapping_table[SPMI_MAPPING_TABLE_LEN];
> > +	u16			min_irq_apid;
> > +	u16			max_irq_apid;
> > +	u16			max_apid;
> > +	u32			*mapping_table;
> >  	struct irq_domain	*domain;
> >  	struct spmi_controller	*spmic;
> > -	u16			apid_to_ppid[256];
> > +	u16			*irq_apid_to_ppid;
> 
> Please drop all this renaming noise, or at the least, put it in a
> different patch. More than half the patch is just changing the
> names of these variables for what seems like no reason.
> 

I agree that changing apid_to_ppid to irq_apid_to_ppid is not required
and I'll undo this change on next patch.

Regarding the change of max/min_apid to max/min_irq_apid:
max_apid was already used but the name does not make good sense. Since
really it is not the max_apid supported. Instead it is the largest apid
which interrupt is currently requested for. But now we need a value that
is actually the maximum supported apid. This is why repurposed max_apid
and corrected the previous naming.

> >  	const struct pmic_arb_ver_ops *ver_ops;
> > -	u8			*ppid_to_chan;
> > +	u16			*ppid_to_chan;
> >  };
> >  
> >  	struct spmi_pmic_arb_dev *pa = irq_get_handler_data(irq);
> >  	struct irq_chip *chip = irq_get_chip(irq);
> >  	void __iomem *intr = pa->intr;
> > -	int first = pa->min_apid >> 5;
> > -	int last = pa->max_apid >> 5;
> > +	int first = pa->min_irq_apid >> 5;
> > +	int last = pa->max_irq_apid >> 5;
> >  	u32 status;
> >  	int i, id;
> >  
> > @@ -903,14 +915,30 @@ static int spmi_pmic_arb_probe(struct
> > platform_device *pdev) 
> >  	pa->ee = ee;
> >  
> > -	for (i = 0; i < ARRAY_SIZE(pa->mapping_table); ++i)
> > -		pa->mapping_table[i] = readl_relaxed(
> > -				pa->cnfg +
> > SPMI_MAPPING_TABLE_REG(i));
> > +	pa->irq_apid_to_ppid = devm_kzalloc(&ctrl->dev,
> > pa->max_apid *
> > +
> > sizeof(*pa->irq_apid_to_ppid),
> > +					    GFP_KERNEL);
> > +	if (!pa->irq_apid_to_ppid) {
> > +		err = -ENOMEM;
> > +		goto err_put_ctrl;
> > +	}
> > +
> > +	pa->mapping_table = devm_kzalloc(&ctrl->dev,
> > +					(pa->max_apid - 1) *
> > sizeof(u32),
> > +					GFP_KERNEL);
> > +	if (!pa->mapping_table) {
> > +		err = -ENOMEM;
> > +		goto err_put_ctrl;
> > +	}
> > +
> > +	for (i = 0; i < (pa->max_apid - 1); ++i)
> > +		pa->mapping_table[i] = readl_relaxed(pa->cnfg +
> > +
> > SPMI_MAPPING_TABLE_REG(i));
> 
> Maybe we should stop doing this during probe and always allocate
> an empty cache of size 128 on v1 and 512 on v2 chips? So when

As mentioned above, both v1 and v2 can have different number of
peripherals. 

> we're searching through the mapping table we can cache the value
> from the register if the entry isn't 0. This delays the

Greedy approach (reading upto 512 registers from hw) have very small
upfront penalty since sequential reads take place very fast
and HW acceleration (prefetching) will improve it. A lazy approach will
required much more complex algorithm (for example any value
including zero is valid. So we will need to augment a marker for
unassigned entries) and prefetching will not help.

> processing to when we're mapping irqs, hopefully speeding up
> probe for the case where you have a handful of irqs to map.

Please note that we traverse this mapping table every time a PMIC
driver registers for an interrupt. This means that even if we speed up
the probe of pmic-arb driver we will not speed the system boot since
the probing of the PMIC drivers will register for interrupts.

> 
> The DT property wouldn't be necessary then. Arguably it's being
> added there to optimize the size of the mapping table and isn't
> really necessary otherwise.
> 

We need to know this value for both memory allocation
and for stopping before reading over the bounds of the mapping_table in
HW.

Thank you,
Gilad
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
