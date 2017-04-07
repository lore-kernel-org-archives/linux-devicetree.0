From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: change fixup of dma-ranges size to error
Date: Fri, 7 Apr 2017 12:09:25 -0500
Message-ID: <CAL_Jsq+8PoR5ikPbTbHgd-8rkGFmvorLrS9hHpmkVynkh69e-A@mail.gmail.com>
References: <1491459529-31391-1-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+GLBtaezUiTbm0DAA2+MjcvxAcCsS-qJrr05YcTO5tdw@mail.gmail.com>
 <58E68ADC.6040603@gmail.com> <CAL_Jsq+VreUFtA8ozs0Jcz45PTc-jTT=CEKuezeU7QYviiN-Jg@mail.gmail.com>
 <58E72123.4040607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58E72123.4040607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>, Sricharan <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ Robin, Sricharan

On Fri, Apr 7, 2017 at 12:18 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/06/17 15:41, Rob Herring wrote:
>> On Thu, Apr 6, 2017 at 1:37 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 04/06/17 07:03, Rob Herring wrote:
>>>> On Thu, Apr 6, 2017 at 1:18 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>>>
>>>>> of_dma_get_range() has workaround code to fixup a device tree that
>>>>> incorrectly specified a mask instead of a size for property
>>>>> dma-ranges.  That device tree was fixed a year ago in v4.6, so
>>>>> the workaround is no longer needed.  Leave a data validation
>>>>> check in place, but no longer do the fixup.  Move the check
>>>>> one level deeper in the call stack so that other possible users
>>>>> of dma-ranges will also be protected.
>>>>>
>>>>> The fix to the device tree was in
>>>>> commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree").
>>>>
>>>> NACK.
>>>> This was by design. You can't represent a size of 2^64 or 2^32.
>>>
>>> I agree that being unable to represent a size of 2^32 in a u32 and
>>> a size of 2^64 in a u64 is the underlying issue.
>>>
>>> But the code to convert a mask to a size is _not_ design, it is a
>>> hack that temporarily worked around a device tree that did not follow
>>> the dma-ranges binding in the ePAPR.
>>
>> Since when is (2^64 - 1) not a size. It's a perfectly valid size in
>
> I did not say (2^64 -1) is not a size.
>
> I said that the existing code has a hack that converts what is perceived
> to be a mask into a size.  The existing code is:
>
> @@ 110,21 @@ void of_dma_configure(struct device *dev, struct device_node *np)
>                 size = dev->coherent_dma_mask + 1;
>         } else {
>                 offset = PFN_DOWN(paddr - dma_addr);
>
>                 /*
>                  * Add a work around to treat the size as mask + 1 in case
>                  * it is defined in DT as a mask.
>                  */
>                 if (size & 1) {
>                         dev_warn(dev, "Invalid size 0x%llx for dma-range\n",
>                                  size);
>                         size = size + 1;
>                 }
>
>                 if (!size) {
>                         dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
>                         return;
>                 }
>                 dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
>         }
>
> Note the comment that says "in case it is defined in DT as a mask."
>
> And as you stated in a review comment is 2015: "Also, we need a WARN
> here so DTs get fixed."

Indeed. I agree that "let me put a mask in the DT so Linux (at some
version) works" is wrong. I still think (2^32 - 1) and (2^64 - 1)
should be allowed to avoid growing #size-cells and because
#size-cells=3 doesn't work.

>> DT. And there's probably not a system in the world that needs access
>> to that last byte. Is it completely accurate description if we
>> subtract off 1? No, but it is still a valid range (so would be
>> subtracting 12345).
>>
>>> That device tree was corrected a year ago to provide a size instead of
>>> a mask.
>>
>> You are letting Linux implementation details influence your DT
>> thinking. DT is much more flexible in that it supports a base address
>> and size (and multiple of them) while Linux can only deal with a
>> single address mask. If Linux dealt with base + size, then we wouldn't
>
> No.  of_dma_get_range() returns two addresses and a size from the
> dma-ranges property, just as it is defined in the spec.
>
> of_dma_configure() then interprets an odd size as meaning that the
> device tree incorrectly contains a mask, and then converts that mask
> to a size by adding one to it.  Linux is _still_ using address and
> size at this point.  It does _not_ convert this size into a mask,
> but instead passes size on into arch_setup_dma_ops().

It doesn't really matter where in the implementation, but at some
point we end up with only a mask in Linux was my point.

> The proposed patch is to quit accepting a mask as valid data in
> dma-ranges.
>
>
>> be having this conversation. As long as Linux only deals with masks,
>> we're going to have to have some sort of work-around to deal with
>> them.
>>
>>>> Well, technically you can for the latter, but then you have to grow
>>>> #size-cells to 2 for an otherwise all 32-bit system which seems kind
>>>> of pointless and wasteful. You could further restrict this to only
>>>> allow ~0 and not just any case with bit 0 set.
>>>>
>>>> I'm pretty sure AMD is not the only system. There were 32-bit systems too.
>>>
>>> I examined all instances of property dma-ranges in in tree dts files in
>>> Linux 4.11-rc1.  There are none that incorrectly specify mask instead of
>>> size.
>>
>> Okay, but there are ones for ranges at least. See ecx-2000.dts.
>
> The patch does not impact the ranges property.  It only impacts the
> dma-ranges property.

Yes, I know. I'm only pointing out we have other cases of size=~0 to
avoid growing #size-cells.

>>> #size-cells only changes to 2 for the dma-ranges property and the ranges
>>> property when size is 2^32, so that is a very small amount of space.
>>>
>>> The patch does not allow for a size of 2^64.  If a system requires a
>>> size of 2^64 then the type of size needs to increase to be larger
>>> than a u64.  If you would like for the code to be defensive and
>>> detect a device tree providing a size of 2^64 then I can add a
>>> check to of_dma_get_range() to return -EINVAL if #size-cells > 2.
>>> When that error triggers, the type of size can be changed.
>>
>> #size-cells > 2 is completely broken for anything but PCI. I doubt it
>
> Yes, that is what I said.  The current code does not support #size-cells > 2
> for dma-ranges.

It's not just dma-ranges. It's everywhere with reg and ranges and any
code that parses those too. If someone needs to truly specify sizes of
2^64 in DT (for reg, ranges, or dma-ranges), they are SOL.

> #size-cells > 2 for dma-ranges will lead to a problem in
> of_dma_get_range(), which stuffs the value of the size into a u64.
> Clearly, a 3 cell size will not fit into a u64.
>
>
>> is easily fixed without some special casing (i.e. a different hack)
>> until we have 128-bit support. I hope to retire before we need to
>> support that.
>>
>> Rob
>>
>
> Can we get back to the basic premise of the proposed patch?
>
> The current code in of_dma_configure() contains a hack that allows the
> dma-ranges property to specify a mask instead of a size.  The binding
> in the specification allows a size and does not allow a mask.
>
> The hack was added to account for one or more dts files that did not
> follow the specification.  In the mail list discussion of the hack
> you said "Also, we need a WARN here so DTs get fixed."
>
> The hack was first present in Linux 4.1.  The only in-tree dts that
> incorrectly contained a mask instead of a size in dma-ranges was
> arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
>
> That .dtsi was fixed by
> commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree")
> The fix was present in Linux 4.6, May 15, 2016.
>
> I would like to remove the hack.  I think that enough time has
> elapsed to allow this change.

If we have no cases of what I'm concerned about, then removing it is
fine. Is this a dependency for iommu series? Doesn't look like it to
me.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
