From: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Sun, 2 Feb 2014 20:56:38 -0800
Message-ID: <20140203045638.GB4167@cbox>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
 <52EA83D6.9050506@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52EA83D6.9050506-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 11:54:46AM -0500, Christopher Covington wrote:
> Hi Ian,
> 
> On 01/30/2014 11:11 AM, Ian Campbell wrote:
> > mach-virt has existed for a while but it is not written down what it actually
> > consists of. Although it seems a bit unusual to document a binding for an
> > entire platform since mach-virt is entirely virtual it is helpful to have
> > something to refer to in the absence of a single concrete implementation.
> > 
> > I've done my best to capture the requirements based on the git log and my
> > memory/understanding.
> > 
> > While here remove the xenvm dts example, the Xen tools will now build a
> > suitable mach-virt compatible dts when launching the guest.
> 

[...]

> > +The platform may also provide hypervisor specific functionality
> > +(e.g. PV I/O), if it does so then this functionality must be
> > +discoverable (directly or indirectly) via device tree.
> 
> I think it would be informative to provide pointers here to commonly used
> paravirtualized devices, especially VirtIO PCI/MMIO.
> 

I disagree: that would only encourage limited testing or assumptions
about these specific devices when really this platform is just a
bare-bones platform driven by device tree which should make no
preference, whatsoever, about which devices are used with the platform.

-Christoffer
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
