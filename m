From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v6 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Thu, 6 Nov 2014 13:45:34 +0900
Message-ID: <20141106044534.GB5068@jack-ThinkPad-T520>
References: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141031164418.GC18557@sirena.org.uk>
 <1415051139.20372.85.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415051139.20372.85.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 03, 2014 at 10:45:39PM +0100, Paul Bolle wrote:
> On Fri, 2014-10-31 at 16:44 +0000, Mark Brown wrote:
> > On Fri, Oct 31, 2014 at 04:08:41PM +0900, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > From: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> > > 
> > > Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> > 
> > This doesn't apply against current code and depends on the MFD symbol
> > rename - can you please check what's going on here?
> > 
> > It would make sense to split the Kconfig symbol rename into a separate
> > patch to ease merging,
> 
> The relicensing (from GPL to GPL v2, thus dropping the "or later"
> provision) is odd too. The header still uses GPL v2 or later, doesn't
> it? Anyhow, that could be a separate patch too.

I will modify the licensing text and resubmit it.
Thank you for your comment.

> 
> > it doesn't seem obviously related to the driver
> > change and should probably be in the same patch as the MFD symbol rename
> > for bisetion.
> 
> I don't think there will be bisection problems (in mainline). Currently
> this driver depends on SKY81452. But that symbol doesn't exist. Only
> after both 1/8 and this patch will this driver become buildable, for the
> first time. So it's not that this driver was buildable, became
> unbuildable in 1/8 and buildable again in this patch.
> 
> (I don't think it's much of a problem that the regulator driver got
> merged, in v3.18-rc1, before the mfd driver on which it depends.
> Avoiding that temporarily problem appears to be more trouble than it's
> worth.)
> 
> 
> Paul Bolle
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
