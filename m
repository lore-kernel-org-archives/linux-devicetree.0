From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH V2 03/12] dtb: amd: Fix DMA ranges in device tree
Date: Fri, 12 Feb 2016 05:59:56 +0700
Message-ID: <56BD126C.1050301@amd.com>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <1454954357-8395-4-git-send-email-Suravee.Suthikulpanit@amd.com>
 <2845776.WTPtnQzg8d@wuerfel> <56BBA80E.6090205@amd.com>
 <CAOesGMgOmmXY2X2bwOd-6m117o6VPpqer6BXrzNePuRPoiz_Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgOmmXY2X2bwOd-6m117o6VPpqer6BXrzNePuRPoiz_Nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, Thomas Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ok, I'll send the incremental patch out again.

Thanks,
Suravee

On 2/12/16 04:23, Olof Johansson wrote:
> Hi,
>
> On Wed, Feb 10, 2016 at 1:13 PM, Suravee Suthikulpanit
> <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org> wrote:
>> Hi Arnd,
>>
>>
>> On 2/9/16 21:57, Arnd Bergmann wrote:
>>>
>>> On Monday 08 February 2016 11:59:08 Suravee Suthikulpanit wrote:
>>>>
>>>> From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>>>>
>>>> Fix DMA ranges of smb0 and pcie0 nodes in AMD Seattle SOC.
>>>>
>>>> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>>>>
>>>
>>> This could use a changelog text to explain why it's broken and how the
>>> fix works.
>>>
>>>          Arnd
>>>
>>
>> So, I have not experience the breakage. However, IIUC, the GICv2m MSI frame
>> is also considered DMA-able. So, I think it should be included in the
>> dma-range specified here. Please let me know if my assumption is incorrect.
>> Otherwise, I will include more description in the commit log in my next rev.
>
> As I replied when I did it -- I've applied the patches, so respinning
> won't work. Instead, please follow up with incremental fixes to this
> series instead.
>
>
> Thanks,
>
> -Olof
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
