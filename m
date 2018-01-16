From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 6/6] PCI: cadence: Add host driver for Cadence PCIe
 controller
Date: Tue, 16 Jan 2018 15:09:31 +0000
Message-ID: <20180116150931.GA17237@red-moon>
References: <cover.1515621150.git.cyrille.pitchen@free-electrons.com>
 <990730f5c1156b3bb15f56fa877719941f219016.1515621150.git.cyrille.pitchen@free-electrons.com>
 <e3d88d5b-e770-d2e5-20b2-62551d5f4f8f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e3d88d5b-e770-d2e5-20b2-62551d5f4f8f-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 04:46:12PM +0530, Kishon Vijay Abraham I wrote:

[...]

> > +static struct platform_driver cdns_pcie_host_driver = {
> > +	.driver = {
> > +		.name = "cdns-pcie-host",
> > +		.of_match_table = cdns_pcie_host_of_match,
> > +	},
> > +	.probe = cdns_pcie_host_probe,
> > +};
> 
> In the case of DWC, designware core is modeled as a library which has
> API's to be invoked by various platform specific glue drivers.
> 
> But with the cadence approach we'll have two separate drivers: the
> cadence core driver and the platform specific glue drivers. Is this
> approach chosen for a specific reason?

That's a fair point but I do not think that's a concern at the moment.

If/when other platform drivers are built around the generic IP we just
have to refactor this driver and turn into a core library + a PCI host
bridge driver like dwc does, at the moment I do not necessarily see the
reason for splitting them.

Cyrille ?

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
