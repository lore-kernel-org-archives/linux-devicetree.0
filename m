From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 12:42:34 -0500 (EST)
Message-ID: <20171130.124234.1467691580228393484.davem@davemloft.net>
References: <1512058396-15907-1-git-send-email-jassisinghbrar@gmail.com>
        <20171130.122917.542712364953497229.davem@davemloft.net>
        <CAKv+Gu8wJkNWufXsRYGe0juLWt9GRfRj=tg3M+on2wtwaj+6EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKv+Gu8wJkNWufXsRYGe0juLWt9GRfRj=tg3M+on2wtwaj+6EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Thu, 30 Nov 2017 17:37:27 +0000

> Well, the whole point of using memremap() instead of ioremap() is that
> the region has memory semantics, i.e., we read the MAC address and the
> DMA engine microcode from it. If memremap() itself is flawed in this
> regard, I agree we should fix it. But as I understand it, this is
> really an implementation problem in memremap() [the fact that it falls
> back to ioremap()] and not a problem in this driver.
> 
> So what alternative would you propose in this case?
> 
> BTW, this should be IOREMAP_WC not IOREMAP_WT, because the EEPROM on
> the platform in question does not tolerate cached mappings (or rather,
> shareable mappings). ioremap_wt() happens to result in device mappings
> rather than writethrough cacheable mappings, but this is another
> problem in itself. Once arm64 fixes ioremap_wt(), this code will no
> longer work on the SynQuacer SoC.

It doesn't "fall back", it directly uses ioremap_wt() for non-RAM
mappings.

It you look, most architectures do a "#define iomrep_wt ioremap"
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
