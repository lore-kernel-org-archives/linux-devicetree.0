From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt: add helper functions to read u32 and string property
	values
Date: Sun, 3 Jul 2011 15:03:12 -0600
Message-ID: <20110703210312.GA13742@ponder.secretlab.ca>
References: <1309449370-9554-1-git-send-email-thomas.abraham@linaro.org>
	<20110630181353.GA6674@ponder.secretlab.ca>
	<20110703035527.GB9742@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110703035527.GB9742-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 03, 2011 at 11:55:28AM +0800, Shawn Guo wrote:
> On Thu, Jun 30, 2011 at 12:13:53PM -0600, Grant Likely wrote:
> > On Thu, Jun 30, 2011 at 09:26:10PM +0530, Thomas Abraham wrote:
> > > Add helper functions to retrive unsigned integer and string property values from
> > > properties of a device node. These helper functions can be used to lookup a
> > > property in a device node, perform error checking and read the property value.
> > > 
> > > [grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Proposal and initial implementation]
> > > Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > Merged, thanks.  Bonus points to anyone who submits patches converting
> > existing code to this new api.
> > 
> > g.
> > 
> > > ---
> > >  drivers/of/base.c  |   59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/of.h |    4 +++
> > >  2 files changed, 63 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > > index 632ebae..4823b53 100644
> > > --- a/drivers/of/base.c
> > > +++ b/drivers/of/base.c
> > > @@ -596,6 +596,65 @@ struct device_node *of_find_node_by_phandle(phandle handle)
> > >  EXPORT_SYMBOL(of_find_node_by_phandle);
> > >  
> > >  /**
> > > + * of_property_read_u32 - Find a property in a device node and read the
> > > + *				32-bit property value
> > > + * @np:		device node from which the property value is to be read.
> > > + * @propname:	name of the property to be searched.
> > > + * @out_value:	returned value, valid if return value is 0.
> > > + *
> > > + * Search for a property in a device node and read a 32-bit value from a
> > > + * property. Returns -EINVAL, if the property does not exist, -ENODATA, if
> > > + * property does not have a value, -EOVERFLOW, if the property data isn't
> > > + * large enough, and 0 on success.
> > > + *
> > > + * The out_value is modified only if a valid u32 value can be decoded.
> > > + */
> > > +int of_property_read_u32(struct device_node *np, char *propname, u32 *out_value)
> > > +{
> > > +	struct property *prop = of_find_property(np, propname, NULL);
> > > +
> > > +	if (!prop)
> > > +		return -EINVAL;
> > > +	if (!prop->value)
> > > +		return -ENODATA;
> > > +	if (sizeof(*out_value) > prop->length)
> > > +		return -EOVERFLOW;
> > > +	*out_value = be32_to_cpup(prop->value);
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(of_property_read_u32);
> > > +
> > > +/**
> > > + * of_property_read_string - Find a property in a device node and return a
> > > + *				pointer to the property string value.
> > > + * @np:		device node from which the property value is to be read.
> > > + * @propname:	name of the property to be searched.
> > > + * @out_string:	pointer to a null terminated string, valid only if the return
> > > + *		value is 0.
> > > + *
> > > + * Returns a pointer to a null terminated property value string. Returns
> > > + * -EINVAL, if the property does not exist, -ENODATA, if property does not have
> > > + * a value, -EILSEQ, if the string is not null-terminated within the length of
> > > + * the property value, and 0 on success.
> > > + *
> > > + * The out_string value is modified only if a valid string can be decoded.
> > > + */
> > > +int of_property_read_string(struct device_node *np, char *propname,
> > > +				char **out_string)
> 
> When converting my dt code to use this api, the following type
> mismatch warning is being seen in a lot of places.
> 
> 'char **' but argument is of type 'const char **'
> 
> This is because the existing codes usually get string from
> of_get_property and assign it to a 'const char *'.
> 
> I'm wondering if we should drop the const during converting or
> change the api with const added to out_string to get converting
> a little bit easier.

Add the const to out_string.  It's the right thing to do.  Can you
craft and post a patch doing so?

g.
