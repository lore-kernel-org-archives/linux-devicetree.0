From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] of: fix of_update_property()
Date: Mon, 20 Jan 2014 05:50:17 +0000
Message-ID: <b61be84c13ed4056a62743e16beb70f2@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1389933996-19306-1-git-send-email-Li.Xiubo@freescale.com>
 <CAL_JsqJuAv8=pBuzYO5ZGzroD1kq6gjmNsTjoVyXR=vcu+-pTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJuAv8=pBuzYO5ZGzroD1kq6gjmNsTjoVyXR=vcu+-pTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH] of: fix of_update_property()
> 
> On Thu, Jan 16, 2014 at 10:46 PM, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > The of_update_property() is intent to update a property in a node
> 
> s/intent/indended/
> 
> > and if the property does not exist, will add it to the node.
> >
> > The second search of the property is possibly won't be found, that
> > maybe removed by other thread just before the second search begain,
> > if so just retry it.
> 
> How did you find this problem? Actual use or some artificial stress test?
>

Some artificial stress test at home.

 
> > Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/of/base.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index f807d0e..d0c53bc 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1572,6 +1572,7 @@ int of_update_property(struct device_node *np, struct
> property *newprop)
> >         if (!newprop->name)
> >                 return -EINVAL;
> >
> > +retry:
> >         oldprop = of_find_property(np, newprop->name, NULL);
> >         if (!oldprop)
> >                 return of_add_property(np, newprop);
> 
> Isn't there also a race that if you do 2 updates for a non-existent
> property and both threads try to add the property, the first one will
> succeed and the 2nd will fail. The 2nd one needs to retry as well.
> 

Well, yes, that will happen.

Maybe we could add one __of_add_property() without any locks, like
__of_find_property(). And then in of_update_prperty() move the searching
and adding operations to between lock and unlock, like:

	raw_spin_lock_irqsave();
	oldprop = __of_find_property();
      	if (!oldprop) {
              rc = __of_add_property(np, newprop);
		 ...
	}
	...
	replace the node...
	...
	raw_spin_unlock_irqrestore();

> Also, couldn't the node itself be removed while trying to do the update?
> 

For this is between the lock operations. I think this doesn't matter here.

> There seem to be multiple problems with this code, but doing multiple
> simultaneous, conflicting updates seems like an unlikely case.
> 

Yes, but this will happen in theory. 

Thanks,

Best Regards,
Xiubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
