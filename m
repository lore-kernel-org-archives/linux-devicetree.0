From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 18:08:34 +0000
Message-ID: <CAKv+Gu9qpLWTjjCZBvyn87HoNNY+U5++2UeHxF8jXYQPDd3U1A@mail.gmail.com>
References: <CAKv+Gu8wJkNWufXsRYGe0juLWt9GRfRj=tg3M+on2wtwaj+6EA@mail.gmail.com>
 <20171130.124234.1467691580228393484.davem@davemloft.net> <CAKv+Gu9sOzce_r3JKU8B4JDK2Gr5cB5NZdQxUMEmmy6SZ+sOFw@mail.gmail.com>
 <20171130.125813.1832145274236885737.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171130.125813.1832145274236885737.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jaswinder Singh <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2017 at 17:58, David Miller <davem@davemloft.net> wrote:
> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Date: Thu, 30 Nov 2017 17:48:44 +0000
>
>> On 30 November 2017 at 17:42, David Miller <davem@davemloft.net> wrote:
>>> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> Date: Thu, 30 Nov 2017 17:37:27 +0000
>>>
>>>> Well, the whole point of using memremap() instead of ioremap() is that
>>>> the region has memory semantics, i.e., we read the MAC address and the
>>>> DMA engine microcode from it. If memremap() itself is flawed in this
>>>> regard, I agree we should fix it. But as I understand it, this is
>>>> really an implementation problem in memremap() [the fact that it falls
>>>> back to ioremap()] and not a problem in this driver.
>>>>
>>>> So what alternative would you propose in this case?
>>>>
>>>> BTW, this should be IOREMAP_WC not IOREMAP_WT, because the EEPROM on
>>>> the platform in question does not tolerate cached mappings (or rather,
>>>> shareable mappings). ioremap_wt() happens to result in device mappings
>>>> rather than writethrough cacheable mappings, but this is another
>>>> problem in itself. Once arm64 fixes ioremap_wt(), this code will no
>>>> longer work on the SynQuacer SoC.
>>>
>>> It doesn't "fall back", it directly uses ioremap_wt() for non-RAM
>>> mappings.
>>>
>>> It you look, most architectures do a "#define iomrep_wt ioremap"
>>
>> OK, but that still means the implementation of memremap() is flawed,
>> not its use in this driver.
>>
>> memremap() exists to allow non-DRAM regions to be mapped with memory
>> semantics, and if we currently implement that incorrectly, we should
>> fix it. But that still does not mean we should have __iomem
>> annotations and special accessors in this case, precisely because it
>> has memory semantics, and so it is a virtual pointer that may be
>> dereferenced normally.
>
> Memory semantics and how to access that memory are two different things.
>
> On sparc64 the cacheability etc. can be specified in the load and
> store instructions.
>
> That's why I have all of the ioremap*() routines return a physical
> address.  The value returned from all of the ioremap*() interfaces is
> completely opaque.  That's why the return type is __iomem.
>
> The iomem accessors on sparc64 use the appropriate access bits in the
> load and store instructions as needed.
>
> So in order for this to work properly, new sets of acessors need to be
> implemented to let me give you the access semantics you want yet at
> the same time allowing architectures to have the flexibility of
> still returning an opaque "pointer".
>
> There is no reason for me to make a virtual mapping on sparc64 because
> it is completely unnecessary overhead since I can give you whatever
> cacheability/IO/etc. attributes needed in the load and store
> instructions themselves.
>

But the whole point of memremap() is obtaining a virtual mapping that
does not require accessors, but can be used like ordinary memory. The
fact that Sparc64 can do nifty things using special accessors but
without a virtual mapping is interesting, but not really relevant
IMHO.

So I will work with Jassi to reimplement this using ioremap(), given
that it is not performance critical, and given the fact that your
criticism appears to be directed to memremap() in general, and not the
way it is being used here.

Thanks,
Ard.
