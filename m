From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] of: fix of_update_property [v2]
Date: Fri, 4 Apr 2014 08:30:42 +0000
Message-ID: <179ad743feea49bb946a3b31a629e229@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1396331486-29354-1-git-send-email-Li.Xiubo@freescale.com> <
 20140401091920.E8E45C408A6@trevor.secretlab.ca> <
 9622800c30f5412a9bbb9dfd95def751@BY2PR03MB505.namprd03.prod.outlook.com>
 <20140403175112.DF1FFC4200D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140403175112.DF1FFC4200D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: RE: [PATCH] of: fix of_update_property [v2]
> 
> On Wed, 2 Apr 2014 05:29:53 +0000, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org"
> <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >
> >
> > > > @@ -1776,25 +1776,26 @@ int of_update_property(struct device_node *np,
> > > struct property *newprop)
> > > >  	if (!newprop->name)
> > > >  		return -EINVAL;
> > > >
> > > > -	oldprop = of_find_property(np, newprop->name, NULL);
> > > > -	if (!oldprop)
> > > > -		return of_add_property(np, newprop);
> > > > -
> > > >  	raw_spin_lock_irqsave(&devtree_lock, flags);
> > > > -	next = &np->properties;
> > > > -	while (*next) {
> > > > +	oldprop = __of_find_property(np, newprop->name, NULL);
> > > > +	if (!oldprop) {
> > > > +		/* add the node */
> > > > +		rc = __of_add_property(np, newprop);
> > > > +	} else {
> > >
> > > if you changed this line to:
> > > 	} else while (*next) {
> > > then most of the other changes go away. You don't need the separate
> > > while loop
> >

Well, this will output some errors by using the './scripts/checkpatch.pl'
Checking.

$ ./scripts/checkpatch.pl

ERROR: trailing statements should be on next line
#1785: FILE: of/base.c:1785:
+       else while (*next) {

ERROR: trailing statements should be on next line
#1785: FILE: of/base.c:1785:
+       else while (*next) {

Should be split into two lines...

Thanks,

BRs
Xiubo


> > Yes, I will fix this.
> >
> >
> > > and the function remains largely identical aside from moving
> > > the __of_find_property() into the spinlock.
> > >
> >
> > But, from the following codes, we can see that, if oldprop !=  NULL
> > Meaning that we have found it, and should just do the updatation later:
> > +++++++++++++++
> > 	oldprop = of_find_property(np, newprop->name, NULL);
> > 	if (!oldprop)
> > 		return of_add_property(np, newprop);
> > ---------------
> >
> >
> >
> > > >  			/* found the node */
> > > >  			newprop->next = oldprop->next;
> > > >  			*next = newprop;
> > > >  			oldprop->next = np->deadprops;
> > > >  			np->deadprops = oldprop;
> > > > -			found = 1;
> >
> > And why the 'found' flag is here is that the oldprop maybe removed
> > just before the spin_lock and after of_find_property().
> >
> > And so use and move __of_find_property() and __of_add_property() into
> > the spinlock could avoid this...
> 
> Isn't that what I said?
> 
> g.
> 
> >
> >
> > Thanks,
> > --
> >
> > BRs,
> > Xiubo
> >
> >
> > > > -			break;
> > > >  		}
> > > > -		next = &(*next)->next;
> > > >  	}
> > > >  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> > > > +
> > > >  	if (rc)
> > > >  		return rc;
> > > >
> > > > @@ -1803,9 +1804,6 @@ int of_update_property(struct device_node *np,
> struct
> > > property *newprop)
> > > >  		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> > > >  	__of_add_property_sysfs(np, newprop);
> > > >
> > > > -	if (!found)
> > > > -		return -ENODEV;
> > > > -
> > > >  	return 0;
> > > >  }
> > > >
> > > > --
> > > > 1.8.4
> > > >
> > > >
> > >
> > >
> >
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
