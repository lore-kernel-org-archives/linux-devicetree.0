From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] of: introduces helper to manage optional property
Date: Wed, 8 Jan 2014 07:17:40 +0000
Message-ID: <7c7409b69df54fcba6c0cbd9dacd1536@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1388035115-893-1-git-send-email-Li.Xiubo@freescale.com>
 <20131226143851.GL8064@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131226143851.GL8064-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> > @@ -601,6 +601,23 @@ static inline int of_property_read_u32(const struct
> device_node *np,
> >  	return of_property_read_u32_array(np, propname, out_value, 1);
> >  }
> >
> > +/**
> > + * of_property_optional - Find one optional property
> > + * @np:		device node from which the property to be searched.
> > + * @propname:	name of the optional property to be searched for.
> > + *
> > + * Get to know whether one optional property is present or not in a
> > + * device node.
> > + * Returns true if the property is present, false otherwise.
> > + */
> > +static inline bool of_property_optional(const struct device_node *np,
> > +					 const char *propname)
> > +{
> > +	struct property *prop = of_find_property(np, propname, NULL);
> > +
> > +	return prop ? true : false;
> > +}
> > +
> 
> Exactly how is this different from of_property_read_bool()?
> AFAICS it's identical!  You may be trying to solve the wrong
> problem.
> 
> And I'm afraid that the routine's name you picked is even more
> confusing.  The call site ("if (of_property_optional() ...") will
> no longer reflect that it's evaluating a boolean condition.
> Being an optional property and being boolean are two completely
> different things.
> 
> 

Yes, That's right.

Thanks,
Best Regards,



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
