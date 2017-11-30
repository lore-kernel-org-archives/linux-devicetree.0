From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 17:48:44 +0000
Message-ID: <CAKv+Gu9sOzce_r3JKU8B4JDK2Gr5cB5NZdQxUMEmmy6SZ+sOFw@mail.gmail.com>
References: <1512058396-15907-1-git-send-email-jassisinghbrar@gmail.com>
 <20171130.122917.542712364953497229.davem@davemloft.net> <CAKv+Gu8wJkNWufXsRYGe0juLWt9GRfRj=tg3M+on2wtwaj+6EA@mail.gmail.com>
 <20171130.124234.1467691580228393484.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130.124234.1467691580228393484.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "<netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jaswinder Singh <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2017 at 17:42, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:
> From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Thu, 30 Nov 2017 17:37:27 +0000
>
>> Well, the whole point of using memremap() instead of ioremap() is that
>> the region has memory semantics, i.e., we read the MAC address and the
>> DMA engine microcode from it. If memremap() itself is flawed in this
>> regard, I agree we should fix it. But as I understand it, this is
>> really an implementation problem in memremap() [the fact that it falls
>> back to ioremap()] and not a problem in this driver.
>>
>> So what alternative would you propose in this case?
>>
>> BTW, this should be IOREMAP_WC not IOREMAP_WT, because the EEPROM on
>> the platform in question does not tolerate cached mappings (or rather,
>> shareable mappings). ioremap_wt() happens to result in device mappings
>> rather than writethrough cacheable mappings, but this is another
>> problem in itself. Once arm64 fixes ioremap_wt(), this code will no
>> longer work on the SynQuacer SoC.
>
> It doesn't "fall back", it directly uses ioremap_wt() for non-RAM
> mappings.
>
> It you look, most architectures do a "#define iomrep_wt ioremap"

OK, but that still means the implementation of memremap() is flawed,
not its use in this driver.

memremap() exists to allow non-DRAM regions to be mapped with memory
semantics, and if we currently implement that incorrectly, we should
fix it. But that still does not mean we should have __iomem
annotations and special accessors in this case, precisely because it
has memory semantics, and so it is a virtual pointer that may be
dereferenced normally.

So if memremap() is unsuitable, how should we map memory that is not DRAM?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
