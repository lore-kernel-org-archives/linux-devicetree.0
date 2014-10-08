From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v3 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Wed, 8 Oct 2014 17:51:29 +0900
Message-ID: <20141008085129.GA3362@jack-ThinkPad-T520>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1412658667-8196-1-git-send-email-jack.yoo@skyworksinc.com>
 <20141007125221.GG4609@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141007125221.GG4609-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 01:52:21PM +0100, Mark Brown wrote:
> On Tue, Oct 07, 2014 at 02:11:07PM +0900, Gyungoh Yoo wrote:
> > Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> 
> Several problems here:
> 
>  - I don't have patches 1-6 or the cover letter for this series - what
>    are the dependencies?
>  - I can't see any sign that my concerns about the driver not actually
>    being reusable have been addressed here.
>  - This patch appears to do way more than add a compatible string, for
>    example:

I am sorry the recipients of each patch and cover letter was different.
I will resubmit soon.

> 
> > -	np = of_get_child_by_name(dev->parent->of_node, "regulator");
> > -	if (unlikely(!np)) {
> > +	if (!np) {
> >  		dev_err(dev, "regulator node not found");
> > -		return NULL;
> > +		return ERR_PTR(-ENODATA);


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
