From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 0/8] Cache-coherent DMA access using UIO
Date: Thu, 11 Aug 2016 09:30:19 +0530
Message-ID: <CAALAos9eT4N-RM6-gswKcSTJK7tirFeVAxrzGsNbYOyuL4M83Q@mail.gmail.com>
References: <1470635557-13416-1-git-send-email-anup.patel@broadcom.com> <1983237.mRdWv2BGBr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1983237.mRdWv2BGBr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ankit Jindal <thatsjindal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Aug 10, 2016 at 9:25 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday, August 8, 2016 11:22:29 AM CEST Anup Patel wrote:
>> The goal of this patchset is to improve UIO framework and UIO dmem
>> driver to allow cache-coherent DMA accesses from user-space.
>>
>> This patchset is based on two previous patchsets:
>> 1) [PATCH v5 0/6] UIO driver for APM X-Gene QMTM
>> (Refer, http://www.spinics.net/lists/devicetree/msg58244.html)
>> 2) [PATCH 0/4] Fix and extend uio_dmem_genirq
>> (Refer, https://lkml.org/lkml/2016/5/17/141)
>>
>> We have adopted only patch0-3 of patchset1 which was abandoned
>> long time back. We have taken care of last few unaddressed comments
>> on these patches.
>>
>> The patchset2 is quite recent has been adopted entirely. We have
>> taken care review comments on these patches too.
>>
>> This patchset is based on v4.7-rc7 tag and it is available in uio-v2
>> branch of https://github.com/Broadcom/arm64-linux.git
>
>
> UIO devices are generally meant to be things that do not
> perform DMA and that don't screw up the rest of the system
> when misused. A device that is able to access any physical
> memory doesn't belong into this category. The way that
> uio_dmem_genirq.c gets around this is by requiring the device
> to be created by some code that sets up a separate IOMMU
> domain first, but the DT probing here doesn't do that.
> Note that IOMMU domains typically use 32-bit addressing,
> so the entire "dma_mask from property" dance isn't even
> required.

IMHO, UIO devices are meant for things that are not behind
any IOMMU hardware.

Yes, any mis-programming in user space using UIO can
potentially screw-up the rest of the system but this is
generally a known/assumed fact for people who are using UIO.

>
> Also, this seems to duplicate a lot of the work that
> went into "vfio". Can you explain why we need another way
> of doing the same thing here?

We can only use "vfio" for devices that are behind some
kind of IOMMU (Right??). For devices not having IOMMU
support will have to use UIO for user space access.

Particularly, there are lot of FPGA-based solutions and legacy
hardware which do not have IOMMU support (devices on
FPGA or specific devices).

In our use case, we have some FPGA-based device which
does not have IOMMU support and we are accessing this
FPGA-based device from user-space.

This patchset only tries to extend "uio" and "uio_dmem_genirq".
There is no intention of duplicating what has been already
done for "vfio".

I do agree that "vfio" should eventually become defacto method
of accessing devices in user space but that requires devices to
always have IOMMU support.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
