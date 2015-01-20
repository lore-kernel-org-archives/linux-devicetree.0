From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 0/3] iio: Add Cosmic Circuits ADC support
Date: Tue, 20 Jan 2015 17:36:45 -0300
Message-ID: <54BEBC5D.6010809@imgtec.com>
References: <1420577257-10846-1-git-send-email-ezequiel.garcia@imgtec.com> <54B133FE.1020808@kernel.org> <54BE33FB.6020800@imgtec.com> <54BEBC80.1090608@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BEBC80.1090608-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/20/2015 05:37 PM, Jonathan Cameron wrote:
> On 20/01/15 10:54, Ezequiel Garcia wrote:
>>
>>
>> On 01/10/2015 11:15 AM, Jonathan Cameron wrote:
>>> On 06/01/15 20:47, Ezequiel Garcia wrote:
>>>> This series add the support for an ADC IP block from Cosmic Circuits.
>>>> The patchset is based on v3.19-rc3.
>>>>
>>>> As agreed with Rob, this series drops the vendor prefix in the
>>>> adc-reserved-channels DT property. This property is generic enough to
>>>> be used in other drivers (at91 is a potential candidate).
>>>>
>>>> A follow-up patch can use the property in at91 and add it to the
>>>> IIO generic bindings.
>>> I'm happy - will let this sit for a little while to let Harmut say
>>> if wants to take another look (or give a reviewed-by or similar).
>>>
>>
>> Hi Jonathan,
>>
>> As Harmut gave a Reviewed-by, I'm wondering if you can pick this sooner
>> than later, so we don't miss next window.
>>
>> Thanks a lot!
>>
> Hi, I'm afraid that I'm a little stalled on sending it on because Greg
> hasn't yet picked up my last pull request.  In the mean time I've applied
> it to the branch that will get rebased once he's taken that and pushed it
> out as testing.
> 

OK, thanks a lot for the heads up.

Cheers,
-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
