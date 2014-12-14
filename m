From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/4] pci: iProc: define Broadcom iProc PCIe binding
Date: Sun, 14 Dec 2014 17:29:25 +0100
Message-ID: <3622321.f8bfUffhzH@wuerfel>
References: <1418351817-14898-2-git-send-email-rjui@broadcom.com> <3383252.Ad6Qf0H2fa@wuerfel> <548D5CD1.10801@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548D5CD1.10801-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 14 December 2014 10:48:01 Arend van Spriel wrote:
> On 12/13/14 20:46, Arnd Bergmann wrote:
> > On Saturday 13 December 2014 11:05:52 Arend van Spriel wrote:
> >>
> >> Makes sense. I think that is what Hauke meant by "adding
> >> additional support for registering to bcma". So the discovery info is a
> >> piece of read-only memory in the chip. Its address is stored in the
> >> chipcommon core register space. BCMA parses that memory blob resulting
> >> in a list of cores which register address info. We could add DT support
> >> in BCMA matching the compatible string and register a core for it.
> >
> > Ah, interesting idea. That would mirror what we do for drivers/amba,
> > I like the idea.
> 
> + Rafal
> 
> Let's explore this. Although I don't have the iProc hardware to verify it.
> 

If we can make this work nicely, you won't even need iProc hardware,
but instead provide all the data for the bcma devices on an older
machine through DT and get the probing to work with that. For AMBA,
we actually allow mixing amba and platform devices on the same parent.
You could do this here as well, but it would be simpler to have a
a special bcma device node as the parent that does the probing, in order
to avoid adding bcma specific code to drivers/of/platform.c

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
