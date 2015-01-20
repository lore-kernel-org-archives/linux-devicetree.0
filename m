From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] drivers: port PCIe designware to new DT parsing
 API
Date: Tue, 20 Jan 2015 10:39:25 +0000
Message-ID: <20150120103925.GE5398@red-moon>
References: <1420644571-18928-1-git-send-email-lorenzo.pieralisi@arm.com>
 <CAL_JsqLYg9vhFVmf=O4YLPfboj-dyoCR0H5dzBbMC3PeAEOwhQ@mail.gmail.com>
 <1539153.bO1tVUM2dB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1539153.bO1tVUM2dB@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 04:59:00PM +0000, Arnd Bergmann wrote:
> On Monday 19 January 2015 10:40:39 Rob Herring wrote:
> > 
> > I don't really like exposing ranges to host drivers. We've worked to
> > not do that. So perhaps we need to rethink the API. I think we need to
> > provide each range as a pair of resources which are the CPU address
> > and PCI address. Perhaps an iterator is kind of pointless here. We do
> > different things for each one. Are there cases with more than a single
> > i/o space, non-prefetch memory and prefetch memory range? Perhaps we
> > should just get the i/o and memory resources as separate calls. Just
> > tossing out some ideas here.
> 
> Nice idea, that could be similar to platform_get_resource().

I like the idea too, it should simplify the API implementation.

> We probably also need the distinction between CPU address and (parent)
> bus address here. In most drivers they are the same, but we actually
> need to program the latter one into the PCI host bridge registers.

Yes, CPU untranslated addresses are a pain in the back. I wrote
the series at it is to avoid changing the API, but I agree that's
a bit convoluted, which means we should refactor it.

I think the API should always return a pair of CPU-PCI resources as Rob
said, and provide an "on-demand" request for untranslated addresses, since
their usage is not that common (at the moment). I need to think about
that, we might even return a triplet, I hate doing that since I fear
it might be a one-off need for PCIe designware.

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
