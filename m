From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Fri, 7 Apr 2017 15:44:21 +0530
Message-ID: <58E7667D.2070408@nvidia.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com> <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 07 April 2017 03:55 PM, Linus Walleij wrote:
> On Thu, Apr 6, 2017 at 3:35 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> Currently, the GPIO interface is said to Open Drain if it is Single
>> Ended and active LOW. Similarly, it is said as Open Source if it is
>> Single Ended and active HIGH.
>>
>> The active HIGH/LOW is used in the interface for setting the pin
>> state to HIGH or LOW when enabling/disabling the interface.
>>
>> In Open Drain interface, pin is set to HIGH by putting pin in
>> high impedance and LOW by driving to the LOW.
>>
>> In Open Source interface, pin is set to HIGH by driving pin to
>> HIGH and set to LOW by putting pin in high impedance.
>>
>> With above, the Open Drain/Source is unrelated to the active LOW/HIGH
>> in interface. There is interface where the enable/disable of interface
>> is ether active LOW or HIGH but it is Open Drain type.
>>
>> Hence decouple the Open Drain with Single Ended + Active LOW and
>> Open Source with Single Ended + Active HIGH.
>>
>> Adding different flag for the Open Drain/Open Source which is valid
>> only when Single ended flag is enabled.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Patch applied.
>
> Good that you found this and fixed it before someone git hurt.

Thanks you very much.


Now we are going to use the descriptor based GPIO APIs as this is very 
powerful and passing this info from DT is very useful.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
