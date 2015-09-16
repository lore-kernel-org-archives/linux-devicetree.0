From: Peng Fan <van.freenix@gmail.com>
Subject: Re: [PATCH] drivers: of: check input parameter name for
 __of_find_property
Date: Wed, 16 Sep 2015 21:55:47 +0800
Message-ID: <20150916135545.GA28742@linux-4gyl.site>
References: <1441979043-19694-1-git-send-email-van.freenix@gmail.com>
 <55F83FAC.5080002@kernel.org>
 <20150916001650.GA28082@linux-4gyl.site>
 <55F8D3AF.9070503@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55F8D3AF.9070503@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 09:27:59PM -0500, Rob Herring wrote:
> On 09/15/2015 07:16 PM, Peng Fan wrote:
> > Hi Rob,
> > 
> > On Tue, Sep 15, 2015 at 10:56:28AM -0500, Rob Herring wrote:
> >> On 09/11/2015 08:44 AM, Peng Fan wrote:
> >>> Check input parameter 'name' for __of_find_property. If name is NULL,
> >>> of_prop_cmp->strcasecmp may trigger panic.
> >>
> >> Arguably that could be a feature. Do you have a usecase where name being
> >> NULL is valid and panicking is a problem?
> > 
> > In drivers/pinctrl/devicetree.c
> > 
> > 195                 propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> > 196                 prop = of_find_property(np, propname, &size);
> > 197                 kfree(propname);
> > 198                 if (!prop)
> > 199                         break;
> > 
> > If propname is NULL, of_find_property may trigger panic. Anyway propname should be checked
> > before passing to of_find_property.
> 
> propname will only be NULL if the memory allocation failed which gives
> you a big warning message. I don't think you would want to continue on
> in this case.
> 
> So I'm inclined to leave this as is with passing NULL to
> of_find_property to always be an error and fatal.

of_find_property has EXPORT_SYMBOL, it maybe called in different places. And it should handle the case that name is NULL, right?
If passing NULL to of_find_property is an error, then why check parameter 'np' like "if (!np)" in of_find_property?

Regards,
Peng.

> 
> Rob
> 
> > I did not met panic message. I wrote this patch when I was reading the piece code.
> > I think the name parameter should be checked before doing string compare.
> > 
> > Regards,
> > Peng.
> > 
> >>
> >> Rob
> >>
> >>>
> >>> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> >>> Cc: Rob Herring <robh+dt@kernel.org>
> >>> Cc: Frank Rowand <frowand.list@gmail.com>
> >>> Cc: Grant Likely <grant.likely@linaro.org>
> >>> ---
> >>>  drivers/of/base.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/of/base.c b/drivers/of/base.c
> >>> index 8b5a187..e41436d 100644
> >>> --- a/drivers/of/base.c
> >>> +++ b/drivers/of/base.c
> >>> @@ -215,7 +215,7 @@ static struct property *__of_find_property(const struct device_node *np,
> >>>  {
> >>>  	struct property *pp;
> >>>  
> >>> -	if (!np)
> >>> +	if (!np || !name)
> >>>  		return NULL;
> >>>  
> >>>  	for (pp = np->properties; pp; pp = pp->next) {
> >>>
> >>
> 
