From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Wed, 02 Dec 2015 21:47:19 +0000
Message-ID: <565F66E7.20207@collabora.co.uk>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk> <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk> <20151202151552.GA11101@rob-hp-laptop> <565F2137.609@collabora.co.uk> <CAL_JsqLhoEc9M=ZUgqL1_ZFKVN+1UfL=h-mWUdri0O_bqZyf_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLhoEc9M=ZUgqL1_ZFKVN+1UfL=h-mWUdri0O_bqZyf_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/12/15 18:44, Rob Herring wrote:
> On Wed, Dec 2, 2015 at 10:49 AM, Martyn Welch
> <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>>
>>
>> On 02/12/15 15:15, Rob Herring wrote:
>>>
>>> On Tue, Dec 01, 2015 at 07:12:49PM +0000, Martyn Welch wrote:
>>>>
>>>> This patch adds documentation for the chromeos-firmware binding.
>>>>
>>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>>>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>>>> ---
>>>>    .../devicetree/bindings/misc/chromeos-firmware.txt | 27
>>>> ++++++++++++++++++++++
>>>
>>>
>>> bindings/firmware/ please.
>>>
>>
>> OK.
>>
>>>>    1 file changed, 27 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>> b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>> new file mode 100644
>>>> index 0000000..8240611
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
>>>> @@ -0,0 +1,27 @@
>>>> +Device-Tree bindings for chromeos-firmware.c.
>>>
>>>
>>> Perhaps a bit more description what this is.
>>>
>>> What aspect of this is firmware? How does this relate to the EC?
>>>
>>
>> With respect to write-protect, this line is the write protection for the
>> flash which holds the bootloader.
>
> What is driving the write-protect? Are trying to assign ownership of
> the SOC GPIOs to the bootloader/firmware? If so, I think this is all
> wrong.
>

The lines are typically driven by a debugging board plugged into a 
socket on the Chromebooks motherboard, not by the device it's self. The 
driver exposes a read-only interface to these signals.

Martyn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
