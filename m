From: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Mon, 3 Feb 2014 09:41:25 -0800
Message-ID: <20140203174125.GH4167@cbox>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
 <52EA83D6.9050506@codeaurora.org>
 <20140203045638.GB4167@cbox>
 <52EF9D9F.5020600@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52EF9D9F.5020600-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 03, 2014 at 08:46:07AM -0500, Christopher Covington wrote:
> Hi Christoffer,
> 
> On 02/02/2014 11:56 PM, Christoffer Dall wrote:
> > On Thu, Jan 30, 2014 at 11:54:46AM -0500, Christopher Covington wrote:
> >> I think it would be informative to provide pointers here to commonly used
> >> paravirtualized devices, especially VirtIO PCI/MMIO.
> > 
> > I disagree: that would only encourage limited testing or assumptions
> > about these specific devices when really this platform is just a
> > bare-bones platform driven by device tree which should make no
> > preference, whatsoever, about which devices are used with the platform.
> 
> I'd be all for clearly stating that no assumptions can be made. Perhaps you
> can explain though how providing less documentation will result in more
> testing? The assertion does not currently make sense to me.
> 
If the documentation states that this is commonly used with virtio/xen
pv drivers, then I'm afraid people will just assume that's the only
devices the platform is used with.

Any mention of specific devices or features steers the attention away
from the essential point of this documentation.

I don't see how adding this text helps.  Such documentation should go
elsewhere, in QEMU, or a Xen/KVM web page or something like that.

Anyway, I'm not religious about this point.

-Christoffer
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
