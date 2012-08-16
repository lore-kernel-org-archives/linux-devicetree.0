From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [patch] driver-core: dev_to_node() should handle NULL pointers
Date: Thu, 16 Aug 2012 10:23:47 -0700
Message-ID: <20120816172347.GA27415@kroah.com>
References: <20120720065622.GA11710@elgon.mountain>
 <20120720150042.GA1996@kroah.com>
 <20120720151846.GQ16348@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120720151846.GQ16348@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2012 at 06:18:46PM +0300, Dan Carpenter wrote:
> On Fri, Jul 20, 2012 at 08:00:42AM -0700, Greg Kroah-Hartman wrote:
> > On Fri, Jul 20, 2012 at 09:56:23AM +0300, Dan Carpenter wrote:
> > > What prompted this patch is that in dma_pool_create() we call
> > > dev_to_node() before checking whether "dev" is NULL.  It looks like
> > > there are places which call dma_pool_create() with a NULL pointer.  An
> > > example is in drivers/usb/gadget/amd5536udc.c.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > Static checker fix.
> > > 
> > > diff --git a/include/linux/device.h b/include/linux/device.h
> > > index aa7b3b4..c80e7a8d 100644
> > > --- a/include/linux/device.h
> > > +++ b/include/linux/device.h
> > > @@ -714,7 +714,9 @@ int dev_set_name(struct device *dev, const char *name, ...);
> > >  #ifdef CONFIG_NUMA
> > >  static inline int dev_to_node(struct device *dev)
> > >  {
> > > -	return dev->numa_node;
> > > +	if (dev)
> > > +		return dev->numa_node;
> > > +	return -1;
> > 
> > What happens if this function returns -1?  Can the callers properly
> > handle this?
> > 
> 
> Gar.  Now I'm not sure any more.
> 
> -1 means no affinity and it's what the dev_to_node() returns if NUMA
> is disabled.  But now I think probably it's important to get the
> NUMA node correct in dma_pool_create() so this isn't the right
> answer.
> 
> dma_pool_create() is not correct.  It has code to handle a NULL
> "dev" pointer, but the dev_to_node() dereference will cause an oops
> before we reach it.  I'm think this is a real issue that affects a
> couple drivers.  Maybe those people compile without NUMA?
> 
> I'm not sure the right fix now.

Ok, I'll drop this one then.

greg k-h
