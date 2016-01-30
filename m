From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/13] dtb: amd: Miscelleneous Updates for AMD Seattle
 DTS
Date: Fri, 29 Jan 2016 17:02:37 -0800
Message-ID: <56AC0BAD.1020105@gmail.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com> <CAOesGMgRC2vTVdmY6kKYonM1JkWD=-3k_EQ4hGvyrm-vNZczrQ@mail.gmail.com> <56AA9436.60800@amd.com> <CAOesGMhG-dy9CJ+hLr_OV73BnKo-mstDjfDyhQhjvUnZ8pCAYA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhG-dy9CJ+hLr_OV73BnKo-mstDjfDyhQhjvUnZ8pCAYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, leo.duran-5C7GfCeVMHo@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/28/2016 6:43 PM, Olof Johansson wrote:
> On Thu, Jan 28, 2016 at 2:20 PM, Suravee Suthikulanit
> <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org> wrote:
>> Hi Olof,
>>
>> On 1/28/2016 3:39 PM, Olof Johansson wrote:
>>>
>>> Hi Suravee,
>>>
>>> On Wed, Jan 27, 2016 at 1:11 PM, Suravee Suthikulpanit
>>> <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org> wrote:
>>>>
>>>> From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>>>>
>>>> This patch series contains several updates for the AMD Seattle SOC DTS
>>>> files.
>>>> It also adds new board files for newer Overdrive and Linaro 96boards
>>>> (Husky)
>>>> platforms.
>>>
>>>
>>> My Overdrive comes with DT provided by firmware, so there's no need to
>>> have a in-kernel-tree DT source.
>>
>>
>> You are correct that the FW comes with DT, and in typical case, you wouldn't
>> need this.
>>
>>> Are you aware of other reasons to have it here? I just foresee
>>> divergence and conflicts between the two. It was quite obvious before
>>> this update when the FW-provided DT was a lot more complete than what
>>> we had in the kernel tree.
>>
>>
>> However, there are still new/updated drivers being developed, and sometimes
>> requires new/changes in DT binding. So, the DT that comes with the FW can
>> get out of date, and will lack the support for new drivers.
> 
> Note that it's expected that the driver will cope with the old DT
> contents, i.e. it needs to go with defaults that made sense before the
> binding was updated.
> 
> It, however, doesn't have to enable new features. In other words,
> booting with an old DT needs to continue working. You can't require a
> user to update DT to avoid getting driver breakage.
> 
> (The opposite is not enforced: Booting with a DT that is newer than
> the kernel isn't guaranteed to always work).
> 
>> Certain version of the FW allows overriding the DT that comes with the FW.
>> So, we are providing the in-kernel DT to allow developers to provide the
>> updated device tree for newer kernels. This patch series is bringing the
>> in-kernel DT closer to what the latest FW is providing to avoid potential
>> conflicts.
> 
> I do appreciate keeping the kernel one up to date with what firmware
> provides if it's truly needed, but I'd even more prefer that it
> wasn't. After all, it's how the ACPI-based booting works (no
> overriding table provided with the kernel), so it's a model you should
> already be somewhat familiar with. :)
> 
> I'm not doing a hard NAK on this, but I would like to get a bit more
> understanding of why it's considered needed.
> 
> 
> -Olof

I would strongly encourage the inclusion of the dts file in the kernel
source tree, even if the dtb is delivered with the firmware for several
reasons.

The dts provides a reference for other developers who are supporting new
boards that are similar.

The dts might be reviewed.

We hope to have tools that will validate the dts against the documented
bindings.  (Yes, this effort has stalled, but I am optimistic that it
is not dead.)

If someone has the board (any board, not just this one) that the kernel
does not boot on, then it might not be possible to retrieve the dtb
from the board (which can then be de-compiled to a dts) for the
purpose of debugging or properly configuring the kernel.  (The boot
loader may provide the ability to get the dtb or it might not.)

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
