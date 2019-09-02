From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 04/11] device property: Add functions for accessing
 node's parents
Date: Mon, 2 Sep 2019 15:46:16 +0300
Message-ID: <20190902124616.GH2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-5-sakari.ailus@linux.intel.com>
 <20190902101426.GB2680@smile.fi.intel.com>
 <20190902123431.GK5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902123431.GK5475@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 03:34:31PM +0300, Sakari Ailus wrote:
> Hi Andy,
> 
> On Mon, Sep 02, 2019 at 01:14:26PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 02, 2019 at 11:32:33AM +0300, Sakari Ailus wrote:
> > > Add two convenience functions for accessing node's parents:
> > > 
> > > fwnode_count_parents() returns the number of parent nodes a given node
> > > has. fwnode_get_nth_parent() returns node's parent at a given distance
> > > from the node itself.
> > > 
> > 
> > Much better now, thanks!
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > though one question below.

> > > +/**
> > > + * fwnode_get_nth_parent - Return an nth parent of a node
> > > + * @fwnode: The node the parent of which is requested
> > > + * @depth: Distance of the parent from the node
> > > + *
> > > + * Returns the nth parent of a node. If @depth is 0, the functionality is
> > > + * equivalent to fwnode_handle_get(). For @depth == 1, it is fwnode_get_parent()
> > > + * and so on.
> > > + *
> > > + * The caller is responsible for calling fwnode_handle_put() for the returned
> > > + * node.
> > > + */
> > > +struct fwnode_handle *fwnode_get_nth_parent(struct fwnode_handle *fwnode,
> > > +					    unsigned int depth)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	fwnode_handle_get(fwnode);
> > > +
> > > +	for (i = 0; i < depth && fwnode; i++)
> > > +		fwnode = fwnode_get_next_parent(fwnode);
> > > +
> > 
> > If 'fnode == NULL' and 'i < depth', shan't we return some kind of error?
> 
> How about adding to the comment, after the first sentence of the
> description:
> 
> 	If there is no parent at the requested depth, NULL is returned.

Works for me!

-- 
With Best Regards,
Andy Shevchenko
