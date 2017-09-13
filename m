From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v12 18/26] v4l: fwnode: Add a helper function for parsing
 generic references
Date: Wed, 13 Sep 2017 12:24:31 +0300
Message-ID: <20170913092430.cbdgerkhiuxakbxv@valkosipuli.retiisi.org.uk>
References: <20170912134200.19556-1-sakari.ailus@linux.intel.com>
 <20170912134200.19556-19-sakari.ailus@linux.intel.com>
 <020b9c86-dd73-3516-4a0e-827db9680b55@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <020b9c86-dd73-3516-4a0e-827db9680b55-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

Thanks for the review!

On Wed, Sep 13, 2017 at 09:27:34AM +0200, Hans Verkuil wrote:
> On 09/12/2017 03:41 PM, Sakari Ailus wrote:
> > Add function v4l2_fwnode_reference_count() for counting external
> 
> ???? There is no function v4l2_fwnode_reference_count()?!

It got removed during the revisions but the commit message was not changed
accordingly, I do that now.

> 
> > references and v4l2_fwnode_reference_parse() for parsing them as async
> > sub-devices.
> > 
> > This can be done on e.g. flash or lens async sub-devices that are not part
> > of but are associated with a sensor.
> > 
> > struct v4l2_async_notifier.max_subdevs field is added to contain the
> > maximum number of sub-devices in a notifier to reflect the memory
> > allocated for the subdevs array.
> 
> You forgot to remove this outdated paragraph.

Oops. Removed it now.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 69 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 44ee35f6aad5..a32473f95be1 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -498,6 +498,75 @@ int v4l2_async_notifier_parse_fwnode_endpoints_by_port(
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints_by_port);
> >  
> > +/*
> > + * v4l2_fwnode_reference_parse - parse references for async sub-devices
> > + * @dev: the device node the properties of which are parsed for references
> > + * @notifier: the async notifier where the async subdevs will be added
> > + * @prop: the name of the property
> > + *
> > + * Return: 0 on success
> > + *	   -ENOENT if no entries were found
> > + *	   -ENOMEM if memory allocation failed
> > + *	   -EINVAL if property parsing failed
> > + */
> > +static int v4l2_fwnode_reference_parse(
> > +	struct device *dev, struct v4l2_async_notifier *notifier,
> > +	const char *prop)
> > +{
> > +	struct fwnode_reference_args args;
> > +	unsigned int index;
> > +	int ret;
> > +
> > +	for (index = 0;
> > +	     !(ret = fwnode_property_get_reference_args(
> > +		       dev_fwnode(dev), prop, NULL, 0, index, &args));
> > +	     index++)
> > +		fwnode_handle_put(args.fwnode);
> > +
> > +	if (!index)
> > +		return -ENOENT;
> > +
> > +	/*
> > +	 * To-do: handle -ENODATA when "device property: Align return
> > +	 * codes of acpi_fwnode_get_reference_with_args" is merged.
> > +	 */
> > +	if (ret != -ENOENT && ret != -ENODATA)
> 
> So while that patch referenced in the To-do above is not merged yet,
> what does fwnode_property_get_reference_args return? ENOENT or ENODATA?
> Or ENOENT now and ENODATA later? Or vice versa?
> 
> I can't tell based on that information whether this code is correct or not.
> 
> The comment needs to explain this a bit better.

I'll add this:

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index a32473f95be1..74fcc3ba9ebd 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -529,6 +529,9 @@ static int v4l2_fwnode_reference_parse(
 	/*
 	 * To-do: handle -ENODATA when "device property: Align return
 	 * codes of acpi_fwnode_get_reference_with_args" is merged.
+	 * Right now, both -ENODATA and -ENOENT signal the end of
+	 * references where only a single error code should be used
+	 * for the purpose.
 	 */
 	if (ret != -ENOENT && ret != -ENODATA)
 		return ret;

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
