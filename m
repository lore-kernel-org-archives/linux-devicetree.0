From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Thu, 1 Feb 2018 16:31:46 +0000
Message-ID: <01c5498c-ac0a-7d2c-c804-3e8ea15839c4@arm.com>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <CACRpkdan52UB7HOyH1gnHWg4CDke_VQxAdq8cBgwUroibE59Ow@mail.gmail.com>
 <20180129082533.6edmqgbauo6q5dgz@flea.lan>
 <CACRpkdYAGwUjr2C-w5U+WuG48pZAOUcnxFjznLbdF6Lmy1uZuQ@mail.gmail.com>
 <CAK8P3a2HmPOTHAzqBnmim388pcWOE=fG50mG5HJifT=vzKOaTg@mail.gmail.com>
 <20180130075441.rqxzkwero6sdfak6@flea.lan>
 <CAK8P3a0QxQE=GM=SGPtT82=UreiqsgY6uMThvQ_woA3rjK0zjA@mail.gmail.com>
 <20180130095916.GA23047@ulmo> <20180130100150.GB23047@ulmo>
 <20180131072910.ajp3jc5dmetsjtf2@flea.lan>
 <CAK8P3a0X2bpLjKE6xKehG1junZoG1N_DjepOBQ+SZetKf6sgfA@mail.gmail.com>
Reply-To: robin.murphy-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBCZOPTGF6YHRB6UBZXJQKGQEF7DC7MA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAK8P3a0X2bpLjKE6xKehG1junZoG1N_DjepOBQ+SZetKf6sgfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Dave Martin <dave.martin-5wv7dgnIgG8@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>G
List-Id: devicetree@vger.kernel.org

On 31/01/18 09:37, Arnd Bergmann wrote:
> On Wed, Jan 31, 2018 at 8:29 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> Hi Thierry,
>>
>> On Tue, Jan 30, 2018 at 11:01:50AM +0100, Thierry Reding wrote:
>>> On Tue, Jan 30, 2018 at 10:59:16AM +0100, Thierry Reding wrote:
>>>> On Tue, Jan 30, 2018 at 10:24:48AM +0100, Arnd Bergmann wrote:
>>>>> On Tue, Jan 30, 2018 at 8:54 AM, Maxime Ripard
>>>>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>> On Mon, Jan 29, 2018 at 03:34:02PM +0100, Arnd Bergmann wrote:
>>>>>>> On Mon, Jan 29, 2018 at 10:25 AM, Linus Walleij
>>>>>>> <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>>>>>> On Mon, Jan 29, 2018 at 9:25 AM, Maxime Ripard
>>>>>>>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>>>>> On Sat, Jan 27, 2018 at 05:14:26PM +0100, Linus Walleij wrote:
>>>>>
>>>>>>>
>>>>>>> At one point we had discussed adding a 'dma-masters' property that
>>>>>>> lists all the buses on which a device can be a dma master, and
>>>>>>> the respective properties of those masters (iommu, coherency,
>>>>>>> offset, ...).
>>>>>>>
>>>>>>> IIRC at the time we decided that we could live without that complexity,
>>>>>>> but perhaps we cannot.
>>>>>>
>>>>>> Are you talking about this ?
>>>>>> https://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/dma/dma.txt#L41
>>>>>>
>>>>>> It doesn't seem to be related to that issue to me. And in our
>>>>>> particular cases, all the devices are DMA masters, the RAM is just
>>>>>> mapped to another address.
>>>>>
>>>>> No, that's not the one I was thinking of. The idea at the time was much
>>>>> more generic, and not limited to dma engines. I don't recall the details,
>>>>> but I think that Thierry was either involved or made the proposal at the
>>>>> time.
>>>>
>>>> Yeah, I vaguely remember discussing something like this before. A quick
>>>> search through my inbox yielded these two threads, mostly related to
>>>> IOMMU but I think there were some mentions about dma-ranges and so on as
>>>> well. I'll have to dig deeper into those threads to refresh my memories,
>>>> but I won't get around to it until later today.
>>>>
>>>> If someone wants to read up on this in the meantime, here are the links:
>>>>
>>>>      https://lkml.org/lkml/2014/4/27/346
>>>>      http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/257200.html
>>>>
>>>>  From a quick glance the issue of dma-ranges was something that we hand-
>>>> waved at the time.
>>>
>>> Also found this, which seems to be relevant as well:
>>>
>>>        http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/252715.html
>>>
>>> Adding Dave.
>>
>> Thanks for the pointers, I started to read through it.
>>
>> I guess we have to come up with two solutions here: a short term one
>> to address the users we already have in the kernel properly, and a
>> long term one where we could use that discussion as a starting point.
>>
>> For the short term one, could we just set the device dma_pfn_offset to
>> PHYS_OFFSET at probe time, and use our dma_addr_t directly later on,
>> or would this also cause some issues?
> 
> That would certainly be an improvement over the current version,
> it keeps the hack more localized. That's fine with me. Note that both
> PHYS_OFFSET and dma_pfn_offset have architecture specific
> meanings and they could in theory change, so ideally we'd do that
> fixup somewhere in arch/arm/mach-sunxi/ at boot time before the
> driver gets probed, but this wouldn't work on arm64 if we need it
> there too.

