From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] of: fix of_update_property [v2]
Date: Fri, 4 Apr 2014 08:00:37 +0000
Message-ID: <26834c80684e4907942db73ff5bfc39a@BY2PR03MB505.namprd03.prod.outlook.com>
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

Yes, maybe my not thoroughly understanding of your last mail before.

Thanks,

BRs
Xiubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
