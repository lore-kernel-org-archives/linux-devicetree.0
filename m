MIME-Version: 1.0
In-Reply-To: <201403141825.07705.arnd@arndb.de>
References: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
	<201988591.AhaUZy8EHz@wuerfel>
	<CAL_JsqKbtAxDBrF3O=C8exke9HVU0_ZC-vWZKiiftR+YMaUwMw@mail.gmail.com>
	<201403141825.07705.arnd@arndb.de>
Date: Fri, 14 Mar 2014 13:32:54 -0500
Message-ID: <CAL_JsqJpeVEd-Hv2q9eMtGUUx_4ANdoetEA4WiiLycCyAWYBVg@mail.gmail.com>
Subject: Re: [PATCH 4/7] of: configure the platform device dma_mask and dma_pfn_offset
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Arnd Bergmann <arnd@arndb.de>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 14, 2014 at 12:25 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 14 March 2014, Rob Herring wrote:
>> On Wed, Mar 12, 2014 at 11:58 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Wednesday 12 March 2014 15:19:48 Grygorii Strashko wrote:

>> In the case of
>> 64-bit DMA, the device should try to set its mask to DMA_MASK(64), but
>> the parent dma-ranges should restrict that to DMA_MASK(40).
>
> Now I'm confused about what dma_set_mask is actually supposed to do here.
> I /think/ it should fail the DMA_MASK(64) call if the bus supports
> less than 64 bits as in the above example. However it seems like a
> valid shortcut to always succeed here if the effective mask covers
> all of the installed RAM.
>
> That would mean that even if we only have a 32-bit bus, but all RAM
> resides below 4GB, a call to dma_set_mask using DMA_MASK(64) would
> also succeed.

Which is correct? The mask being bigger than all of RAM is okay. The mask only matters when it is less than all of RAM.

It should fail if RAM is >40 bits of address space.

>
>> >                         ...
>> >                 };
>> >
>> >                 ahb {
>> >                         #address-cells = <1>;
>> >                         #size-cells = <1>;
>>
>> This would need to be 2. ePAPR says the size cells size is determined
>> by #size-cells in the same node.
>
> Ah, of course.
>
>> >                         dma-ranges = <0 0  0  0x1 0>; /* only 4GB */
>> >
>> >                         ehci {
>> >                                 dma-ranges = <0  0  0xffffffff>;
>>
>> Again, I don't think this is needed. Here, regardless of the device's
>> capabilities, the bus is restricting the mask to DMA_MASK(32).
>
> Right.
>
>> >                                 /* side-question: is that the right way
>> >                                   to describe 4GB length? it seems missing
>> >                                   a byte */
>> >                         };
>> >                 };
>> >         };
>> >
>> > BTW, I hope I understood you right that you wouldn't actually trust the
>> > capabilities register by itself but only allow setting the 64-bit mask
>> > in the arch code if the DT doesn't have any information about the
>> > bus being incapable of doing this, right?
>>
>> Ideally no, but it appears we are ATM for midway. We get away with it
>> since it is midway/highbank specific driver setup and know there are
>> not any restrictions in addressing RAM. I think we have to keep bus
>> and device masks separate and the final mask is the AND of them. There
>> isn't really a construct to do this currently AFAICT. dma_set_mask
>> could be modified to adjust the mask, but that would be a change in
>> how dma_set_mask works as it is supposed to fail if the requested mask
>> cannot be supported.
>>
>> Perhaps using dma_get_required_mask to parse dma-ranges would be
>> appropriate here? It doesn't seem widely used though.
>
> Hmm, I've never even heard of that interface.
>
>> >> Compatibility issues:
>> >>   - Old DT without DMA properties defined: Drivers may still need to call dma_set_mask(DMA_MASK(64)
>> >>   - Old DT without DMA properties defined and DMA range is defined outside of RAM:
>> >>   arch or drivers code still has to provide proper address translation routines.
>> >
>> > 64-bit SOC includes 32-bit CPU with LPAE, right?
>> >
>> > Would you want to allow dma_set_mask(DMA_MASK(64)) to succeed in the absence
>> > of the dma-ranges properties?
>>
>> Yes, because the default should be no restrictions are imposed by the
>> bus. DT should describe the restrictions or translations. The default
>> should be masters have the same view of memory map as the cpu and can
>> use all address bits the device has.
>
> Hmm, I was rather thinking we should mirror what we have for the "ranges"
> property where an empty property signifies that there are no restrictions
> and the parent and child bus have the same view.
>
> In case of "ranges", the absence of the property means that there is
> no possible translation, but we can't do that for "dma-ranges" because
> that would break every single 32-bit SoC in existence today.
>
> Defining this case to mean "only 32-bit translations are possible" is
> a bit hacky but I think it would be a more pragmatic approach.
>
>> >> [3] 64 bit SOC (only 32 bit masters):
>> >>
>> >> - DMA range is present and It's defined inside RAM (no address translation needed):
>> >>   DMA range can be absent - default DMA configuration will be applied.
>> >>
>> >> - DMA range present and It's defined outside of RAM (address translation needed):
>> >>   DMA range has to be present and depending on its size
>> >>   dma_mask will be equal or less than DMA_MASK(32); and dma_pfn_offset will be calculated.
>> >>
>> >> Compatibility issues:
>> >>   - Old DT without DMA properties defined and DMA range is defined outside of RAM:
>> >>   arch or drivers code has to provide proper address translation routines.
>> >>
>> >>
>> >> [4] 64 bit SOC (32 bit and 64 masters):
>> >> - This is combination of above 2,3 cases.
>> >>   The current approach will allow to handle it by defining two buses in DT
>> >>   "simple-bus32" and "simple-bus64", and each one should have its own DMA properties
>> >>   defined in DT.
>> >
>> > We already try to describe the hierarchy of the buses, and only AXI4 buses can be
>> > 64-bit, unlike AHB or other types of AMBA buses AFAIK. We should just call them
>> > what they are.
>>
>> I don't think we do describe the hierarchy. We are describing the
>> slave side which is not necessarily the same as the master side.
>> Internal buses are also much more complex than any of the SOCs
>> describe in their DT.
>
> I think we try to describe them as good as we can if we have access to
> the documentation. I keep hearing people mention the case where the
> slave side is different from the master side, but is that actually
> a common scenario? If it's as rare as I suspect, we can fake a hierarchy
> for the cases we need, but describe most of them correctly.
>
>         Arnd