dma_pfn_offset certainly *shouldn't* be architecture-specific; it's just 
historically not been used consistently everywhere. That should now be 
addressed by Christoph's big dma_direct_ops cleanup (now merged) which 
fills in the places it was being missed in generic code. From quickly 
skimming this thread, it sounds like that is really should be sufficient 
for this particular hardware - if all its DMA goes through an 
interconnect which makes RAM appear at 0, then you give it "dma-ranges = 
<0 PHYS_OFFSET size>;" and things should 'just work' provided the DMA 
API is otherwise being used correctly.

If different devices have differing DMA master address maps (such that 
you can't just place a single dma-ranges on your "soc" node) then the 
trick is to wrap them in intermediate "simple-bus" nodes with a 
straight-though "ranges;" and the appropriate "dma-ranges = ...". Yes, 
it's a bit of a bodge, but then pretending AXI/APB interconnects are 
buses in the sense that DT assumes is already a bit of a bodge.

>> For the long term plan, from what I read from the discussion, it's
>> mostly centered around IOMMU indeed, and we don't have that. What we
>> would actually need is to break the assumption that the DMA "parent"
>> bus is the DT node's parent bus.
>>
>> And I guess this could be done quite easily by adding a dma-parent
>> property with a phandle to the bus controller, that would have a
>> dma-ranges property of its own with the proper mapping described
>> there. It should be simple enough to support, but is there anything
>> that could prevent something like that to work properly (such as
>> preventing further IOMMU-related developments that were described in
>> those mail threads).
> 
> I've thought about it a little bit now. A dma-parent property would nicely
> solve two problems:
> 
> - a device on a memory mapped control bus that is a bus master on
>    a different bus. This is the case we are talking about here AFAICT
> 
> - a device that is on a different kind of bus (i2c, spi, usb, ...) but also
>    happens to be a dma master on another bus. I suspect we have
>    some of these today and they work by accident because we set the
>    dma_mask and dma_map_ops quite liberally in the DT probe code,
>    but it really shouldn't work according to our bindings. We may also
>    have drivers that work around the issue by forcing the correct dma
>    mask and map_ops today, which makes them work but is rather
>    fragile.

Note that I recently started tightening this area up (see d89e2378a97f), 
precisely because doing DMA configuration for things that shouldn't be 
DMA masters turned out to be messing with legitimate devices in 
conjunction with other unpleasant and fiddly circumstances elsewhere.

> I can think of a couple of other problems that may or may not be
> relevant in the future that would require a more complex solution:
> 
> - a device that is a bus master on more than one bus, e.g. a
>    DMA engine that can copy between the CPU address space and
>    another memory controller that is not visible to the CPU

Those definitely exist - e.g. as best I understand it the crypto SRAMs 
on Marvell Armada XP parts which we describe as "mmio-sram" are not 
actually CPU-accessible, and only the CESA DMA engine can move data 
between them and main memory.

> - a device that is connected to main memory both through an IOMMU
>    and directly through its parent bus, and the device itself is in
>    control over which of the two it uses (usually the IOMMU would
>    contol whether a device is bypassing translation)

*shudder*

> - a device that has a single DMA address space with some form
>    of non-linear mapping to one or more parent buses. Some of these
>    can be expressed using the parent's dma-ranges properties, but
>    our code currently only looks at the first entry in dma-ranges.

That's definitely a thing, too. In fact the TI Keystone platform which 
begat our current of_dma_get_range() implementation is like that; we 
just only describe the offset upper half of the DMA address map where 
dma-coherent RAM lives, not the bottom 2GB of peripherals which is the 
same as the CPU view. See also the madness of the brcmstb PCIe patches 
elsewhere on this list.

> Another problem is the interaction with the dma-ranges and iommu
> properties. I have not found any real problems here, but we certainly
> need to be careful to define what happens in all combinations and
> make sure that we document it well in the bindings and have those
> reviewed by the affected parties, at least the ARM and PowerPC
> architecture folks as well as the Nvidia and Renesas platform
> maintainers, which in my experience have the most complex DMA
> hardware.
I hold out hope that we never see DMA offsets mixed with IOMMUs (because 
thankfully it doesn't make much sense from a hardware perspective), but 
we certainly do want the size aspect of dma-ranges to describe cases 
where there are fewer than expected address bits wired between the 
device master interface and IOMMU slave interface. There's a fairly 
long-standing issue with that being a bit broken which is hurting at 
least one platform I know about.

Robin.
