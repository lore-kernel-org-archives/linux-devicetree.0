From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/1] of: introduce helper to manage boolean
Date: Tue, 7 Feb 2012 17:14:12 +0100
Message-ID: <20120207161412.GG15647@game.jcrosoft.org>
References: <1328588028-24766-1-git-send-email-plagnioj@jcrosoft.com>
 <4F313F9B.4020500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F313F9B.4020500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09:13 Tue 07 Feb     , Rob Herring wrote:
> On 02/06/2012 10:13 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > of_property_read_bool
> > 
> > Search for a property in a device node and read a 32-bit value from
> > it. Returns 0 if <0> or if the property does not exist, 1 if <1> or none.
> > 
> > this will allow to disable a boolean
> > 
> > is-ok;          => true
> > is-ok = <1>;    => true
> > is-ok = <0>;    => false
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> 
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> > ---
> > Hi,
> > 
> > 	if this is ok I'll rebase my mtd and i2c patch to use it
> > 
> 
> I'm assuming you'll want to merge this patch with your mtd and i2c
> patches. If you want me to apply, let me know.
yes please

I rebase the of_mtd over it

if you can apply it too
Acked-by Grant

Best Regards,
J.
> 
> Rob
> 
> > Best Regards,
> > J.
> >  drivers/of/base.c  |   30 ++++++++++++++++++++++++++++++
> >  include/linux/of.h |    8 ++++++++
> >  2 files changed, 38 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 133908a..a0eaf08 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -686,6 +686,36 @@ int of_property_read_u64(const struct device_node *np, const char *propname,
> >  EXPORT_SYMBOL_GPL(of_property_read_u64);
> >  
> >  /**
> > + * of_property_read_bool - Find and read a boolean from a property
> > + * @np:		device node from which the property value is to be read.
> > + * @propname:	name of the property to be searched.
> > + *
> > + * Search for a property in a device node and read a 32-bit value from
> > + * it. Returns 0 if <0> or if the property does not exist, 1 if <1> or none.
> > + *
> > + * is-ok;	=> true
> > + * is-ok = <1>;	=> true
> > + * is-ok = <0>;	=> false
> > + */
> > +int of_property_read_bool(const struct device_node *np, const char *propname)
> > +{
> > +	u32 reg;
> > +	int ret = of_property_read_u32(np, propname, &reg);
> > +
> > +	switch (ret) {
> > +	case -EINVAL:
> > +		return false;
> > +	case -ENODATA:
> > +		return true;
> > +	case 0:
> > +		return reg == 1;
> > +	default:
> > +		return ret;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(of_property_read_bool);
> > +
> > +/**
> >   * of_property_read_string - Find and read a string from a property
> >   * @np:		device node from which the property value is to be read.
> >   * @propname:	name of the property to be searched.
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index a75a831..2e5f77b 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -210,6 +210,8 @@ extern int of_property_read_u32_array(const struct device_node *np,
> >  				      size_t sz);
> >  extern int of_property_read_u64(const struct device_node *np,
> >  				const char *propname, u64 *out_value);
> > +extern int of_property_read_bool(const struct device_node *np,
> > +				const char *propname);
> >  
> >  extern int of_property_read_string(struct device_node *np,
> >  				   const char *propname,
> > @@ -288,6 +290,12 @@ static inline int of_property_read_u32_array(const struct device_node *np,
> >  	return -ENOSYS;
> >  }
> >  
> > +static inline int of_property_read_bool(const struct device_node *np,
> > +				const char *propname)
> > +{
> > +	return -ENOSYS;
> > +}
> > +
> >  static inline int of_property_read_string(struct device_node *np,
> >  					  const char *propname,
> >  					  const char **out_string)
