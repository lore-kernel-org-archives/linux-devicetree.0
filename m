From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: amba: use of_dma_configure for AMBA devices
Date: Thu, 18 Sep 2014 12:35:32 +0100
Message-ID: <541AC384.8010806@arm.com>
References: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com> <20140917170338.GC18532@arm.com> <CAL_JsqKTZyPgbxy=pPmFPKRxa97oaWqC6u6pBvqvja_URLno4Q@mail.gmail.com> <20140917180524.GG18532@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140917180524.GG18532-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Catalin/Will/Rob,

On 17/09/14 19:05, Will Deacon wrote:
> On Wed, Sep 17, 2014 at 06:47:19PM +0100, Rob Herring wrote:
>> On Wed, Sep 17, 2014 at 12:03 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
>>> On Wed, Sep 17, 2014 at 12:56:07PM +0100, Robin Murphy wrote:
>>>> Commit 591c1e ("of: configure the platform device dma parameters)
>>>> introduced a common mechanism to configure DMA from DT properties.
>>>> AMBA devices created from DT can take advantage of this, too.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
>>>
>>>    Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>>>
>>> It would be great if the arm-soc guys can pick this up.
>>
>> Is this a dependency for something else? If so,
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Yeah, it's going to be needed by my IOMMU init rework so that AMBA devices
> get registered with their IOMMUs.
>

Noob question: Does that mean I should resend (with ACKs) to 
arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org? (I wasn't entirely sure where this should go, hence just 
throwing at the list with CCs)

Robin.

> Will
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
