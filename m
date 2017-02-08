From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2] usb: xhci: add support for performing fake doorbell
Date: Wed, 8 Feb 2017 17:39:52 -0500
Message-ID: <CAC3K-4p=KRQySpO-qKZS75-RzR1AnfqWHqsO9RjBR6X0+Xy+SQ@mail.gmail.com>
References: <20161001215817.25384-1-zajec5@gmail.com> <20161017203036.23399-1-zajec5@gmail.com>
 <CACna6rw0tnjEOSqjd=q66yWZWa+oNAkH-tk=RLiLzz_=i0x-sA@mail.gmail.com>
 <58331360.5000508@linux.intel.com> <CACna6ryJ7fod1KUOa9BVuQQWpCKg0_ArtMzHq_P5xYfW9Namxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryJ7fod1KUOa9BVuQQWpCKg0_ArtMzHq_P5xYfW9Namxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 2:32 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> On 21 November 2016 at 16:31, Mathias Nyman
> <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> On 21.11.2016 09:57, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>
>>> Hi Mathias,
>>>
>>> On 17 October 2016 at 22:30, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>>>>
>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>>
>>>> Broadcom's Northstar XHCI controllers seem to need a special start
>>>> procedure to work correctly. There isn't any official documentation of
>>>> this, the problem is that controller doesn't detect any connected
>>>> devices with default setup. Moreover connecting USB device to controll=
er
>>>> that doesn't run properly can cause SoC's watchdog issues.
>>>>
>>>> A workaround that was successfully tested on multiple devices is to
>>>> perform a fake doorbell. This patch adds code for doing this and enabl=
es
>>>> it on BCM4708 family.
>>>>
>>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>> ---
>>>> V2: Enable quirk for brcm,bcm4708 machines instead of adding separated
>>>> binding
>>>>      for it. Thanks Rob for your comment on this.
>>>
>>>
>>> Do you think you can pick & push this one? V2 follows Rob's suggestion
>>> and he has some DT knowledge for sure, so I guess it should be OK.
>>> --
>>
>>
>> Is there some more background information on this?
>>
>> I don't have any contacts to Broadcom myself, adding the BMC Kernel Feed=
back
>> list to CC.
>> Maybe someone over there has an errata, documentation or just general
>> feedback.
>>
>> How was this workaround even figured out? ringing the doorbell for the f=
irst
>> device doesn't seem like something found by trial and error,  especially
>> when
>> xhci specs state that:
>>
>> "Software shall not write the Doorbell of an endpoint until after it has
>> issued a
>> Configure Endpoint Command for the endpoint and received a successful
>> Command
>> Completion Event."
>>
>> The whole workaround is a bit intrusive, allocating a fake device, ring =
a
>> doorbell for a
>> fake device in the wrong state, clearing off HSE (host system error) whi=
ch
>> should only be set
>> when things really go bad, some random usleeps, and possible calling
>> xhci_start() twice.
>>
>> I can't take this as is without some more info.
>
> Hi (ping) Broadcom guys, could you help us with this USB workaround, plea=
se?

Investigating internally.  I'll let you know if I can find anything.

Thanks,
Jon

>
> --
> Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
