From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add EXPORT_SYMBOL for of_device_compatible_match
Date: Fri, 17 Feb 2017 09:20:09 +0100
Message-ID: <20170217082009.GB22723@Red>
References: <20170215142245.11207-1-clabbe.montjoie@gmail.com>
 <58A47521.9090909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58A47521.9090909-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 07:34:57AM -0800, Frank Rowand wrote:
> On 02/15/17 06:22, Corentin Labbe wrote:
> > This symbol will be needed for the dwmac-sun8i ethernet driver.
> > For letting it to be build as module, of_device_compatible_match need to
> > be exported.
> > 
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/of/base.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index df6f6e3..fba351b 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -524,6 +524,7 @@ int of_device_compatible_match(struct device_node *device,
> >  
> >  	return score;
> >  }
> > +EXPORT_SYMBOL(of_device_compatible_match);
> >  
> >  /**
> >   * of_machine_is_compatible - Test root of device tree for a given compatible value
> > 
> 
> 
> 
> Rob's reply to the last person who requested that:
> 
>    It's not missing because no modules use it. It's generally preferred
>    to use a match table and of_match_node.
> 
> -Frank

I replace of_device_compatible_match like you said and it works.
Thanks
Corentin Labbe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
