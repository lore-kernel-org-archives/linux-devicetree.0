From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] pcie-designware: support for external MSI
 controller
Date: Tue, 30 Aug 2016 18:06:33 +0200
Message-ID: <20160830180633.67d6479d@free-electrons.com>
References: <1472561830-20932-1-git-send-email-thomas.petazzoni@free-electrons.com>
        <20160830172447.65d10772@free-electrons.com>
        <000c01d202d5$a3809bd0$ea81d370$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000c01d202d5$a3809bd0$ea81d370$@gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Joao Pinto' <jpinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Pratyush Anand' <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Jason Cooper' <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, 'Andrew Lunn' <andrew-g2DYL2Zd6BY@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Gregory Clement' <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Yehuda Yitschak' <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, 'Shadi Ammouri' <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, 'Nadav Haklai' <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, 'Marc Zyngier'
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 30 Aug 2016 11:46:13 -0400, Jingoo Han wrote:

> > Please discard this patch series, it's just pure crap. No changes at all
> > are needed on the pcie-designware driver, using the msi-parent property
> > already works, and my new code does nothing good.
> > 
> > The of_pci_find_msi_chip_by_node() API is on its way to being removed, and
> > it doesn't return anything useful.
> > 
> > Only PATCH 3/3 is needed, which I'll resubmit separately.
> > 
> > Sorry for the noise.  
> 
> Oh, good.
> The support for External MSI controller is really necessary.
> Thank you for your patch!

Well, no change in the driver is needed to use an external MSI
controller. Just specify:

	msi-parent = <&....>

in the DT description of your Designware PCIe controller. And that's
it. I've tested it with the GIC v2m MSI controller on an ARM64
platform, and it works as expected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
