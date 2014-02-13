From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] pci: Add support for creating a generic host_bridge from device tree
Date: Thu, 13 Feb 2014 13:15:29 +0100
Message-ID: <4739375.bEm7oed1OF@wuerfel>
References: <1391452428-22917-1-git-send-email-Liviu.Dudau@arm.com> <3204351.WykFFcX4zJ@wuerfel> <20140213115327.GV26684@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140213115327.GV26684-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'linux-pci' <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'LKML' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Tanmay Inamdar' <tinamdar-qTEPVZfXA3Y@public.gmane.org>, 'Catalin Marinas' <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'LAKML' <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 13 February 2014 11:53:27 Russell King - ARM Linux wrote:
> On Thu, Feb 13, 2014 at 12:27:05PM +0100, Arnd Bergmann wrote:
> > I would rather get rid of struct hw_pci for architecture independent
> > drivers and add a different registration method on arm32 that is
> > compatible with what we come up with on arm64. The main purpose of
> > hw_pci is to allow multiple PCI controllers to be initialized at
> > once, but we don't actually need that for any of the "modern" platforms
> > where we already have a probe function that gets called once for
> > each controller.
> 
> No.  The main purpose of hw_pci is as a container to support multiple
> different platform specific PCI implementations in one kernel.  It's
> exactly what you need for single zImage.

Well, we definitely need something to manage the assignment of domains,
bus numbers and I/O space windows, but the main issue I see with existing
hw_pci container is that it assumes that you can pass give it all
host bridges for a given domain at once. The problem with this is
that the pci host bridge drivers don't interact with one another, so
a system that needs two different PCI host drivers can't use hw_pci
to register them both, unless we come up with some extra
infrastructure.

Also, the calling conventions for pci_common_init_dev() mean that
it's hard to propagate -EPROBE_DEFER errors back to the driver
probe function, so it seems easier to come up with something new
that deals with all issues at once and that is outside of architecture
specific code.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
