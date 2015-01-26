From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] drivers: of: fix resources freeing in
 of_pci_get_host_bridge_resources()
Date: Mon, 26 Jan 2015 11:21:11 +0000
Message-ID: <20150126112111.GA547@red-moon>
References: <1420644571-18928-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1420644571-18928-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20150119183228.GE10762@e106497-lin.cambridge.arm.com>
 <20150120104922.GF5398@red-moon>
 <20150120112031.GA342@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150120112031.GA342-hOhETlTuV5niMG9XS5x8Mg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 11:20:32AM +0000, Liviu Dudau wrote:
> On Tue, Jan 20, 2015 at 10:49:22AM +0000, Lorenzo Pieralisi wrote:
> > On Mon, Jan 19, 2015 at 06:32:29PM +0000, Liviu Dudau wrote:
> > 
> > [...]
> > 
> > > > @@ -146,6 +146,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
> > > >  	struct of_pci_range_parser parser;
> > > >  	char range_type[4];
> > > >  	int err;
> > > > +	struct pci_host_bridge_window *window;
> > > >  
> > > >  	if (io_base)
> > > >  		*io_base = (resource_size_t)OF_BAD_ADDR;
> > > > @@ -225,7 +226,10 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
> > > >  conversion_failed:
> > > >  	kfree(res);
> > > >  parse_failed:
> > > > +	list_for_each_entry(window, resources, list)
> > > > +		kfree(window->res);
> > > >  	pci_free_resource_list(resources);
> > > > +	kfree(bus_range);
> > > >  	return err;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(of_pci_get_host_bridge_resources);
> > > 
> > > Hi Lorenzo et all,
> > > 
> > > Here is my personal view and I am happy to hear from others on the desired
> > > behaviour:
> > > 
> > > When I wrote this function what I had in mind was that it will parse as
> > > much as possible from the device tree and return a list of resources that
> > > could be successfully converted. If the entire list of ranges could not
> > > be converted then an error code will be returned, but the caller still
> > > had the list as constructed up to the error. It was the job of the caller
> > > to free the list in either cases, as stated in the comment.
> > 
> > That's what I am questioning. If the function takes an error path, the
> > windows list is freed, so the resource pointers are gone. There is no
> > way the caller can grab those resource pointers and free them.
> 
> I stand corrected. Your patch is needed.

Mind acking it ? I will ask Bjorn to take it then.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
