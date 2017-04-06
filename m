From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: change fixup of dma-ranges size to error
Date: Thu, 6 Apr 2017 11:37:16 -0700
Message-ID: <58E68ADC.6040603@gmail.com>
References: <1491459529-31391-1-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+GLBtaezUiTbm0DAA2+MjcvxAcCsS-qJrr05YcTO5tdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+GLBtaezUiTbm0DAA2+MjcvxAcCsS-qJrr05YcTO5tdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/06/17 07:03, Rob Herring wrote:
> On Thu, Apr 6, 2017 at 1:18 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> of_dma_get_range() has workaround code to fixup a device tree that
>> incorrectly specified a mask instead of a size for property
>> dma-ranges.  That device tree was fixed a year ago in v4.6, so
>> the workaround is no longer needed.  Leave a data validation
>> check in place, but no longer do the fixup.  Move the check
>> one level deeper in the call stack so that other possible users
>> of dma-ranges will also be protected.
>>
>> The fix to the device tree was in
>> commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree").
> 
> NACK.
> This was by design. You can't represent a size of 2^64 or 2^32.

I agree that being unable to represent a size of 2^32 in a u32 and
a size of 2^64 in a u64 is the underlying issue.

But the code to convert a mask to a size is _not_ design, it is a
hack that temporarily worked around a device tree that did not follow
the dma-ranges binding in the ePAPR.

That device tree was corrected a year ago to provide a size instead of
a mask.

> Well, technically you can for the latter, but then you have to grow
> #size-cells to 2 for an otherwise all 32-bit system which seems kind
> of pointless and wasteful. You could further restrict this to only
> allow ~0 and not just any case with bit 0 set.
> 
> I'm pretty sure AMD is not the only system. There were 32-bit systems too.

I examined all instances of property dma-ranges in in tree dts files in
Linux 4.11-rc1.  There are none that incorrectly specify mask instead of
size.

#size-cells only changes to 2 for the dma-ranges property and the ranges
property when size is 2^32, so that is a very small amount of space.

The patch does not allow for a size of 2^64.  If a system requires a
size of 2^64 then the type of size needs to increase to be larger
than a u64.  If you would like for the code to be defensive and
detect a device tree providing a size of 2^64 then I can add a
check to of_dma_get_range() to return -EINVAL if #size-cells > 2.
When that error triggers, the type of size can be changed.

> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
